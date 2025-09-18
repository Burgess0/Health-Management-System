<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shangpinlist.aspx.cs" Inherits="Shangpinlist" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>
<% Server.Execute("Header.aspx"); %>


<div>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->


        <div class="floor_goods_wrap clearfix" style="margin:15px 15px 15px 15px;background-color:#FFFFFF">
            <div style="margin-bottom: 20px">


                <form action="?" class="search">
                    <table class="jd-search">
                        <tbody>
                        <tr>
                            <td class="label1">
                                分类
                            </td>
                            <td class="form-inline">
                                <p class="search-radio">
                                    <input type="hidden" name="fenlei" value="<%= Request["fenlei"] %>"/>
                                    <a href="javascript:;" data-value="" onclick="selectRadio(this)">全部</a>
                                    <% var mapfenlei8 = Dao.select("SELECT id,fenleiming FROM fenlei"); %> <% foreach (var r in mapfenlei8)
                                                                                                              {
                                                                                                           %>
                                        <a href="javascript:;" data-value="<%= r["id"] %>" onclick="selectRadio(this)"><%= r["fenleiming"] %></a>
                                    <% } %>
                                </p>
                            </td>
                        </tr>

                        <tr>
                            <td class="label1">
                                名称
                            </td>
                            <td class="form-inline">
                                <input type="text" class="form-control" style="width: 150px" name="mingcheng" value="<%= Request["mingcheng"] %>" placeholder="请输入关键词"/>
                                <button type="submit" class="btn btn-default">
                                    搜索
                                </button>
                            </td>
                        </tr>

                        <%--<tr>
                            <td class="label1">排序</td>
                            <td class="form-inline">
                                <p class="search-radio">
                                    <input type="hidden" name="orderby" value="<%= orderby %>"/>
                                    <a href="javascript:;" data-value="id" onclick="selectRadio(this)">发布时间</a>
                                    <a href="javascript:;" data-value="xiaoliang" onclick="selectRadio(this)">销量</a>
                                    <a href="javascript:;" data-value="addtime" onclick="selectRadio(this)">添加时间</a>
                                </p>
                            </td>
                        </tr>--%>

                        </tbody>
                    </table>
                </form>


            </div>
            <div class="row">

                <% foreach (var r in lists)
                   {
                %>
                    <div class="col-md-3">

                        <div class="floor_goods_wrap_li">
                            <div class="floor_goods_wrap_b clearfix">
                                <a href="Shangpindetail.aspx?id=<%= r["id"] %>" class="floor_goods_img">
                                    <div class="img-box pb100">
                                        <div class="img" style="background-image: url('<%= Info.images(r["tupian"]) %>')"></div>
                                    </div>
                                </a>
                                <a href="Shangpindetail.aspx?id=<%= r["id"] %>" class="floor_goods_tit"><%= Info.subStr(r["mingcheng"], 20) %></a>
                                <a href="Shangpindetail.aspx?id=<%= r["id"] %>" class="floor_goods_txt"><%= Info.subStr(r["xiangqing"], 15) %></a>
                                <a href="Shangpindetail.aspx?id=<%= r["id"] %>" class="floor_goods_price">
                                    ￥<%= r["jiage"] %>元
                                </a>

                            </div>
                        </div>


                    </div>
                <% } %>

            </div>
            <%= lists.reader() %>
        </div>


        <!-- container定宽，并剧中结束 -->
    </div>


</div>


<% Server.Execute("Footer.aspx"); %>
<% Server.Execute("Foot.aspx"); %>