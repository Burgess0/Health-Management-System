<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pinglunadd.aspx.cs" Inherits="Pinglunadd" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>
<% Server.Execute("Header.aspx"); %>

<script src="js/jquery.validate.js"></script>




<div>

    
<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                    



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            添加评论
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Pinglun_add.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                            <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">评分<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入评分" style="width:250px;" data-rule-required="true" data-msg-required="请填写评分" id="pingfen" name="pingfen" value=""/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">评论内容</label>
        <div class="col-sm-10">
            
                            <textarea style="width: 80%;height: 120px" class="form-control" placeholder="输入评论内容" id="pinglunneirong" name="pinglunneirong"></textarea>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">评论人</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入评论人" style="width:150px;" readonly="readonly" id="pinglunren" name="pinglunren" value="<%= Session["username"] %>"/>                    
        </div>
        
    </div>
</div>
                <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                
                     <input type="hidden" name="biao" id="biao" value="<%= Request["biao"] %>"/>  
 <input type="hidden" name="biaoid" id="biaoid" value="<%= Request["biaoid"] %>"/>  
 <input type="hidden" name="biaoti" id="biaoti" value="<%= Request["biaoti"] %>"/>  
                                
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


        
    
<!-- container定宽，并剧中结束 --></div>


</div>


<% Server.Execute("Footer.aspx"); %>
<% Server.Execute("Foot.aspx"); %>