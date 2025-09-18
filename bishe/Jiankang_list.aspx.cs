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
public partial class Jiankang_list : AppContent
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
        
                if(!Req.get("riqi_start").Equals("")) {
            where += " AND riqi >='"+Req.get("riqi_start")+"' ";
        }
        if(!Req.get("riqi_end").Equals("")) {
            where += " AND riqi <= '"+Req.get("riqi_end")+"' ";
        }
            if(!Req.get("shengao_start").Equals("")) {
            where += " AND shengao >='"+Req.get("shengao_start")+"' ";
        }
        if(!Req.get("shengao_end").Equals("")) {
            where += " AND shengao <= '"+Req.get("shengao_end")+"' ";
        }
            if(!Req.get("yundongleixing").Equals("")) {
            where += " AND yundongleixing ='"+Req.get("yundongleixing")+"' ";
        }
            return where;
    }

    public object getList()
    {
        where   =  getWhere();  // 获取前台搜索表单的信息值、并写成sql 条件语句
        orderby =  Req.get("orderby" , "id");  // 获取排序信息
        sort    =  Req.get("sort" , "desc");  // 获取升序还是降序

                
        
        var     query = Db.name("jiankang").@where(where).order(orderby,sort);
        lists    = query.page(12);


        
        
        return fastJSON.JSON.ToJSON(lists);
    }

    // GET jiankang_list.aspx?a=delete
    // 删除数据
    public void delete()
    {
        string id = Request["id"];
        string sql = "DELETE FROM jiankang WHERE id='"+id+"'";
        var dmap = Db.name("jiankang").find(id);
                Dao.execute(sql);
                showSuccess("删除成功");
    }

    
    }
