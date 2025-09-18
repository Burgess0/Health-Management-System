<%@ WebHandler Language="C#" Class="Collect" %>

using System;
using System.Web;
using app.Util;
using app.Dbs;

public class Collect : ActionBase
{
    // 执行加入收藏
    public override void processInit(HttpContext context) {
        if (!checkLogin()) // 检测是否登录
        {
            showError("尚未登录，请登录后操作");
        }
        System.Collections.Hashtable row = new System.Collections.Hashtable();
        row["xwid"] = Req.get("id");      // 对应表的id
        row["biao"] = Req.get("biao");    // 对应表的名称
        row["ziduan"] = Req.get("ziduan");  // 对应表的字段
        row["biaoti"] = Db.name(Req.get("biao")).@where("id", Req.get("id")).value(Req.get("ziduan"));  // 获取对应表的标题
        row["url"] = Request.Headers["referer"];  // 获取上一页的地址
        row["addtime"] = Info.getDateStr();     //  设置收藏时间
        row["username"] = Session["username"];  // 设置用户名
        Db.name("shoucangjilu").insert(row);    // 插入收藏记录
        showSuccess("收藏成功", Request.Headers["referer"]);  // 弹出提示框 提示收藏成功
    }
}