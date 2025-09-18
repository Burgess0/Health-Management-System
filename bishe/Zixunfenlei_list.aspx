<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Zixunfenlei_list.aspx.cs" Inherits="Zixunfenlei_list" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>





<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            新闻分类查询
        </span>
    </div>
    <div class="panel-body">
        
    





    


        
<div class="list-table">
            <table width="100%" border="1" class="table table-list table-bordered table-hover">
                <thead>
                <tr align="center">
                    <th width="60" data-field="item">序号</th>
                                        <th>分类名称                                            </th>
                    
                                                            <th width="220" data-field="handler">操作</th>
                </tr>
                </thead>
                <tbody>

                <% 
                int i=0;
                foreach(var map in lists) 
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
                            <%= map["fenleimingcheng"] %>                        </td>
                    
                                                            <td align="center">
                                                                        <a class="btn btn-success btn-xs" href="Zixunfenlei_updt.aspx?id=<%= map["id"] %>" title="编辑"> 编辑 </a>  
 

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