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
 *  收藏 模块添加页面、和插入数据库 */
public partial class Shoucangadd : AppContent
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!checkLogin()){ // 判断是否有登录、没有则弹出提示框尚未登录，请登录后操作
            showError("尚未登录，请登录后操作");
        }
        if(Request["f"] != null){  // 判断是否有
            handler();  // 处理收藏模块的数据插入
            return;
        }
    }

    // 执行插入到数据库中

    protected void handler()
    {
        var post = getRequestForm();
post["username"] = Session["username"];
post["addtime"] = Info.getDateStr();


        
        var res = Db.name("shoucang")
            .where("biao" , post["biao"])
            .where("xwid" , post["xwid"])
            .where("username" , Session["username"])
            .find();
        if(res.Count > 0){
            Db.name("shoucang").where("id" , res["id"]).delete();
            showSuccess("已取消收藏");
            return;
        }


        var charuid = Db.name("shoucang").insert(post);
                showSuccess("保存成功" , Req.get("referer").Equals("") ? Request.Headers["referer"] : Req.get("referer"));  // 弹出保存成功提示窗

    }

}
