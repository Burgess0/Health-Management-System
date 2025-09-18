using app.Util;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.SessionState;

/// <summary>
/// AppContent 前端页面的基类、继承自UI.Page 这个类 这个是显示 webform 的类
/// </summary>
abstract public class AppContent : System.Web.UI.Page
{
    // 判断是否有登录
    public bool checkLogin()
    {
        return Session["username"] != null && !Session["username"].Equals("");
    }

    // 弹出提示框、并跳转到指定页面
    virtual public void showMessage(string message , string uri = "history.go(-1)")
    {
        Response.Clear();
        Response.Write("<script>");
        Response.Write("alert('"+message+"');");
        if (uri.Equals("history.go(-1)"))
        {
            Response.Write(uri);
        }
        else 
        {
            Response.Write("location.href='"+uri+"'");
        }
        Response.Write("</script>");
        Response.End();
    }
    // 弹出提示框、并跳转到指定页面
    virtual public void showSuccess(string message , string uri = "")
    {
        if (uri == null || uri.Equals(""))
        {
            uri = Request.Headers["referer"];
        }
        showMessage(message, uri);
    }
    // 弹出提示框、并跳转到上一页
    virtual public void showError(string message)
    {
        showMessage(message);
    }

    // 获取前端填写的表单并写进table对象中
    protected Hashtable getRequestForm()
    {
        Hashtable table = new Hashtable();
        setTable(table, Request.QueryString);
        setTable(table, Request.Form);
        return table;
    }
    // 将form 对象 保存到 table 对象中
    private void setTable(Hashtable table, NameValueCollection form)
    {
        for (int i = 0; i < form.Count; i++)
        {
            var name = form.GetKey(i);
            var value = form.GetValues(i);
            table.Add(name, StringUtil.join(",", value));
        }
    }


    // 执行这个方法主要是判断 前端网址中使用有a 参数、有的话执行相应的方法
    protected void InvokeAction()
    {
        if (Request["a"] != null)
        {
            string action = Request["a"]; // 获取网址上的 a 参数有则 执行该方法
            Type obj = this.GetType();  // 获取当前类的Type 映射对象
            MethodInfo method = obj.GetMethod(action); // 获取映射方法的信息
            if (method != null) // 该方法存在
            {
                object result = null;  // 该方法执行返回的参数
                try
                {
                    result = method.Invoke(this, null); // 执行该方法
                }
                catch (TargetInvocationException ex)  // 抛出的异常
                {
                    Console.WriteLine(ex.GetBaseException().Message); // 获取该方法执行遇到的错误
                    return;
                }


                if (result != null)
                {
                    Response.Write(result);
                }
                Response.End();
            }
            
        }
    }

}