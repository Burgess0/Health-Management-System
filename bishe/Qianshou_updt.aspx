<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Qianshou_updt.aspx.cs" Inherits="Qianshou_updt" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<script src="js/jquery.validate.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            添加签收
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Qianshou_updt.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
            <input type="hidden" name="dingdanid" value="<%= mmm["dingdanid"] %>"/>                <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">订单号</label>
        <div class="col-sm-10">
            
                            <%= mmm["dingdanhao"] %><input type="hidden" id="dingdanhao" name="dingdanhao" value="<%= Info.html(mmm["dingdanhao"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">收货人</label>
        <div class="col-sm-10">
            
                            <%= mmm["shouhuoren"] %><input type="hidden" id="shouhuoren" name="shouhuoren" value="<%= Info.html(mmm["shouhuoren"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">联系电话</label>
        <div class="col-sm-10">
            
                            <%= mmm["lianxidianhua"] %><input type="hidden" id="lianxidianhua" name="lianxidianhua" value="<%= Info.html(mmm["lianxidianhua"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">地址</label>
        <div class="col-sm-10">
            
                            <%= mmm["dizhi"] %><input type="hidden" id="dizhi" name="dizhi" value="<%= Info.html(mmm["dizhi"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">签收时间</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})" style="width:200px;" readonly="readonly" id="qianshoushijian" name="qianshoushijian" value="<%= Info.html(mmm["qianshoushijian"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">签收人</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入签收人" style="width:150px;" readonly="readonly" id="qianshouren" name="qianshouren" value="<%= mmm["qianshouren"] %>"/>                    
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