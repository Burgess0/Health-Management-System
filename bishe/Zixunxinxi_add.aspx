<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Zixunxinxi_add.aspx.cs" Inherits="Zixunxinxi_add" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            添加新闻信息
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Zixunxinxi_add.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">标题<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入标题" style="width:250px;" data-rule-required="true" data-msg-required="请填写标题" remote="action.ashx?a=checkno&checktype=insert&table=zixunxinxi&col=biaoti" data-msg-remote="内容重复了" id="biaoti" name="biaoti" value=""/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">分类<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <select class="form-control class_fenlei7" data-value="" data-rule-required="true" data-msg-required="请填写分类" id="fenlei" name="fenlei" style="width:250px">
<%  var select = Dao.select("SELECT * FROM zixunfenlei ORDER BY id desc");  %>
<%  foreach(var m in select )
{ 
 %>
<option value="<%= m["id"] %>"><%= m["fenleimingcheng"] %></option>
<% } %>

</select>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">图片</label>
        <div class="col-sm-10">
            
                            <div class="input-group" style="width:250px">
    <input type="text" class="form-control" id="tupian" name="tupian" value=""/>

    <span class="input-group-btn"><button type="button" class="btn btn-default" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=tupian'})">
    上传图片
</button></span>
</div>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">添加人</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入添加人" style="width:150px;" readonly="readonly" id="tianjiaren" name="tianjiaren" value="<%= Session["username"] %>"/>                    
        </div>
        
    </div>
</div>
                            <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">内容</label>
        <div class="col-sm-10">
            
                            <textarea id="neirong" name="neirong" style="max-width: 750px;width:100%; height: 300px;"></textarea><script>
            (function(){
                var um = UM.getEditor('neirong');
            })();
            </script>                    
        </div>
        
    </div>
</div>
        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                
                                                    
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