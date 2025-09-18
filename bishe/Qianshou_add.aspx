<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Qianshou_add.aspx.cs" Inherits="Qianshou_add" %>
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
        
    

<form action="Qianshou_add.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
            <input type="hidden" name="dingdanid" value="<%= Request["id"] %>"/>                <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">订单号</label>
        <div class="col-sm-10">
            
                            <%= readMap["dingdanhao"] %><input type="hidden" id="dingdanhao" name="dingdanhao" value="<%= Info.html(readMap["dingdanhao"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">收货人</label>
        <div class="col-sm-10">
            
                            <%= readMap["shouhuoren"] %><input type="hidden" id="shouhuoren" name="shouhuoren" value="<%= Info.html(readMap["shouhuoren"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">联系电话</label>
        <div class="col-sm-10">
            
                            <%= readMap["lianxidianhua"] %><input type="hidden" id="lianxidianhua" name="lianxidianhua" value="<%= Info.html(readMap["lianxidianhua"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">地址</label>
        <div class="col-sm-10">
            
                            <%= readMap["dizhi"] %><input type="hidden" id="dizhi" name="dizhi" value="<%= Info.html(readMap["dizhi"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">签收时间</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})" style="width:200px;" readonly="readonly" id="qianshoushijian" name="qianshoushijian" value="<%= Info.date("yyyy-MM-dd HH:mm:ss") %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">签收人</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入签收人" style="width:150px;" readonly="readonly" id="qianshouren" name="qianshouren" value="<%= Session["username"] %>"/>                    
        </div>
        
    </div>
</div>
        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                            <input name="referer" id="referers" class="referers" value="<%= Request.Headers["referer"] %>" type="hidden"/>
            <script>
                $(function (){
                    $('input.referers').val(document.referrer);
                });
            </script>
        
                                                    
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