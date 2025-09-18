<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Footer.aspx.cs" Inherits="Footer" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>


    

<div class="footer mt10">
                <% var likeList = Db.name("youqinglianjie").@order("id desc").select();
 %>

        <div class="copyrightnr link">
            友情链接 
            <%  foreach(var v in likeList )
{ 
 %>
            <a href="<%= v["wangzhi"] %>" target="_blank"><%= v["wangzhanmingcheng"] %></a>  
            <% } %>
        </div>
        
        <div class="copyrightnr">
            地址：xxxxxxxxxxxxx　　电话：0000-00000000　　手机：12312312312
            <br></br>
            版权所有：个人运动健康管理系统 　　ICP备********号        </div>
    </div>



