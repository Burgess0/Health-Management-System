<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Zixunxinxidetail.aspx.cs" Inherits="Zixunxinxidetail" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>
<% Server.Execute("Header.aspx"); %>





<div>

    
<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                    

<div class="news-info">
    <h3 class="title">
        <%= map["biaoti"] %>
    </h3>
    <div class="descount">
                    <span class="title">
                    分类：
                    <%  var mapzixunfenlei5 = Dao.find("SELECT fenleimingcheng,id FROM zixunfenlei where id='"+map["fenlei"]+"'");  %><%= mapzixunfenlei5["fenleimingcheng"] %>                </span>
                    <span class="title">
                    点击率：
                    <%= map["dianjilv"] %>                </span>
                    <span class="title">
                    添加人：
                    <%= map["tianjiaren"] %>                </span>
        
            <% var shoucangCount = Db.name("shoucang").@where("biao", "zixunxinxi").@where("xwid", map["id"]).field("count(*) as count").find();
 %>
    <%  if(Session["username"] != null && !("".Equals(Session["username"])) ){  %>
    <% var shoucang = Db.name("shoucang").@where("biao", "zixunxinxi").@where("xwid", map["id"]).@where("username", Session["username"]).field("count(*) as count").find();
 %>

    <button type="button" class="btn btn-default btn-collects-click" data-url="Shoucangadd.aspx?f=f&xwid=<%= map["id"] %>&biao=zixunxinxi&biaoti=<%= map["biaoti"] %>" data-confirm="取消收藏" data-text="收藏" data-is-zan="<%= shoucang["count"] %>" data-count="<%= shoucangCount["count"] %>">
    
    
</button>
    <%  } else {   %>
    <button type="button" class="btn btn-default btn-xs" onclick="alert('请登录后操作')">
    
        收藏        <span class="badge">
            <%= shoucangCount["count"] %>
        </span>
    
</button>
    <% } %>

<script>
    encodeURIComponent(location.href);

</script>


    </div>
    <div class="content">
        <%= map["neirong"] %>    </div>
</div>


        
    
<!-- container定宽，并剧中结束 --></div>


</div>


<% Server.Execute("Footer.aspx"); %>
<% Server.Execute("Foot.aspx"); %>