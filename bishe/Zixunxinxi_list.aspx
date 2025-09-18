<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Zixunxinxi_list.aspx.cs" Inherits="Zixunxinxi_list" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>





<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            新闻信息查询
        </span>
    </div>
    <div class="panel-body">
        
    


<div class="form-search pa10 bg-warning">
    <form class="form-inline" action="?" size="small" id="formSearch"><!-- form 标签开始 -->
    


                  
                   标题： <input type="text" class="form-control" style="" name="biaoti" value="<%= Request["biaoti"] %>"/>
                    
                   分类： <select class="form-control class_fenlei6" data-value="<%= Request["fenlei"] %>" data-rule-required="true" data-msg-required="请填写分类" id="fenlei" name="fenlei">
<option value="">请选择</option><%  var select = Dao.select("SELECT * FROM zixunfenlei ORDER BY id desc");  %>
<%  foreach(var m in select )
{ 
 %>
<option value="<%= m["id"] %>"><%= m["fenleimingcheng"] %></option>
<% } %>

</select>
<script>
$(".class_fenlei6").val($(".class_fenlei6").attr("data-value"))</script>

                    
                   添加人： <input type="text" class="form-control" style="" name="tianjiaren" value="<%= Request["tianjiaren"] %>"/>
                    
                   点击率： <input type="text" class="form-control" style="width:80px;" name="dianjilv_start" value="<%= Request["dianjilv_start"] %>"/>-
<input type="text" class="form-control" style="width:80px;" name="dianjilv_end" value="<%= Request["dianjilv_end"] %>"/>
          
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
                                        <th>标题                                            </th>
                                        <th>分类                                            </th>
                                        <th>图片                                            </th>
                                        <th>添加人                                            </th>
                                        <th>点击率                                            </th>
                    
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
                            <%= map["biaoti"] %>                        </td>
                                            <td>
                            <%  var mapzixunfenlei2 = Dao.find("SELECT fenleimingcheng,id FROM zixunfenlei where id='"+map["fenlei"]+"'");  %><%= mapzixunfenlei2["fenleimingcheng"] %>                        </td>
                                            <td>
                            <%  if("".Equals(map["tupian"]) ){  %>-<%  } else {   %><img width="100" src="<%= map["tupian"] %>"/><% } %>                        </td>
                                            <td>
                            <%= map["tianjiaren"] %>                        </td>
                                            <td>
                            <%= map["dianjilv"] %>                        </td>
                    
                                                            <td align="center">
                                                                        <a class="btn btn-success btn-xs" href="Zixunxinxi_updt.aspx?id=<%= map["id"] %>" title="编辑"> 编辑 </a>  
 

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