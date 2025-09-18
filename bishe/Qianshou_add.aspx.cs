using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;
using System.Collections;

/**
 *  签收 模块添加页面、和插入数据库 */
public partial class Qianshou_add : AppContent
{
    protected Hashtable readMap = null;  // 从模块中获取的一行数据

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["f"] != null){  // 判断是否有
            handler();  // 处理签收模块的数据插入
            return;
        }
        var id = Req.get("id"); // 获取网址中的id 参数
        readMap = Db.name("dingdan").find(id);// 根据id参数从模块中获取的一行数据
    }

    // 执行插入到数据库中

    protected void handler()
    {
        var post = getRequestForm();


        

        var charuid = Db.name("qianshou").insert(post);
        Dao.execute("UPDATE dingdan SET zhuangtai='已签收' WHERE id='"+ Request["dingdanid"] +"'");


        showSuccess("保存成功" , Req.get("referer").Equals("") ? Request.Headers["referer"] : Req.get("referer"));  // 弹出保存成功提示窗

    }

}
