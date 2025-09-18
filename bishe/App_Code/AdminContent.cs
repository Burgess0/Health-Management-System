using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// AdminContent 后台页面、主要是判断是否登录没登录则弹出提示框的、继承至AppContent 这个类
/// </summary>
public class AdminContent : AppContent
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        object username = Session["username"];
        if (username == null || username.Equals(""))
        {
            showError("尚未登录");
        }

    }
    
}