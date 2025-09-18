<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left_guanliyuan.aspx.cs" Inherits="Left_guanliyuan" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<li class="layui-nav-item">
    <a class="" href="javascript:;"> 账号管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Admins_list.aspx" target="main_self_frame">账号管理</a></dd>
                        <dd><a href="Admins_add.aspx" target="main_self_frame">账号添加</a></dd>
                        <dd><a href="ChangePassword.aspx" target="main_self_frame">密码修改</a></dd>
            </dl>
</li>
<li class="layui-nav-item">
    <a class="" href="javascript:;"> 用户管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Yonghu_list.aspx" target="main_self_frame">注册用户管理</a></dd>
                        <%--<dd><a href="Yonghu_add.aspx" target="main_self_frame">添加新用户</a></dd>--%>
            </dl>
</li>
<li class="layui-nav-item">
    <a class="" href="javascript:;"> 资讯管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Zixunfenlei_add.aspx" target="main_self_frame">分类添加</a></dd>
                        <dd><a href="Zixunfenlei_list.aspx" target="main_self_frame">分类查询</a></dd>
                        <dd><a href="Zixunxinxi_add.aspx" target="main_self_frame">资讯添加</a></dd>
                        <dd><a href="Zixunxinxi_list.aspx" target="main_self_frame">资讯查询</a></dd>
            </dl>
</li>
<li class="layui-nav-item">
    <a class="" href="javascript:;"> 评论管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Pinglun_list.aspx" target="main_self_frame">评论记录</a></dd>
                        <dd><a href="Pinglunhuifu_list.aspx" target="main_self_frame">回复记录</a></dd>
            </dl>
</li>
<li class="layui-nav-item">
    <a class="" href="javascript:;"> 商品管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Shangpin_add.aspx" target="main_self_frame">商品添加</a></dd>
                        <dd><a href="Shangpin_list.aspx" target="main_self_frame">商品查询</a></dd>
                        <dd><a href="Fenlei_add.aspx" target="main_self_frame">分类添加</a></dd>
                        <dd><a href="Fenlei_list.aspx" target="main_self_frame">分类查询</a></dd>
            </dl>
</li>
<li class="layui-nav-item">
    <a class="" href="javascript:;"> 订单管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Dingdan_list.aspx" target="main_self_frame">订单查询</a></dd>
                        <dd><a href="Fahuo_list.aspx" target="main_self_frame">发货查询</a></dd>
                        <dd><a href="Qianshou_list.aspx" target="main_self_frame">签收查询</a></dd>
            </dl>
</li>
<li class="layui-nav-item">
    <a class="" href="javascript:;"> 健康管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Jiankang_list.aspx" target="main_self_frame">健康查询</a></dd>
            </dl>
</li>
<li class="layui-nav-item">
    <a class="" href="javascript:;"> 运动类型管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Leixing_add.aspx" target="main_self_frame">运动类型添加</a></dd>
                        <dd><a href="Leixing_list.aspx" target="main_self_frame">运动类型查询</a></dd>
            </dl>
</li>
<li class="layui-nav-item">
    <a class="" href="javascript:;"> 系统管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Youqinglianjie_add.aspx" target="main_self_frame">友情链接添加</a></dd>
                        <dd><a href="Youqinglianjie_list.aspx" target="main_self_frame">友情链接查询</a></dd>
                        <dd><a href="Lunbotu_add.aspx" target="main_self_frame">轮播图添加</a></dd>
                        <dd><a href="Lunbotu_list.aspx" target="main_self_frame">轮播图查询</a></dd>
                        <dd><a href="Liuyanban_list.aspx" target="main_self_frame">留言管理</a></dd>
            </dl>
</li>
