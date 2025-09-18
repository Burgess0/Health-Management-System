<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Jiankang_updt.aspx.cs" Inherits="Jiankang_updt" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<script src="js/jquery.validate.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            添加
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Jiankang_updt.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">日期</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" style="width:120px;" readonly="readonly" id="riqi" name="riqi" value="<%= Info.html(mmm["riqi"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">饮食信息</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入饮食信息" style="width:250px;" id="yinshixinxi" name="yinshixinxi" value="<%= Info.html(mmm["yinshixinxi"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">饮食热量值(kcal)</label>
        <div class="col-sm-10">
            
                            <input type="number" class="form-control" placeholder="输入饮食热量值" style="width:150px;" step="0.01" number="true" data-msg-number="输入一个有效数字" id="yinshireliangzhi" name="yinshireliangzhi" value="<%= Info.html(mmm["yinshireliangzhi"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">年龄(岁)</label>
        <div class="col-sm-10">
            
                            <input type="number" class="form-control" placeholder="输入年龄" style="width:150px;" number="true" data-msg-number="输入一个有效数字" id="nianling" name="nianling" value="<%= Info.html(mmm["nianling"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">身高(cm)</label>
        <div class="col-sm-10">
            
                            <input type="number" class="form-control" placeholder="输入身高" style="width:150px;" step="0.01" number="true" data-msg-number="输入一个有效数字" id="shengao" name="shengao" value="<%= Info.html(mmm["shengao"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">体重(kg)</label>
        <div class="col-sm-10">
            
                            <input type="number" class="form-control" placeholder="输入体重" style="width:150px;" step="0.01" number="true" data-msg-number="输入一个有效数字" id="tizhong" name="tizhong" value="<%= Info.html(mmm["tizhong"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">心率(次/分钟)</label>
        <div class="col-sm-10">
            
                            <input type="number" class="form-control" placeholder="输入心率" style="width:150px;" number="true" data-msg-number="输入一个有效数字" id="xinlv" name="xinlv" value="<%= Info.html(mmm["xinlv"]) %>"/>                    
        </div>
        
    </div>
</div>
                            <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">运动类型</label>
        <div class="col-sm-10">
            
                            <select class="form-control class_yundongleixing19" data-value="<%= Info.html(mmm["yundongleixing"]) %>" id="yundongleixing" name="yundongleixing" style="width:250px">
<%  var select = Dao.select("SELECT * FROM leixing ORDER BY id desc");  %>
<%  foreach(var m in select )
{ 
 %>
<option value="<%= m["id"] %>"><%= m["leixingming"] %></option>
<% } %>

</select>
<script>
$(".class_yundongleixing19").val($(".class_yundongleixing19").attr("data-value"))</script>
                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">运动时长(分钟)</label>
        <div class="col-sm-10">
            
                            <input type="number" class="form-control" placeholder="输入运动时长" style="width:150px;" step="0.01" number="true" data-msg-number="输入一个有效数字" id="yundongshizhang" name="yundongshizhang" value="<%= Info.html(mmm["yundongshizhang"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">运动热量值(kcal)</label>
        <div class="col-sm-10">
            
                            <input type="number" class="form-control" placeholder="输入运动热量值" style="width:150px;" step="0.01" number="true" data-msg-number="输入一个有效数字" id="yundongreliangzhi" name="yundongreliangzhi" value="<%= Info.html(mmm["yundongreliangzhi"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">基础代谢率(%)</label>
        <div class="col-sm-10">
            
                            <input type="number" class="form-control" placeholder="输入基础代谢率" style="width:150px;" step="0.01" number="true" data-msg-number="输入一个有效数字" id="jichudaixielv" name="jichudaixielv" value="<%= Info.html(mmm["jichudaixielv"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">用户</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入用户" style="width:150px;" readonly="readonly" id="yonghu" name="yonghu" value="<%= mmm["yonghu"] %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">备注</label>
        <div class="col-sm-10">
            
                            <textarea style="width: 80%;height: 120px" class="form-control" placeholder="输入备注" id="beizhu" name="beizhu"><%= Info.html(mmm["beizhu"]) %></textarea>                    
        </div>
        
    </div>
</div>
                <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                    <input name="id" value="<%= mmm["id"] %>" type="hidden"/>
            <input name="referer" value="<%= Request.Headers["referer"] %>" type="hidden"/>
            <input name="updtself" value="<%= updtself %>" type="hidden"/>
                
        
        <button type="submit" class="btn btn-primary" name="Submit">
    提交
</button>
        <button type="reset" class="btn btn-default" name="Submit2">
    重置
</button>
            
        </div>
        
    </div>
</div>

<!--form标签结束--></form>



<script>
    $(function (){
        $('#form1').validate();
    });
</script>




    </div>
</div>


</div>


<% Server.Execute("Foot.aspx"); %>