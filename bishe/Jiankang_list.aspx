<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Jiankang_list.aspx.cs" Inherits="Jiankang_list" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<script src="js/datepicker/WdatePicker.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            查询
        </span>
    </div>
    <div class="panel-body">
        
    


<div class="form-search pa10 bg-warning">
    <form class="form-inline" action="?" size="small" id="formSearch"><!-- form 标签开始 -->
    


                  
                   日期： <input type="text" class="form-control" name="riqi_start" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})"/>-<input type="text" class="form-control" name="riqi_end" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})"/>
                    
                   身高： <input type="text" class="form-control" style="width:80px;" name="shengao_start" value="<%= Request["shengao_start"] %>"/>-<input type="text" class="form-control" style="width:80px;" name="shengao_end" value="<%= Request["shengao_end"] %>"/>
                    
                   运动类型： <select class="form-control class_yundongleixing16" data-value="<%= Request["yundongleixing"] %>" id="yundongleixing" name="yundongleixing">
<option value="">请选择</option><%  var select = Dao.select("SELECT * FROM leixing ORDER BY id desc");  %>
<%  foreach(var m in select )
{ 
 %>
<option value="<%= m["id"] %>"><%= m["leixingming"] %></option>
<% } %>

</select>
<script>
$(".class_yundongleixing16").val($(".class_yundongleixing16").attr("data-value"))</script>

          
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
                                        <th>日期                                            </th>
                                        <th>饮食信息                                            </th>
                                        <th>饮食热量值                                                (kcal)
                                            </th>
                                        <th>年龄                                                (岁)
                                            </th>
                                        <th>身高                                                (cm)
                                            </th>
                                        <th>体重                                                (kg)
                                            </th>
                                        <th>心率                                                (次/分钟)
                                            </th>
                                        <th>BMI                                                (kg/m²)
                                            </th>
                                        <th>运动类型                                            </th>
                                        <th>运动时长                                                (分钟)
                                            </th>
                                        <th>运动热量值                                                (kcal)
                                            </th>
                                        <th>基础代谢率                                                (%)
                                            </th>
                                        <th>用户                                            </th>
                                        <th>备注                                            </th>
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
                                                        <%= i %>
                        </label>
                    </td>
                                            <td>
                            <%= map["riqi"] %>                        </td>
                                            <td>
                            <%= map["yinshixinxi"] %>                        </td>
                                            <td>
                            <%= map["yinshireliangzhi"] %>                        </td>
                                            <td>
                            <%= map["nianling"] %>                        </td>
                                            <td>
                            <%= map["shengao"] %>                        </td>
                                            <td>
                            <%= map["tizhong"] %>                        </td>
                                            <td>
                            <%= map["xinlv"] %>                        </td>
                                            <td>
                            <%= map["bmi"] %>                        </td>
                                            <td>
                            <%  var mapleixing25 = Dao.find("SELECT leixingming,id FROM leixing where id='"+map["yundongleixing"]+"'");  %><%= mapleixing25["leixingming"] %>                        </td>
                                            <td>
                            <%= map["yundongshizhang"] %>                        </td>
                                            <td>
                            <%= map["yundongreliangzhi"] %>                        </td>
                                            <td>
                            <%= map["jichudaixielv"] %>                        </td>
                                            <td>
                            <%= map["yonghu"] %>                        </td>
                                            <td>
                            <pre style="padding: 5px;background: none;border: none;margin: 0;"><%= map["beizhu"] %></pre>                        </td>
                                            <td>
                            <%= Info.subStr(map["addtime"], 19 , "") %>                        </td>
                    
                                                            <td align="center">
                                                                        <a class="btn btn-info btn-xs" href="Jiankang_detail.aspx?id=<%= map["id"] %>" title="详情"> 详情 </a>  
 

<a class="btn btn-success btn-xs" href="Jiankang_updt.aspx?id=<%= map["id"] %>" title="编辑"> 编辑 </a>  
 

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