<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pinglun_list.aspx.cs" Inherits="Pinglun_list" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>


<div>


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="titles">
                评论查询
            </span>
        </div>
        <div class="panel-body">


            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th>标题 </th>
                        <th>评分 </th>
                        <th>评论内容 </th>
                        <th>评论人 </th>
                        <th>评论时间 </th>

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
                                <%= map["biaoti"] %>
                            </td>
                            <td>
                                <%= map["pingfen"] %>
                            </td>
                            <td>
                                <pre style="padding: 5px;background: none;border: none;margin: 0;"><%= map["pinglunneirong"] %></pre>
                            </td>
                            <td>
                                <%= map["pinglunren"] %>
                            </td>
                            <td>
                                <%= Info.subStr(map["addtime"], 19, "") %>
                            </td>

                            <td align="center">
                                <a target="_blank" href="<%= map["biao"] %>detail.aspx?id=<%= map["biaoid"] %>">详情</a>
                       
                                <a class="btn btn-success btn-xs" href="Pinglun_updt.aspx?id=<%= map["id"] %>" title="编辑"> 编辑 </a>


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