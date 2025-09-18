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
 *  购物车 模块添加页面、和插入数据库 */
public partial class Gouwuche_add : AppContent
{
    protected Hashtable readMap = null;  // 从模块中获取的一行数据

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["f"] != null){  // 判断是否有
            handler();  // 处理购物车模块的数据插入
            return;
        }
        var id = Req.get("id"); // 获取网址中的id 参数
        readMap = Db.name("shangpin").find(id);// 根据id参数从模块中获取的一行数据
    }

    // 执行插入到数据库中

    protected void handler()
    {
        var post = getRequestForm();
post["addtime"] = Info.getDateStr();


        

        var charuid = Db.name("gouwuche").insert(post);
        Dao.execute("UPDATE gouwuche SET xiaoji=(goumaishu*jiage) WHERE id='"+ charuid +"'");


        showSuccess("保存成功" , Req.get("referer").Equals("") ? Request.Headers["referer"] : Req.get("referer"));  // 弹出保存成功提示窗

    }

}
