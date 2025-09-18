<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Jiankang_detail.aspx.cs" Inherits="Jiankang_detail" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>





<div>



<div class="panel panel-default">
    <div class="panel-heading">
        <span class="titles">
            详情
        </span>
    </div>
    <div class="panel-body">
        
    

<div class="pa10">
    <div class="pa10 bg-white">
        <table class="new-detail">
            <tbody>
            <tr>
                                    <td class="detail-title">
                        日期                    </td>
                    <td class="detail-value">
                        <%= map["riqi"] %>                    </td>
                                                        <td class="detail-title">
                        饮食信息                    </td>
                    <td class="detail-value">
                        <%= map["yinshixinxi"] %>                    </td>
                                                        <td class="detail-title">
                        饮食热量值                    </td>
                    <td class="detail-value">
                        <%= map["yinshireliangzhi"] %>                    </td>
                    </tr><tr>                                    <td class="detail-title">
                        年龄                    </td>
                    <td class="detail-value">
                        <%= map["nianling"] %>                    </td>
                                                        <td class="detail-title">
                        身高                    </td>
                    <td class="detail-value">
                        <%= map["shengao"] %>                    </td>
                                                        <td class="detail-title">
                        体重                    </td>
                    <td class="detail-value">
                        <%= map["tizhong"] %>                    </td>
                    </tr><tr>                                    <td class="detail-title">
                        心率                    </td>
                    <td class="detail-value">
                        <%= map["xinlv"] %>                    </td>
                                                        <td class="detail-title">
                        BMI                    </td>
                    <td class="detail-value">
                        <%= map["bmi"] %>                    </td>
                                                        <td class="detail-title">
                        运动类型                    </td>
                    <td class="detail-value">
                        <%  var mapleixing28 = Dao.find("SELECT leixingming,id FROM leixing where id='"+map["yundongleixing"]+"'");  %><%= mapleixing28["leixingming"] %>                    </td>
                    </tr><tr>                                    <td class="detail-title">
                        运动时长                    </td>
                    <td class="detail-value">
                        <%= map["yundongshizhang"] %>                    </td>
                                                        <td class="detail-title">
                        运动热量值                    </td>
                    <td class="detail-value">
                        <%= map["yundongreliangzhi"] %>                    </td>
                                                        <td class="detail-title">
                        基础代谢率                    </td>
                    <td class="detail-value">
                        <%= map["jichudaixielv"] %>                    </td>
                    </tr><tr>                                    <td class="detail-title">
                        用户                    </td>
                    <td class="detail-value">
                        <%= map["yonghu"] %>                    </td>
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
                备注            </div>
            <td class="detail-value">
                <pre style="padding: 5px;background: none;border: none;margin: 0;"><%= map["beizhu"] %></pre>            </td>
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