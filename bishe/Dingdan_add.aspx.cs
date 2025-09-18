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
 *  订单 模块添加页面、和插入数据库 */
public partial class Dingdan_add : AppContent
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["f"] != null){  // 判断是否有
            handler();  // 处理订单模块的数据插入
            return;
        }
    }

    // 执行插入到数据库中

    protected void handler()
    {
        var post = getRequestForm();


                post["iszf"] = "否";
    

        var charuid = Db.name("dingdan").insert(post);
        Dao.execute("INSERT INTO dingdanshangpin(dingdanid,shangpinid,bianhao,mingcheng,fenlei,jiage,goumaishu,xiaoji,goumairen,addtime)  SELECT '"+ charuid +"',shangpinid,bianhao,mingcheng,fenlei,jiage,goumaishu,xiaoji,goumairen,addtime  FROM gouwuche  WHERE goumairen='"+ Session["username"] +"' AND id in("+ Request["targetIds"] +")");

Dao.execute("DELETE FROM gouwuche WHERE goumairen='"+ Session["username"] +"' AND id in("+ Request["targetIds"] +")");


        showSuccess("保存成功" , Req.get("referer").Equals("") ? Request.Headers["referer"] : Req.get("referer"));  // 弹出保存成功提示窗

    }

}
