<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lunbotu_add.aspx.cs" Inherits="Lunbotu_add" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            添加轮播图
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Lunbotu_add.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">标题<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入标题" style="width:150px;" data-rule-required="true" data-msg-required="请填写标题" id="title" name="title" value=""/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">图片<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <div class="input-group" style="width:250px">
    <input type="text" class="form-control" data-rule-required="true" data-msg-required="请填写图片" id="image" name="image" value=""/>

    <span class="input-group-btn"><button type="button" class="btn btn-default" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=image'})">
    上传图片
</button></span>
</div>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">连接地址<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入连接地址" style="width:250px;" data-rule-required="true" data-msg-required="请填写连接地址" id="url" name="url" value=""/>                    
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