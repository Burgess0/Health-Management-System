<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Zixunxinxilist.aspx.cs" Inherits="Zixunxinxilist" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>
<% Server.Execute("Header.aspx"); %>


<div style="margin:20px 0 0 0">


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->


        <div class="">
            <div style="margin-bottom: 20px">


                <form action="?" class="search">
                    <table class="jd-search">
                        <tbody>
                        <tr>
                            <td class="label1">
                                标题
                            </td>
                            <td class="form-inline">
                                <input type="text" class="form-control" style="width: 150px" name="biaoti" value="<%= Request["biaoti"] %>" placeholder="请输入关键词"/>
                                <button type="submit" class="btn btn-default">
                                    搜索
                                </button>
                            </td>
                        </tr>

                        <tr>
                            <td class="label1">
                                分类
                            </td>
                            <td class="form-inline">
                                <p class="search-radio">
                                    <input type="hidden" name="fenlei" value="<%= Request["fenlei"] %>"/>
                                    <a href="javascript:;" data-value="" onclick="selectRadio(this)">全部</a>
                                    <% var mapzixunfenlei3 = Dao.select("SELECT id,fenleimingcheng FROM zixunfenlei"); %> <% foreach (var r in mapzixunfenlei3)
                                                                                                                             {
                                                                                                                          %>
                                        <a href="javascript:;" data-value="<%= r["id"] %>" onclick="selectRadio(this)"><%= r["fenleimingcheng"] %></a>
                                    <% } %>
                                </p>
                            </td>
                        </tr>

                        <%--<tr>
                            <td class="label1">排序</td>
                            <td class="form-inline">
                                <p class="search-radio">
                                    <input type="hidden" name="orderby" value="<%= orderby %>"/>
                                    <a href="javascript:;" data-value="id" onclick="selectRadio(this)">发布时间</a>
                                </p>
                            </td>
                        </tr>--%>

                        </tbody>
                    </table>
                </form>


            </div>
            <div class="news-list">
                <ul>
                    <% foreach (var r in lists)
                       {
                    %>
                        <li class="clearfix">
                            <a href="Zixunxinxidetail.aspx?id=<%= r["id"] %>">
                                <div class="thumb">
                                    <div class="img-box pb100">
                                        <div class="img" style="background-image: url('<%= r["tupian"] %>')"></div>
                                    </div>
                                </div>
                            </a>

                            <div class="news-content-text ">
                                <a href="Zixunxinxidetail.aspx?id=<%= r["id"] %>">
                                    <h3><%= r["biaoti"] %></h3>
                                </a>
                                <div class="description">
                                    <%= Info.subStr(r["neirong"], 80) %>
                                </div>
                                <div class="other-content">
                                    <span>添加人：<%= r["tianjiaren"] %></span>
                                    <span>点击率：<%= r["dianjilv"] %></span>
                                    <span>分类：<% var mapzixunfenlei4 = Dao.find("SELECT fenleimingcheng,id FROM zixunfenlei where id='" + r["fenlei"] + "'"); %><%= mapzixunfenlei4["fenleimingcheng"] %></span>
                                </div>
                            </div>
                        </li>
                    <% } %>
                </ul>
            </div>
            <%= lists.reader() %>
        </div>


        <!-- container定宽，并剧中结束 -->
    </div>


</div>


<% Server.Execute("Footer.aspx"); %>
<% Server.Execute("Foot.aspx"); %>