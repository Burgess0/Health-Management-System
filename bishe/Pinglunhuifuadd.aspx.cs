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
 *  评论回复 模块添加页面、和插入数据库 */
public partial class Pinglunhuifuadd : AppContent
{
    protected Hashtable readMap = null;  // 从模块中获取的一行数据

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!checkLogin()){ // 判断是否有登录、没有则弹出提示框尚未登录，请登录后操作
            showError("尚未登录，请登录后操作");
        }
        if(Request["f"] != null){  // 判断是否有
            handler();  // 处理评论回复模块的数据插入
            return;
        }
        var id = Req.get("id"); // 获取网址中的id 参数
        readMap = Db.name("pinglun").find(id);// 根据id参数从模块中获取的一行数据
    }

    // 执行插入到数据库中

    protected void handler()
    {
        var post = getRequestForm();
post["addtime"] = Info.getDateStr();


        

        var charuid = Db.name("pinglunhuifu").insert(post);
                showSuccess("保存成功" , Req.get("referer").Equals("") ? Request.Headers["referer"] : Req.get("referer"));  // 弹出保存成功提示窗

    }

}
