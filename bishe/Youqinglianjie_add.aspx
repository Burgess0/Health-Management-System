<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Youqinglianjie_add.aspx.cs" Inherits="Youqinglianjie_add" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<script src="js/jquery.validate.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            添加友情链接
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Youqinglianjie_add.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">网站名称<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入网站名称" style="width:150px;" data-rule-required="true" data-msg-required="请填写网站名称" id="wangzhanmingcheng" name="wangzhanmingcheng" value=""/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">网址<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入网址" style="width:150px;" data-rule-required="true" data-msg-required="请填写网址" id="wangzhi" name="wangzhi" value=""/>                    
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