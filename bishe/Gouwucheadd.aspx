<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Gouwucheadd.aspx.cs" Inherits="Gouwucheadd" %>
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
            添加购物车
        </span>
    </div>
    <div class="panel-body">
        
    

<form action="Gouwuche_add.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
            <input type="hidden" name="shangpinid" value="<%= Request["id"] %>"/>                <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">图片</label>
        <div class="col-sm-10">
            
                            <%  if("".Equals(readMap["tupian"]) ){  %>-<%  } else {   %><img width="100" src="<%= Info.images(readMap["tupian"]) %>"/><% } %><input type="hidden" id="tupian" name="tupian" value="<%= Info.html(readMap["tupian"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">编号</label>
        <div class="col-sm-10">
            
                            <%= readMap["bianhao"] %><input type="hidden" id="bianhao" name="bianhao" value="<%= Info.html(readMap["bianhao"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">名称</label>
        <div class="col-sm-10">
            
                            <%= readMap["mingcheng"] %><input type="hidden" id="mingcheng" name="mingcheng" value="<%= Info.html(readMap["mingcheng"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">分类</label>
        <div class="col-sm-10">
            
                            <%  var mapfenlei17 = Dao.find("SELECT fenleiming,id FROM fenlei where id='"+readMap["fenlei"]+"'");  %><%= mapfenlei17["fenleiming"] %><input type="hidden" id="fenlei" name="fenlei" value="<%= Info.html(readMap["fenlei"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">价格</label>
        <div class="col-sm-10">
            
                            <%= readMap["jiage"] %><input type="hidden" id="jiage" name="jiage" value="<%= Info.html(readMap["jiage"]) %>"/>                    
        </div>
        
    </div>
</div>
                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">购买数<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                            <input type="number" class="form-control" placeholder="输入购买数" style="width:150px;" data-rule-required="true" data-msg-required="请填写购买数" number="true" data-msg-number="输入一个有效数字" min="1" max="<%= readMap["kucun"] %>" id="goumaishu" name="goumaishu" value=""/>                    
        </div>
        
    </div>
</div>
                            <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">购买人</label>
        <div class="col-sm-10">
            
                            <input type="text" class="form-control" placeholder="输入购买人" style="width:150px;" readonly="readonly" id="goumairen" name="goumairen" value="<%= Session["username"] %>"/>                    
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


        
    
<!-- container定宽，并剧中结束 --></div>


</div>


<% Server.Execute("Footer.aspx"); %>
<% Server.Execute("Foot.aspx"); %>