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
*  商品 模块的前台详情页面
*
*/
public partial class Shangpindetail : AppContent
{
    // 获取的商品模块的数据
    protected Hashtable map = null;

    // 页面加载成功后执行这个页面
    protected void Page_Load(object sender, EventArgs e)
    {
            var id = Req.get("id"); // 获取网址参数id
        map = Db.name("shangpin").find(id); // 根据id 获取一行数据
        

    }


}
