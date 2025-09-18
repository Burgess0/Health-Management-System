<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pinglunhuifu_updt.aspx.cs" Inherits="Pinglunhuifu_updt" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<script src="js/jquery.validate.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            添加评论回复
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Pinglunhuifu_updt.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
            <input type="hidden" name="pinglunid" value="<%= mmm["pinglunid"] %>"/>                <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">表<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <%= mmm["biao"] %><input type="hidden" id="biao" name="biao" value="<%= Info.html(mmm["biao"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">表id<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <%= mmm["biaoid"] %><input type="hidden" id="biaoid" name="biaoid" value="<%= Info.html(mmm["biaoid"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">标题<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <%= mmm["biaoti"] %><input type="hidden" id="biaoti" name="biaoti" value="<%= Info.html(mmm["biaoti"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">评论内容</label>
        <div class="col-sm-10">
            
                            <pre style="padding: 5px;background: none;border: none;margin: 0;"><%= mmm["pinglunneirong"] %></pre><input type="hidden" id="pinglunneirong" name="pinglunneirong" value="<%= Info.html(mmm["pinglunneirong"]) %>"/>                    
        </div>
        
    </div>
</div>
                            <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">回复内容</label>
        <div class="col-sm-10">
            
                            <textarea style="width: 80%;height: 120px" class="form-control" placeholder="输入回复内容" id="huifuneirong" name="huifuneirong"><%= Info.html(mmm["huifuneirong"]) %></textarea>                    
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
                <button type="button" class="btn btn-default" onclick="history.back()">
    返回
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