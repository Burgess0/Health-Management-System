<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shangpin_list.aspx.cs" Inherits="Shangpin_list" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>


<div>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="titles">
                商品查询
            </span>
        </div>
        <div class="panel-body">


            <div class="form-search pa10 bg-warning">
                <form class="form-inline" action="?" size="small" id="formSearch">
                    <!-- form 标签开始 -->


                    关键字：<input type="text" class="form-control" name="keyword" value="<%= Request["keyword"] %>" style="width:150px" placeholder="搜索关键字"/>

                    名称： <input type="text" class="form-control" style="" name="mingcheng" value="<%= Request["mingcheng"] %>"/>

                    分类：
                    <select class="form-control class_fenlei9" data-value="<%= Request["fenlei"] %>" id="fenlei" name="fenlei">
                        <option value="">请选择</option><% var select = Dao.select("SELECT * FROM fenlei ORDER BY id desc"); %>
                        <% foreach (var m in select)
                           {
                        %>
                            <option value="<%= m["id"] %>"><%= m["fenleiming"] %></option>
                        <% } %>

                    </select>
                    <script>
$(".class_fenlei9").val($(".class_fenlei9").attr("data-value"))</script>


                    价格： <input type="text" class="form-control" style="width:80px;" name="jiage_start" value="<%= Request["jiage_start"] %>"/>-<input type="text" class="form-control" style="width:80px;" name="jiage_end" value="<%= Request["jiage_end"] %>"/>

                    <select class="form-control" name="orderby" id="orderby">

                        <option value="id">按发布时间</option>
                        <option value="xiaoliang">
                            按销量
                        </option>
                        <option value="addtime">
                            按添加时间
                        </option>

                    </select>

                    <select class="form-control" name="sort" id="sort">

                        <option value="desc">倒序</option>
                        <option value="asc">升序</option>

                    </select>

                    <button type="submit" class="btn btn-default">
                        搜索
                    </button>


                    <!--form标签结束-->
                </form>
            </div>


            <script>$("#orderby").val("<%= orderby %>");$("#sort").val("<%= sort %>".toLocaleLowerCase());</script>


            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th>编号 </th>
                        <th>名称 </th>
                        <th>分类 </th>
                        <th>价格 </th>
                        <th>库存 </th>
                        <th>是否新品 </th>
                        <th>销量 </th>
                        <th>图片 </th>
                        <th>添加时间 </th>

                        <th width="80" data-field="issh">状态</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        int i = 0;
                        foreach (var map in lists)
                        {
                            i++;
                    %>
                        <tr id="<%= map["id"] %>" pid="">
                            <td width="30" align="center">
                                <label>
                                    <%= i %>
                                </label>
                            </td>
                            <td>
                                <%= map["bianhao"] %>
                            </td>
                            <td>
                                <%= map["mingcheng"] %>
                            </td>
                            <td>
                                <% var mapfenlei7 = Dao.find("SELECT fenleiming,id FROM fenlei where id='" + map["fenlei"] + "'"); %><%= mapfenlei7["fenleiming"] %>
                            </td>
                            <td>
                                <%= map["jiage"] %>
                            </td>
                            <td>
                                <%= map["kucun"] %>
                            </td>
                            <td>
                                <%= map["shifouxinpin"] %>
                            </td>
                            <td>
                                <%= map["xiaoliang"] %>
                            </td>
                            <td>
                                <% if ("".Equals(map["tupian"]))
                                   { %>-<% }
                                   else
                                   { %><img width="100" src="<%= Info.images(map["tupian"]) %>"/><% } %>
                            </td>
                            <td>
                                <%= Info.subStr(map["addtime"], 19, "") %>
                            </td>

                            <td>
                                <%= map["issh"] %>
                                <a href="Sh.ashx?id=<%= map["id"] %>&yuan=<%= map["issh"] %>&tablename=shangpin">
                                    <% if (map["issh"].Equals("是"))
                                       { %>
                                        下架
                                    <% }
                                       else
                                       { %>
                                        上架
                                    <% } %>
                                </a>
                            </td>
                            <td align="center">
                                <a class="btn btn-info btn-xs" href="Shangpin_detail.aspx?id=<%= map["id"] %>" title="详情"> 详情 </a>


                                <a class="btn btn-success btn-xs" href="Shangpin_updt.aspx?id=<%= map["id"] %>" title="编辑"> 编辑 </a>


                                <a class="btn btn-danger btn-xs" href="?a=delete&id=<%= map["id"] %>" onclick="return confirm('确定删除？此操作不可恢复')" title="删除"> 删除 </a>


                                <!--qiatnalijne-->
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>


            <%= lists.reader() %>








        </div>
    </div>


</div>


<% Server.Execute("Foot.aspx"); %>