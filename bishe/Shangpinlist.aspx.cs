using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;

/**
 *  列表页面
 *
 */
public partial class Shangpinlist : AppContent
{
    // sql 查询条件
    protected string where = "";
    // sql 语句 order by 排序语句
    protected string orderby = "";
    // sql 语句 只有 desc 和 asc 两个选项，desc 从大到小排序，asc 从小到大排序
    protected string sort = "";
        protected Collect<Hashtable> lists = null;  // 分页列表
        
    // 加载完成后运行该方法
    protected void Page_Load(object sender, EventArgs e)
    {
                InvokeAction();  // 查看有没有 a=某某 的参数有则运行如：a=delete  有则执行下面的delete方法
        getList();   // 获取列表信息
    }

    // 根据条件编写
    public string getWhere()
    {
        string where = " 1=1 ";
                if(!Req.get("keyword").Equals("")){
            where += "  AND  ( mingcheng LIKE '%"+Req.get("keyword")+"%' )  ";
        }
        
                if(!Req.get("mingcheng").Equals("")) {
            where += " AND mingcheng LIKE '%"+Req.get("mingcheng")+"%' ";
        }
        if(!Req.get("fenlei").Equals("")) {
            where += " AND fenlei ='"+Req.get("fenlei")+"' ";
        }
            if(!Req.get("jiage_start").Equals("")) {
            where += " AND jiage >='"+Req.get("jiage_start")+"' ";
        }
        if(!Req.get("jiage_end").Equals("")) {
            where += " AND jiage <= '"+Req.get("jiage_end")+"' ";
        }
            return where;
    }

    public object getList()
    {
        where   =  getWhere();  // 获取前台搜索表单的信息值、并写成sql 条件语句
        orderby =  Req.get("orderby" , "id");  // 获取排序信息
        sort    =  Req.get("sort" , "desc");  // 获取升序还是降序

                    where += " AND issh='是' ";  // 前台的必须是审核通过后才显示
                
        
        var     query = Db.name("shangpin").@where(where).order(orderby,sort);
        lists    = query.page(12);


        
        
        return fastJSON.JSON.ToJSON(lists);
    }

    // GET shangpin_list.aspx?a=delete
    // 删除数据
    public void delete()
    {
        string id = Request["id"];
        string sql = "DELETE FROM shangpin WHERE id='"+id+"'";
        var dmap = Db.name("shangpin").find(id);
                Dao.execute(sql);
                showSuccess("删除成功");
    }

    
    }
