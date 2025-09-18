<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dingdan_detail.aspx.cs" Inherits="Dingdan_detail" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>





<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            订单详情
        </span>
    </div>
    <div class="panel-body">
        
    

<div class="pa10">
    <div class="pa10 bg-white">
        <table class="new-detail">
            <tbody>
            <tr>
                                    <td class="detail-title">
                        订单号                    </td>
                    <td class="detail-value">
                        <%= map["dingdanhao"] %>                    </td>
                                                        <td class="detail-title">
                        总额                    </td>
                    <td class="detail-value">
                        <%= map["zonge"] %>                    </td>
                                                        <td class="detail-title">
                        收货人                    </td>
                    <td class="detail-value">
                        <%= map["shouhuoren"] %>                    </td>
                    </tr><tr>                                    <td class="detail-title">
                        联系电话                    </td>
                    <td class="detail-value">
                        <%= map["lianxidianhua"] %>                    </td>
                                                        <td class="detail-title">
                        地址                    </td>
                    <td class="detail-value">
                        <%= map["dizhi"] %>                    </td>
                                                        <td class="detail-title">
                        状态                    </td>
                    <td class="detail-value">
                        <%= map["zhuangtai"] %>                    </td>
                    </tr><tr>                                    <td class="detail-title">
                        下单人                    </td>
                    <td class="detail-value">
                        <%= map["xiadanren"] %>                    </td>
                                                </tr>
            </tbody>
        </table>
    </div>
        <div class="mt10 pa10 bg-white">
        <div class="new-detail-line">
            <div class="detail-title">
                商品            </div>
            <td class="detail-value">
                <% var shangpinList = Db.name("dingdanshangpin").@where("dingdanid", map["id"]).@order("id desc").select();
 %><table class="table">

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
<%  foreach(var r in shangpinList )
{ 
 %>
<tr>
<td><%= r["bianhao"] %></td>
<td><%= r["mingcheng"] %></td>
<td><%  var mapfenlei23 = Dao.find("SELECT fenleiming,id FROM fenlei where id='"+r["fenlei"]+"'");  %><%= mapfenlei23["fenleiming"] %></td>
<td><%= r["jiage"] %></td>
<td><%= r["goumaishu"] %></td>
<td><%= r["xiaoji"] %></td>
<td><%= r["goumairen"] %></td>
<td><%= Info.subStr(r["addtime"], 19 , "") %></td>
</tr>
<% } %>
</tbody>

</table>
            </td>
        </div>
    </div>
        <div class="mt10 not-print">
        <button type="button" class="btn btn-default" onclick="history.go(-1);">
    返回
        
</button>
        <button type="button" class="btn btn-default" onclick="window.print()">
    打印本页
        
</button>
    </div>
</div>




    </div>
</div>


</div>


<% Server.Execute("Foot.aspx"); %>