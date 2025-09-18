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
 *  健康 模块添加页面、和插入数据库 */
public partial class Jiankang_add : AppContent
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["f"] != null){  // 判断是否有
            handler();  // 处理健康模块的数据插入
            return;
        }
    }

    // 执行插入到数据库中

    protected void handler()
    {
        var post = getRequestForm();
post["addtime"] = Info.getDateStr();


        

        var charuid = Db.name("jiankang").insert(post);
        Dao.execute("UPDATE jiankang SET bmi=((tizhong/((shengao/100)*(shengao/100)))) WHERE id='"+ charuid +"'");


        showSuccess("保存成功" , Req.get("referer").Equals("") ? Request.Headers["referer"] : Req.get("referer"));  // 弹出保存成功提示窗

    }

}
