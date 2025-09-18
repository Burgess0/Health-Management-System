using System;
using System.Collections;
using app.Util;

namespace app.Dbs.Builder
{
    public class SqlServer : Builders
    {
        protected string pageSql  = "SELECT T1.* FROM (SELECT build.*, ROW_NUMBER() OVER (%ORDER%) AS ROW_NUMBER FROM (SELECT %DISTINCT% %FIELD% FROM %TABLE%%JOIN%%WHERE%%GROUP%%HAVING%) AS build) AS T1 %LIMIT%";
        public SqlServer(Db db) : base(db)
        {
        }
        
        override protected string getSelectSql() {
            if(isPage()){
                return pageSql;
            }
            string sql = "SELECT %LIMIT% %DISTINCT% %FIELD% FROM %TABLE%%FORCE%%JOIN%%WHERE%%GROUP%%HAVING%%ORDER% %LOCK%";
            return sql;
        }
        
        override public string parseIfNull(string func, string str) {
            return "ISNULL("+func+" , "+str+")";
        }
        
        override public string parseOrder() {
            ArrayList list = (ArrayList) db.getOption()["order"];
            if(list == null || list.Count == 0){
                return isPage() ? " ORDER BY rand() " : "";
            }
            else
            {
                for (var j=0;j<list.Count;j++)
                {
                    var obj = list[j];
                    string str = obj.ToString();
                    string[] arrs = str.Split(',');
                    for (int i=0; i < arrs.Length;i++)
                    {
                        var s = arrs[i];
                        if (s.IndexOf(".") != -1 && isPage())
                        {
                            string[] ss = s.Split('.');
                            arrs[i] = "build." + ss[1];
                        }
                    }
                    list[j] = StringUtil.@join(",",arrs);
                }
            }
            return base.parseOrder();
        }
        
        override protected string getTableFind(string name) {
            return "SELECT top 1 * FROM "+name+" WHERE 1=1";
        }
        
        override protected string parseLimit() {
            Hashtable map = (Hashtable) db.getOption()["limit"];
            if(map == null){
                return "";
            }
            string offset = (string) map["offset"];
            string limit  = (string) map["limit"];
            string limitStr = " WHERE ";
            if(!isPage()){
                return "TOP "+limit;
            }else{
                if(offset == null){
                    limitStr += "(T1.ROW_NUMBER BETWEEN 1 AND " + limit + ")";
                }else{
                    limitStr += "(T1.ROW_NUMBER BETWEEN "+ offset +"+1 AND "+offset+" + "+limit+" )";
                }
                return limitStr;
            }
        }
        override protected string formatString(object val)
        {
            var str = Convert.ToString(val);
            return "'" + str.Replace("'", "''") + "'";
        }
    }
}