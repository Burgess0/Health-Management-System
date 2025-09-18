<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shoucang_list.aspx.cs" Inherits="Shoucang_list" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>





<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            收藏查询
        </span>
    </div>
    <div class="panel-body">
        
    


<div class="form-search pa10 bg-warning">
    <form class="form-inline" action="?" size="small" id="formSearch"><!-- form 标签开始 -->
    


                  
                   标题： <input type="text" class="form-control" style="" name="biaoti" value="<%= Request["biaoti"] %>"/>
          
        <select class="form-control" name="orderby" id="orderby">

            <option value="id">按发布时间</option>
                    
</select>

        <select class="form-control" name="sort" id="sort">

            <option value="desc">倒序</option>
            <option value="asc">升序</option>
        
</select>

        <button type="submit" class="btn btn-default">
    搜索
</button>

            
<!--form标签结束--></form>
</div>



    
<script>$("#orderby").val("<%= orderby %>");$("#sort").val("<%= sort %>".toLocaleLowerCase());</script>







    
    
<form action="?a=batch" method="post" id="form-batch">


        <div class="list-table">
            <table width="100%" border="1" class="table table-list table-bordered table-hover">
                <thead>
                <tr align="center">
                    <th width="60" data-field="item">序号</th>
                                        <th>标题                                            </th>
                                        <th>收藏时间                                            </th>
                    
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
                                                            <input type="checkbox" name="ids" class="ids" value="<%= map["id"] %>"/>
                                                        <%= i %>
                        </label>
                    </td>
                                            <td>
                            <%= map["biaoti"] %>                        </td>
                                            <td>
                            <%= Info.subStr(map["addtime"], 19 , "") %>                        </td>
                    
                                                            <td align="center">
                                                                            <a target="_blank" href="<%= map["biao"] %>detail.aspx?id=<%= map["xwid"] %>">详情</a>
                                                <a class="btn btn-danger btn-xs" href="?a=delete&id=<%= map["id"] %>" onclick="return confirm('确定删除？此操作不可恢复')" title="删除"> 删除 </a>  
 

                        <!--qiatnalijne-->
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>

        <div class="" style="margin-top: 10px;">
            <label><input type="checkbox" value="1" class="selectAll" onclick="$('.list-table input.ids').prop('checked' , this.checked)"/> 全选/全不选</label>
                            <input type="submit" name="delete" value="批量删除"/>
                    </div>
    </form>


<%= lists.reader() %>

    




    

    </div>
</div>


</div>


<% Server.Execute("Foot.aspx"); %>