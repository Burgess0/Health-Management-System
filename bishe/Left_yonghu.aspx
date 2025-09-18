<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left_yonghu.aspx.cs" Inherits="Left_yonghu" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<li class="layui-nav-item">
    <a class="" href="javascript:;"> 健康管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Jiankang_add.aspx" target="main_self_frame">健康添加</a></dd>
                        <dd><a href="Jiankang_list_yonghu.aspx" target="main_self_frame">健康信息</a></dd>
                        <dd><a href="jiankangtongji.aspx" target="main_self_frame">健康统计</a></dd>
                        <dd><a href="leixingtongji.aspx" target="main_self_frame">运动统计</a></dd>
            </dl>
</li>
<li class="layui-nav-item">
    <a class="" href="javascript:;"> 购物管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Gouwuche_list_goumairen.aspx" target="main_self_frame">我的购物车</a></dd>
                        <dd><a href="Dingdan_list_xiadanren.aspx" target="main_self_frame">我的订单</a></dd>
                        <dd><a href="Fahuo_list_xiadanren.aspx" target="main_self_frame">配送查询</a></dd>
                        <dd><a href="Qianshou_list_qianshouren.aspx" target="main_self_frame">签收记录</a></dd>
            </dl>
</li>
<li class="layui-nav-item">
    <a class="" href="javascript:;"> 咨询管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Liuyanban_list_liuyanren.aspx" target="main_self_frame">我的咨询</a></dd>
            </dl>
</li>
<li class="layui-nav-item">
    <a class="" href="javascript:;"> 评论管理 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Pinglun_list_pinglunren.aspx" target="main_self_frame">评论记录</a></dd>
                        <dd><a href="Pinglunhuifu_list_huifuren.aspx" target="main_self_frame">回复记录</a></dd>
            </dl>
</li>
<li class="layui-nav-item">
    <a class="" href="javascript:;"> 个人中心 </a>
    <dl class="layui-nav-child">
                        <dd><a href="Yonghu_updtself.aspx" target="main_self_frame">修改个人资料</a></dd>
                        <dd><a href="ChangePassword.aspx" target="main_self_frame">修改密码</a></dd>
                        <dd><a href="Shoucang_list_username.aspx" target="main_self_frame">我的收藏</a></dd>
            </dl>
</li>
