<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Gouwuche_list.aspx.cs" Inherits="Gouwuche_list" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>





<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            购物车查询
        </span>
    </div>
    <div class="panel-body">
        
    


<div class="form-search pa10 bg-warning">
    <form class="form-inline" action="?" size="small" id="formSearch"><!-- form 标签开始 -->
    


                  
                   名称： <input type="text" class="form-control" style="" name="mingcheng" value="<%= Request["mingcheng"] %>"/>
                    
                   分类： <select class="form-control class_fenlei14" data-value="<%= Request["fenlei"] %>" id="fenlei" name="fenlei">
<option value="">请选择</option><%  var select = Dao.select("SELECT * FROM fenlei ORDER BY id desc");  %>
<%  foreach(var m in select )
{ 
 %>
<option value="<%= m["id"] %>"><%= m["fenleiming"] %></option>
<% } %>

</select>
<script>
$(".class_fenlei14").val($(".class_fenlei14").attr("data-value"))</script>

          
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
                                        <th>图片                                            </th>
                                        <th>名称                                            </th>
                                        <th>分类                                            </th>
                                        <th>价格                                            </th>
                                        <th>购买数                                            </th>
                                        <th>小计                                            </th>
                                        <th>购买人                                            </th>
                                        <th>添加时间                                            </th>
                    
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
                                                            <input type="checkbox" name="ids" class="ids" data-price="<%= map["xiaoji"] %>" value="<%= map["id"] %>"/>
                                                        <%= i %>
                        </label>
                    </td>
                                            <td>
                            <%  if("".Equals(map["tupian"]) ){  %>-<%  } else {   %><img width="100" src="<%= Info.images(map["tupian"]) %>"/><% } %>                        </td>
                                            <td>
                            <%= map["mingcheng"] %>                        </td>
                                            <td>
                            <%  var mapfenlei12 = Dao.find("SELECT fenleiming,id FROM fenlei where id='"+map["fenlei"]+"'");  %><%= mapfenlei12["fenleiming"] %>                        </td>
                                            <td>
                            <%= map["jiage"] %>                        </td>
                                            <td>
                            <%= map["goumaishu"] %>                        </td>
                                            <td>
                            <%= map["xiaoji"] %>                        </td>
                                            <td>
                            <%= map["goumairen"] %>                        </td>
                                            <td>
                            <%= Info.subStr(map["addtime"], 19 , "") %>                        </td>
                    
                                                            <td align="center">
                                                                        <a class="btn btn-success btn-xs" href="Gouwuche_updt.aspx?id=<%= map["id"] %>" title="编辑"> 编辑 </a>  
 

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
                    </div>

    

<%= lists.reader() %>

    




                        
<p class="text-right" style="text-align: right">
                订单金额：<span style="color: #990000;font-size: 18px" id="sum_price">￥0</span> 　　
                <button type="button" class="btn btn-danger" onclick="createOrder()">
    生成订单
</button>
            </p>


            
<script>
                $(function () {
                    $('input.ids,input.selectAll').click(function () {
                        setTimeout(function () {
                            getPrice();
                        },200);
                    });
                });
                function getPrice() {
                    var price = 0;
                    $('.ids:checked').each(function () {
                        price+=parseFloat($(this).data('price'));
                    });
                    price = price.toFixed(2);
                    $('#sum_price').html("￥"+price);
                    return price;
                }
                function createOrder() {
                    var ids = [];
                    $('.ids:checked').each(function () {
                        ids.push($(this).val());
                    });
                    if(ids.length == 0){
                        alert('请选择商品')
                        return;
                    }
                    var price = getPrice();
                    var url = "Dingdan_add.aspx";
                    location.href= url + (url.indexOf('?') === -1 ? '?' : '&')+'sum_xiaoji='+price+'&ids='+ids.join(',');
                }
            </script>

        
    

    </div>
</div>


</div>


<% Server.Execute("Foot.aspx"); %>