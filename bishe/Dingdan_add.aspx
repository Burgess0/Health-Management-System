<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dingdan_add.aspx.cs" Inherits="Dingdan_add" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<script src="js/jquery.validate.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            添加订单
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Dingdan_add.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">订单号</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入订单号" style="width:150px;" readonly="readonly" id="dingdanhao" name="dingdanhao" value="<%= Info.getID() %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">商品</label>
        <div class="col-sm-10">
            
                            <%  var dataListshangpin = Dao.select("SELECT * FROM gouwuche WHERE goumairen='"+Session["username"]+"' AND id in("+Request["ids"]+")  ORDER BY id desc");  %><div id="dataListshangpin" style="text-align: left;"><table class="table">

<thead><tr>
<th>编号</th>
<th>名称</th>
<th>分类</th>
<th>价格</th>
<th>购买数</th>
<th>小计</th>
<th>购买人</th>
<th>添加时间</th>
</tr></thead><tbody>
<%  foreach(var r in dataListshangpin )
{ 
 %>
<tr>
<td><%= r["bianhao"] %></td>
<td><%= r["mingcheng"] %></td>
<td><%  var mapfenlei19 = Dao.find("SELECT fenleiming,id FROM fenlei where id='"+r["fenlei"]+"'");  %><%= mapfenlei19["fenleiming"] %></td>
<td><%= r["jiage"] %></td>
<td><%= r["goumaishu"] %></td>
<td><%= r["xiaoji"] %></td>
<td><%= r["goumairen"] %></td>
<td><%= Info.subStr(r["addtime"], 19 , "") %></td>
</tr>
<% } %>
</tbody>

</table>
</div><input type="hidden" name="targetIds" id="targetIds" value="<%= Request["ids"] %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">总额</label>
        <div class="col-sm-10">
            
                            <input type="number" class="form-control" placeholder="输入总额" style="width:150px;" step="0.01" number="true" data-msg-number="输入一个有效数字" id="zonge" name="zonge" value="<%= Request["sum_xiaoji"] %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">收货人<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入收货人" style="width:150px;" data-rule-required="true" data-msg-required="请填写收货人" id="shouhuoren" name="shouhuoren" value=""/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">联系电话<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入联系电话" style="width:150px;" data-rule-required="true" data-msg-required="请填写联系电话" phone="true" data-msg-phone="请输入正确手机号码" id="lianxidianhua" name="lianxidianhua" value=""/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">地址<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入地址" style="width:250px;" data-rule-required="true" data-msg-required="请填写地址" id="dizhi" name="dizhi" value=""/>                    
        </div>
        
    </div>
</div>
                            <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">下单人</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入下单人" style="width:150px;" readonly="readonly" id="xiadanren" name="xiadanren" value="<%= Session["username"] %>"/>                    
        </div>
        
    </div>
</div>
        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                
                     <input type="hidden" name="zhuangtai" id="zhuangtai" value="待付款"/>  
                                        <input type="hidden" name="iszf" value="否"/>
                    
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