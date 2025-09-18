<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fahuo_updt.aspx.cs" Inherits="Fahuo_updt" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<script src="js/jquery.validate.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            添加发货
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Fahuo_updt.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
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
        <label style="text-align: right" class="col-sm-2 hiddex-xs">下单人</label>
        <div class="col-sm-10">
            
                            <%= mmm["xiadanren"] %><input type="hidden" id="xiadanren" name="xiadanren" value="<%= Info.html(mmm["xiadanren"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">物流公司<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入物流公司" style="width:150px;" data-rule-required="true" data-msg-required="请填写物流公司" id="wuliugongsi" name="wuliugongsi" value="<%= Info.html(mmm["wuliugongsi"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">运单号<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入运单号" style="width:150px;" data-rule-required="true" data-msg-required="请填写运单号" remote="action.ashx?a=checkno&checktype=update&id=<%= mmm["id"] %>&table=fahuo&col=yundanhao" data-msg-remote="内容重复了" id="yundanhao" name="yundanhao" value="<%= Info.html(mmm["yundanhao"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">发货人</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入发货人" style="width:150px;" readonly="readonly" id="fahuoren" name="fahuoren" value="<%= mmm["fahuoren"] %>"/>                    
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