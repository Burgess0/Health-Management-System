using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;
using System.Collections;
using System.Collections.Specialized;

public partial class Pay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonClick(object sender, EventArgs e)
    {
        var id = Request["id"];
        var biao = Request["biao"];
        var zongji = Request["zongji"];
        if (string.IsNullOrEmpty(zongji))
        {

        }

        Hashtable hashtable = new Hashtable();
        hashtable["iszf"] = "是";

        Db.name(biao).@where("id", id).update(hashtable);
        var order = Db.name(biao).@where("id" , id).find();
                    if("dingdan" == biao)
            {
            Dao.execute("UPDATE shangpin s,dingdanshangpin ds SET s.xiaoliang=s.xiaoliang+ds.goumaishu,s.kucun=s.kucun-ds.goumaishu WHERE s.id=ds.shangpinid AND dingdanid='"+ order["id"] +"'");

Dao.execute("UPDATE dingdan SET zhuangtai='待发货' WHERE id='"+ order["id"] +"'");


            }
        

        var param = new NameValueCollection();
        param["id"] = id;
        param["referer"] = string.IsNullOrEmpty(Request["referer"]) ? "Sy.aspx" : Request["referer"];

        Response.Write("<script>alert('支付成功!!');opener.location.reload();window.close();</script>");
        Response.End();
    }
}
