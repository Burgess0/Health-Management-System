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
 *  订单 模块的详情页面
 *
 */
public partial class Dingdan_detail : AppContent
{
    protected Hashtable map = null;

    // 页面加载成功后执行这个页面
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Req.get("id");  // 获取地址栏上面的id
        map = Db.name("dingdan").find(id);  // 根据id 获取订单模块数据
    }


}