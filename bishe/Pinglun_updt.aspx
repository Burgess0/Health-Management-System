<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pinglun_updt.aspx.cs" Inherits="Pinglun_updt" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<script src="js/jquery.validate.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            添加评论
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Pinglun_updt.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                            <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">评分<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入评分" style="width:250px;" data-rule-required="true" data-msg-required="请填写评分" id="pingfen" name="pingfen" value="<%= Info.html(mmm["pingfen"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">评论内容</label>
        <div class="col-sm-10">
            
                            <textarea style="width: 80%;height: 120px" class="form-control" placeholder="输入评论内容" id="pinglunneirong" name="pinglunneirong"><%= Info.html(mmm["pinglunneirong"]) %></textarea>                    
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