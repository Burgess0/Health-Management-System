<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shoucangadd.aspx.cs" Inherits="Shoucangadd" %>
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
            添加收藏
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Shoucang_add.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                
                     <input type="hidden" name="xwid" id="xwid" value="<%= Request["xwid"] %>"/>  
 <input type="hidden" name="biao" id="biao" value="<%= Request["biao"] %>"/>  
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