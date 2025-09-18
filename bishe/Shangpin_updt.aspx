<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shangpin_updt.aspx.cs" Inherits="Shangpin_updt" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link href="js/h5upload/h5upload.css" rel="stylesheet">
<script src="js/h5upload/h5upload.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            添加商品
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Shangpin_updt.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">编号</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入编号" style="width:150px;" readonly="readonly" id="bianhao" name="bianhao" value="<%= Info.html(mmm["bianhao"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">名称<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入名称" style="width:250px;" data-rule-required="true" data-msg-required="请填写名称" id="mingcheng" name="mingcheng" value="<%= Info.html(mmm["mingcheng"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">分类</label>
        <div class="col-sm-10">
            
                            <select class="form-control class_fenlei12" data-value="<%= Info.html(mmm["fenlei"]) %>" id="fenlei" name="fenlei" style="width:250px">
<%  var select = Dao.select("SELECT * FROM fenlei ORDER BY id desc");  %>
<%  foreach(var m in select )
{ 
 %>
<option value="<%= m["id"] %>"><%= m["fenleiming"] %></option>
<% } %>

</select>
<script>
$(".class_fenlei12").val($(".class_fenlei12").attr("data-value"))</script>
                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">价格<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="number" class="form-control" placeholder="输入价格" style="width:150px;" step="0.01" data-rule-required="true" data-msg-required="请填写价格" number="true" data-msg-number="输入一个有效数字" id="jiage" name="jiage" value="<%= Info.html(mmm["jiage"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">库存<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="number" class="form-control" placeholder="输入库存" style="width:150px;" data-rule-required="true" data-msg-required="请填写库存" number="true" data-msg-number="输入一个有效数字" id="kucun" name="kucun" value="<%= Info.html(mmm["kucun"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">是否新品</label>
        <div class="col-sm-10">
            
                            <div class="class_shifouxinpin13" data-value="<%= Info.html(mmm["shifouxinpin"]) %>"> <label><input type="radio" id="shifouxinpin" name="shifouxinpin" value="是"/> 是</label> 
 <label><input type="radio" id="shifouxinpin" name="shifouxinpin" value="否"/> 否</label> 
</div>
<script>
$(".class_shifouxinpin13 :radio[value='<%= Info.html(mmm["shifouxinpin"]) %>']").prop("checked",true)</script>
                    
        </div>
        
    </div>
</div>
                            <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">图片</label>
        <div class="col-sm-10">
            
                            <input type="hidden" id="tupian" name="tupian" value="<%= Info.html(mmm["tupian"]) %>"/>
        <script>showUploadImages("#tupian","upload.html")</script>
                            
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">详情</label>
        <div class="col-sm-10">
            
                            <textarea id="xiangqing" name="xiangqing" style="max-width: 750px;width:100%; height: 300px;"><%= Info.html(mmm["xiangqing"]) %></textarea><script>
            (function(){
                var um = UM.getEditor('xiangqing');
            })();
            </script>                    
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