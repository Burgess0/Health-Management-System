<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fahuo_add.aspx.cs" Inherits="Fahuo_add" %>
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
        
    

<form action="Fahuo_add.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
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
        <label style="text-align: right" class="col-sm-2 hiddex-xs">下单人</label>
        <div class="col-sm-10">
            
                            <%= readMap["xiadanren"] %><input type="hidden" id="xiadanren" name="xiadanren" value="<%= Info.html(readMap["xiadanren"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">物流公司<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入物流公司" style="width:150px;" data-rule-required="true" data-msg-required="请填写物流公司" id="wuliugongsi" name="wuliugongsi" value=""/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">运单号<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入运单号" style="width:150px;" data-rule-required="true" data-msg-required="请填写运单号" remote="action.ashx?a=checkno&checktype=insert&table=fahuo&col=yundanhao" data-msg-remote="内容重复了" id="yundanhao" name="yundanhao" value=""/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">发货人</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入发货人" style="width:150px;" readonly="readonly" id="fahuoren" name="fahuoren" value="<%= Session["username"] %>"/>                    
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