<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dingdan_list_xiadanren.aspx.cs" Inherits="Dingdan_list_xiadanren" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>





<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            订单查询
        </span>
    </div>
    <div class="panel-body">
        
    


<div class="form-search pa10 bg-warning">
    <form class="form-inline" action="?" size="small" id="formSearch"><!-- form 标签开始 -->
    


                  
                   订单号： <input type="text" class="form-control" style="" name="dingdanhao" value="<%= Request["dingdanhao"] %>"/>
          
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
                                        <th>总额                                            </th>
                                        <th>收货人                                            </th>
                                        <th>联系电话                                            </th>
                                        <th>地址                                            </th>
                                        <th>状态                                            </th>
                                        <th>下单人                                            </th>
                    
                                                                <th width="80" data-field="iszf">是否支付</th>
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
                            <%= map["zonge"] %>                        </td>
                                            <td>
                            <%= map["shouhuoren"] %>                        </td>
                                            <td>
                            <%= map["lianxidianhua"] %>                        </td>
                                            <td>
                            <%= map["dizhi"] %>                        </td>
                                            <td>
                            <%= map["zhuangtai"] %>                        </td>
                                            <td>
                            <%= map["xiadanren"] %>                        </td>
                    
                                                                <td>
                            <%= map["iszf"] %>
                                                        <%  if("否".Equals(map["iszf"]) ){  %>
                            <a href="javascript:window.open('Pay.aspx?id=<%= map["id"] %>&biao=dingdan&ordersn=<%= map["dingdanhao"] %>&zongji=<%= map["zonge"] %>')">
                                去支付
                            </a>
                            <% } %>
                                                    </td>
                                        <td align="center">
                                                                        
<%  if(map["zhuangtai"].Equals("待签收")  ){  %>
<a class="btn btn-default btn-xs" href="Fahuo_list.aspx?dingdanid=<%= map["id"] %>"> 物流查询 </a>  
 

<% } %>

<%  if(map["zhuangtai"].Equals("待签收")  ){  %>
<a class="btn btn-primary btn-xs" href="Qianshou_add.aspx?id=<%= map["id"] %>"> 签收 </a>  
 

<% } %>
<a class="btn btn-info btn-xs" href="Dingdan_detail.aspx?id=<%= map["id"] %>" title="详情"> 详情 </a>  
 

<a class="btn btn-success btn-xs" href="Dingdan_updt.aspx?id=<%= map["id"] %>" title="编辑"> 编辑 </a>  
 

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