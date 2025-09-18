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
 *  资讯信息 模块添加页面、和插入数据库 */
public partial class Zixunxinxi_add : AppContent
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["f"] != null){  // 判断是否有
            handler();  // 处理资讯信息模块的数据插入
            return;
        }
    }

    // 执行插入到数据库中

    protected void handler()
    {
        var post = getRequestForm();
post["neirong"] =  app.Util.DownloadRemoteImage.download(post["neirong"]); //从富文本编辑器中将远程图片保存在本地中


        

        var charuid = Db.name("zixunxinxi").insert(post);
                showSuccess("保存成功" , Req.get("referer").Equals("") ? Request.Headers["referer"] : Req.get("referer"));  // 弹出保存成功提示窗

    }

}
