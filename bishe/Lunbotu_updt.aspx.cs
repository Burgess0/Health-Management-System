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
 *  轮播图 模块更新页码、执行更新数据库 */
public partial class Lunbotu_updt : AppContent
{
    protected Hashtable mmm = null;  // 从数据库中获取的数据
    protected int updtself = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["f"] != null){  // 判断是否有
            handler();  // 处理轮播图模块的数据插入
            return;
        }
        var id = Req.get("id"); // 获取id
        mmm = Db.name("lunbotu").find(id); // 根据id从模块中获取的一行数据
    }

    // 执行更新数据库

    protected void handler()
    {
        var post = getRequestForm();

                Db.name("lunbotu").update(post);
        var charuid = post["id"];
                showSuccess("保存成功" , Req.get("referer").Equals("") ? Request.Headers["referer"] : Req.get("referer"));  // 弹出保存成功提示窗

    }

}
