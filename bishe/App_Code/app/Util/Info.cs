using System;
using System.IO;
using System.Collections;
using System.Text;
using System.Web;
using app.Common;
using app.Dbs;
using System.Collections.Generic;
namespace app.Util
{
    public class Info
    {
        // 获取当前时间
        static public string getDateStr()
        {
            return DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        }
        // 根据格式获取当前时间
        static public string date(string format)
        {
            return DateTime.Now.ToString(format);
        }
        /**
         * 获取所有子集下的id
         * @param table 表名
         * @param pid   父级字段
         * @param value 获取的所有子集
         * @return
         */
        public static string getAllChild( string table , string pid , object value)
        {
            List<Hashtable> templists = Db.name(table).select();
            return StringUtil.join(",",getAllChild( table ,  pid , value , templists));
        }
        // 获取所有子集信息
        public static List<string> getAllChild( string table , string pid , object value , List<Hashtable> templists)
        {
            List<string> ret = null;
            List<Hashtable> lists = templists;
            List<string> result = new List<string>();

            String parentid = Convert.ToString(value);
            result.Add(parentid);
            foreach (Hashtable child in lists){
                if(child[pid].Equals(parentid))
                {
                    ret = getAllChild( table , pid , child["id"] , templists );
                    if(ret.Count > 0){
                        result.AddRange(ret);
                    }
                }
            }
            return result;
        }
        // 获取当前时间戳
        static public long time()
        {
            TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            return Convert.ToInt64(ts.TotalSeconds);
        }
        // 根据格式化日期
        static public string date(string format, DateTime date)
        {
            return date.ToString(format);
        }
        // 格式化HTML 代码
        static public string html(object str)
        {
            var st = str == null ? "" : str.ToString();
            return HttpUtility.HtmlEncode(str);
        }
        // 获取图片集中的第一个图片
        static public string images(object image)
        {
            var img = image.ToString().Split(',');
            return img[0];
        }
        // JSON 数据编码
        public static string jsonEncode(object source)
        {
            return fastJSON.JSON.ToJSON(source);
        }
        // JSON 数据的解码
        public static Dictionary<string,object> jsonDecode(object source)
        {
            if (source == null)
            {
                return new Dictionary<string,object>();
            }

            return (Dictionary<string, object>)fastJSON.JSON.Parse(Convert.ToString(source));
        }
        // 字符串分割
        public static string[] objectSplit(string exp,object source)
        {
            if (source == null)
            {
                return new string[] { };
            }
            string value = Convert.ToString(source);
            return value.Split(exp.ToCharArray());
        }
        // 获取树形框选项值
        public static string getTreeOption(string table , string pid , string name , object value)
        {
            List<string> items = new List<string>();
            string parentid = Convert.ToString(value);
            do {
                Hashtable mp = Db.name(table).find(parentid);
                if(mp.Count == 0){
                    break;
                }
                items.Add(mp[name].ToString());
                parentid = mp[pid].ToString();

            }while ( !parentid.Equals("") && !parentid.Equals("0") );

            items.Reverse(); // 翻转list

            return StringUtil.join(" ",items);
        }
        // 获取JSON 对象
        static public string address(object add)
        {
            var img = (Dictionary<string,object>)fastJSON.JSON.Parse(add.ToString());
            if (img.ContainsKey("address"))
            {
                return img["address"].ToString();
            }
            return "";
        }

        // 截取字符串
        public static string substr(object source, int length)
        {
            return subStr(source , length);
        }

        // 截取字符串
        public static string subStr(object source, int length , string append = "...")
        {
            string result = delHTMLTag(source.ToString());
            if(result.Length > length){
                result =  result.Substring(0, length) + append;
            }
            return result;
        }




        // 删除HTML 的标签如： <a>ffff</a> 将变成： ffff
        public static string delHTMLTag(string htmlStr)
        {
            string strText = System.Text.RegularExpressions.Regex.Replace(htmlStr, "<[^>]+>", "");
            strText = System.Text.RegularExpressions.Regex.Replace(strText, "&[^;]+;", "");
            return strText;
        }

        // 生成一个编号
        public static string getID()
        {
            string rand = randomNumber(4);
            return Info.date("MMddHHmmss") + rand;
        }
        // 随机生成一个字符传
        static public string randomNumber(int size)
        {
            Random rd = new Random();
            StringBuilder builder = new StringBuilder(size);
            for (int i = 0; i < size; i++)
            {
                builder.Append(rd.Next(0,9));
            }
            return builder.ToString();
        }
        // 根据时间戳生成 时间
        static public string date(string format, long timeStamp)
        {
            DateTime dtStart = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970,1,1));
            long lTime=((long)timeStamp*10000000);
            TimeSpan toNow = new TimeSpan(lTime);
            DateTime targetDt = dtStart.Add(toNow);

            return date(format , targetDt);
        }

    }
}
