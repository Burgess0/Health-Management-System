<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admins_add.aspx.cs" Inherits="Admins_add" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<script src="js/jquery.validate.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            添加管理员
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Admins_add.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">帐号<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入帐号" style="width:150px;" data-rule-required="true" data-msg-required="请填写帐号" remote="action.ashx?a=checkno&checktype=insert&table=admins&col=username" data-msg-remote="内容重复了" id="username" name="username" value=""/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">密码<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="password" class="form-control" placeholder="输入密码" style="width:150px;" data-rule-required="true" data-msg-required="请填写密码" id="pwd" name="pwd" value=""/>                    
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