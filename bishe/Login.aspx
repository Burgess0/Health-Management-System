<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>个人运动健康管理系统后台登录</title>
    <link rel="stylesheet" href="htstyle/css/login.css"/>
    <script src="htstyle/js/jquery-1.11.0.min.js"></script>
</head>

<body>
<img src="htstyle/images/loginImg.jpg" class="bgImg"/>
<form id="loginForm" name="loginForm" action="Login.aspx?ac=adminlogin&captch=a" method="post" onsubmit="return submitForm()">
    <div class="content">
        <div class="bidTitle">个人运动健康管理系统登录</div>
        <div class="logCon">
            <div class="line">
                <span>账号:</span>
                <input class="bt_input" type="text" id="username" name="username"/>
            </div>
            <div class="line">
                <span>密码:</span>
                <input class="bt_input" type="password" name="pwd" id="password"/>
            </div>
            <div class="line pagerandom">
                <span>验证码:</span>
                <input class="bt_input" type="text" id="pagerandom" name="pagerandom"/>
                <img src="Image.ashx" style="width: 60px;height: 30px;min-width: 60px;min-width: 30px;" onClick="this.src='Image.ashx?time='+new Date().getTime();">
            </div>
            <div class="line">
                <span>权限:</span>
                <select class="bt_input" name="cx">
                    <option value="管理员">管理员</option>
                    <option value="用户">用户</option>
                </select>
            </div>
            <button type="submit" class="logingBut">登录</button>
             
            
            
            
        </div>
           <a style="float: right;color: white" class="btn btn-success btn-xs" href="Yonghu_add.aspx" > 没有账号？立即注册 </a>

    </div>
</form>

<script>
    function submitForm() {
        var frm = $('#loginForm');
        var form = $(frm);
        var input;
        input = form.find('#username');
        if(input.val() == '')
        {
            alert('请填写账号');
            return false;
        }
        input = form.find('#password');
        if(input.val() == '')
        {
            alert('请填写密码');
            return false;
        }
        input = form.find('#pagerandom');
        if(input.val() == '')
        {
            alert('请填写验证码');
            return false;
        }
        return true;
    }
</script>

</body>

</html>