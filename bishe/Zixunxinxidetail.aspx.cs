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
*  资讯信息 模块的前台详情页面
*
*/
public partial class Zixunxinxidetail : AppContent
{
    // 获取的资讯信息模块的数据
    protected Hashtable map = null;

    // 页面加载成功后执行这个页面
    protected void Page_Load(object sender, EventArgs e)
    {
            var id = Req.get("id"); // 获取网址参数id
        map = Db.name("zixunxinxi").find(id); // 根据id 获取一行数据
        Dao.execute("UPDATE zixunxinxi SET dianjilv=dianjilv+1 WHERE id="+ Request["id"] +"");




    }


}
