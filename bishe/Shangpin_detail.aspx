<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shangpin_detail.aspx.cs" Inherits="Shangpin_detail" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>

<link href="js/h5upload/h5upload.css" rel="stylesheet">
<script src="js/h5upload/h5upload.js"></script>




<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            商品详情
        </span>
    </div>
    <div class="panel-body">
        
    

<div class="pa10">
    <div class="pa10 bg-white">
        <table class="new-detail">
            <tbody>
            <tr>
                                    <td class="detail-title">
                        编号                    </td>
                    <td class="detail-value">
                        <%= map["bianhao"] %>                    </td>
                                                        <td class="detail-title">
                        名称                    </td>
                    <td class="detail-value">
                        <%= map["mingcheng"] %>                    </td>
                                                        <td class="detail-title">
                        分类                    </td>
                    <td class="detail-value">
                        <%  var mapfenlei9 = Dao.find("SELECT fenleiming,id FROM fenlei where id='"+map["fenlei"]+"'");  %><%= mapfenlei9["fenleiming"] %>                    </td>
                    </tr><tr>                                    <td class="detail-title">
                        价格                    </td>
                    <td class="detail-value">
                        <%= map["jiage"] %>                    </td>
                                                        <td class="detail-title">
                        库存                    </td>
                    <td class="detail-value">
                        <%= map["kucun"] %>                    </td>
                                                        <td class="detail-title">
                        是否新品                    </td>
                    <td class="detail-value">
                        <%= map["shifouxinpin"] %>                    </td>
                    </tr><tr>                                    <td class="detail-title">
                        销量                    </td>
                    <td class="detail-value">
                        <%= map["xiaoliang"] %>                    </td>
                                                        <td class="detail-title">
                        添加时间                    </td>
                    <td class="detail-value">
                        <%= map["addtime"] %>                    </td>
                                                </tr>
            </tbody>
        </table>
    </div>
        <div class="mt10 pa10 bg-white">
        <div class="new-detail-line">
            <div class="detail-title">
                图片            </div>
            <td class="detail-value">
                <fieldset class="images_box"><div id="gellay_images" class="imagesList"><script>
            var images = "<%= map["tupian"] %>".split(',');
            for(var i=0;i<images.length;i++){
                var image = images[i];
                var uploadImage = '<div class="uploadImage">' +
                '<span class="thumb thumbnail"><img src="'+image+'"/></span>'+
                '</div>';
                document.writeln(uploadImage);
            }
            
</script></div></fieldset>            </td>
        </div>
    </div>
        <div class="mt10 pa10 bg-white">
        <div class="new-detail-line">
            <div class="detail-title">
                详情            </div>
            <td class="detail-value">
                <%= map["xiangqing"] %>            </td>
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