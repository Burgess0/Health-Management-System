<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fahuo_list_fahuoren.aspx.cs" Inherits="Fahuo_list_fahuoren" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>





<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            发货查询
        </span>
    </div>
    <div class="panel-body">
        
    


<div class="form-search pa10 bg-warning">
    <form class="form-inline" action="?" size="small" id="formSearch"><!-- form 标签开始 -->
    


                  
                   订单号： <input type="text" class="form-control" style="" name="dingdanhao" value="<%= Request["dingdanhao"] %>"/>
                    
                   运单号： <input type="text" class="form-control" style="" name="yundanhao" value="<%= Request["yundanhao"] %>"/>
          
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







    


        
<div class="list-table">
            <table width="100%" border="1" class="table table-list table-bordered table-hover">
                <thead>
                <tr align="center">
                    <th width="60" data-field="item">序号</th>
                                        <th>订单号                                            </th>
                                        <th>收货人                                            </th>
                                        <th>联系电话                                            </th>
                                        <th>地址                                            </th>
                                        <th>下单人                                            </th>
                                        <th>物流公司                                            </th>
                                        <th>运单号                                            </th>
                                        <th>发货人                                            </th>
                    
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
                            <%= map["dingdanhao"] %>                        </td>
                                            <td>
                            <%= map["shouhuoren"] %>                        </td>
                                            <td>
                            <%= map["lianxidianhua"] %>                        </td>
                                            <td>
                            <%= map["dizhi"] %>                        </td>
                                            <td>
                            <%= map["xiadanren"] %>                        </td>
                                            <td>
                            <%= map["wuliugongsi"] %>                        </td>
                                            <td>
                            <%= map["yundanhao"] %>                        </td>
                                            <td>
                            <%= map["fahuoren"] %>                        </td>
                    
                                                            <td align="center">
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