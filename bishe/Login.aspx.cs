﻿using app.Dbs;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : AppContent
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if( Request["ac"] != null ) // 判断有没有点击登录按钮，有则执行登录
        {
            string username = Request.Form["username"];
            string password = Request.Form["pwd"];
            string cx       = Request.Form["cx"];
            authLoginUser(Request["ac"].Equals("adminlogin") , username , password , cx );
        }
    }

    //  执行登录
    protected void authLoginUser(bool isAdmin, string username, string pwd, string cx)
    {
        if (string.IsNullOrEmpty(username))  // 检测有没有填写账号
        {
            showMessage("账号不允许为空");  // 没填写则提示账号不允许为空
        }

        if (string.IsNullOrEmpty(pwd))  // 检测有没有填写密码
        {
            showError("密码不允许为空");  // 没有则提示密码不允许为空
        }

        if (string.IsNullOrEmpty(cx))
        {
            showError("请选择登录类型");
        }

        object random = Session["random"];  // 获取Image.ashx 生成的验证码 的字符串
        string pagerandom = Request.Form["pagerandom"];  // 获取前台填写的验证码
        string captch = Request.Params["captch"];  //
        if (!string.IsNullOrEmpty(captch))
        {
            if (string.IsNullOrEmpty(pagerandom)) // 验证验证码有没有填写、没填则提示 请填写验证码
            {
                showError("请填写验证码");
            }
            if (!pagerandom.Equals(random))  // 验证验证码是否正确、不正确则提示 请填写验证码
            {
                showError("验证码不正确");
            }
        }

        Db db = new Db();  //  创建Db 数据库实例
        bool issh = false;
        bool iscx = false;

        if(cx.Equals("管理员"))
        {
                        db.setName("admins").@where("username", username).@where("pwd", pwd);
                                }
        if(cx.Equals("用户"))
        {
                        db.setName("yonghu").@where("yonghuming", username).@where("mima", pwd);
                                }

        Hashtable data = db.find(); // 获取设置参数后信息
        if (data.Count == 0) // 没获取到用户信息、则提示 帐号或密码错误
        {
            showError("帐号或密码错误");
        }
        if (issh && !data["issh"].Equals("是")) // 需要验证账号的审核
        {
            showError("帐号审核中，请联系管理员审核");
        }

        Session.Clear(); // 清除当前session
        Session["username"] = username; // 设置账号
        Session["cx"] = iscx ? data["cx"] : cx;
        Session["login"] = cx;
        foreach (var key in data.Keys)
        {
            string k = (string)key;
            Session[k] = data[key];
        }
        if (isAdmin)  // 判断如果是后台登录则跳转到后台
        {
            showSuccess("登录成功", "main.aspx");
        }
        var referer = Request.Params["referer"] != null ? Request.Params["referer"] : "./";
        showSuccess("登录成功", referer); // 前台登录则跳转到前台
    }

}