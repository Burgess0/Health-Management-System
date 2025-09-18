<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pay.aspx.cs" Inherits="Pay" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width" />
    <meta name="renderer" content="webkit">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/payment/style.css">
    <script src="js/jquery.js"></script>
</head>
<body>
<form method="post" id="paymentForm" runat="server">
<div class="container">
    <div class="hd">
        <div class="hd-main">
            <%--<div class="ep-logo" style="padding-top: 0px">
                 <div class="ep-order-status">
                     <h1>订单模拟支付</h1>
                 </div>
            </div>--%>
            <div class="ep-hd-info">
                <div class="ep-order-status">
                    <h1>订单模拟支付</h1>
                </div>
            </div>
            <div class="user-info">
                <p>账号：xxxxxxxxxx</p>
            </div>
        </div>
    </div>
    <div class="bd">
            <div class="bd-main">
                <div class="ep-wrapper">
                    <div class="ep-pay-step ep-step-channel bd-main-container" style="display: block;">
                        <div class="ep-order-detail">
                            <div>
                                <% if (!string.IsNullOrEmpty(Request["dingdanbianhao"])) {  %>
                                <div class="ep-order-tit">
                                    <dl>
                                        <dt>商品订单：</dt>
                                        <dd>
                                            <%=Request["dingdanbianhao"]%>
                                            <input type="hidden" name="dingdanbianhao" value="<%= Req.get("dingdanbianhao") %>">
                                        </dd>
                                    </dl>
                                </div>
                                <% } %>
                                <% if (!string.IsNullOrEmpty(Request["zongji"]))
                                   { %>
                                <div class="ep-order-tit">
                                    <span>支付金额：<em class="rmb"><i>¥</i><%= Request["zongji"] %></em></span>
                                    <input type="hidden" name="zongji" value="<%= Req.get("zongji") %>">
                                </div>
                                <% } %>
                            </div>
                        </div>
                        <div class="ep-pay-method ep-pay-methods">
                            <dl>
                                <dt>支付方式：</dt>
                                <dd class="pay-channel" id="pay-channel">
                                    <div class="ep-pay-method-list-tit">
                                        <ul>
                                            <li class="selected" data-type="wechat" title="微信支付">
                                                <span class="ep-icon ep-icon-wxpay"></span> <span class="ep-pay-method-name">微信支付</span> <i class="ep-icon ep-icon-selected"></i>
                                            </li>
                                            <li class="" data-type="alipay" title="支付宝支付">
                                                <span class="ep-icon ep-icon-alipay"></span> <span class="ep-pay-method-name">支付宝支付</span>
                                            </li>
                                            <li class="" data-type="qqwallet" title="QQ钱包支付">
                                                <span class="ep-icon ep-icon-qqpay"></span> <span class="ep-pay-method-name">QQ钱包支付</span>
                                            </li>
                                            <li class="" data-type="bank" title="网银支付">
                                                <span class="ep-icon ep-icon-unionpay"></span> <span class="ep-pay-method-name">网银支付</span>
                                                <p class="ep-pay-method-list-txt reminder-tip">推荐使用IE浏览器</p>
                                            </li>
                                        </ul>
                                    </div>

                                    <script>
                                    $('#pay-channel').on("click" , "li" , function(e) {
                                      $('#pay-channel li.selected').removeClass('selected').find('i.ep-icon-selected').remove();
                                      $(this).addClass('selected').append('<i class="ep-icon ep-icon-selected"></i>');

                                    })
                                    </script>

                                    <div class="ep-pay-method-list-con" style="display: none">
                                        <div class="con channel-wechat show">
                                            <div class="clearfix">
                                                <%--<div class="fl">
                                                    <div class="ep-qrcode-loading hide">
                                                        <img src="//midas.gtimg.cn/enterprise/images/loading.gif" width="80" height="80">
                                                    </div>
                                                    <div class="ep-wxpay-qrcode-wrap">
                                                        <img src="//pay.qq.com/cgi-bin/account/get_qr_image.cgi?size=200&amp;orig=1&amp;url=weixin%3A%2F%2Fwxpay%2Fbizpayurl%3Fpr%3DWAMTVsC" height="200" width="200" class="ep-wxpay-qrcode">
                                                    </div>
                                                    <div class="ep-wxpay-qrcode-notice">请打开手机微信，扫一扫完成支付</div>
                                                </div>
                                                <div class="fl ep-wxpay-qrcode-tip">
                                                    <img src="//midas.gtimg.cn/enterprise/images/ep_sys_wx_tip.jpg">
                                                </div>--%>
                                            </div>
                                            <!--<div class="ep-qrcode-notice">距离二维码过期还剩<em>30</em>秒，过期后请刷新页面重新获取二维码</div>-->
                                        </div>
                                        <div class="con channel-alipay">
                                            <div class="clearfix">
                                                <div class="fl">
                                                    <div class="ep-qrcode-loading hide">
                                                        <img src="//midas.gtimg.cn/enterprise/images/loading.gif" width="80" height="80">
                                                    </div>
                                                    <div class="ep-wxpay-qrcode-wrap">
                                                        <img src="//pay.qq.com/cgi-bin/account/get_qr_image.cgi?size=200&amp;url=https%3A%2F%2Fpay.qq.com%2Fh5%2FmqqPay.shtml%3F_wv%3D1027%26pf%3Dep.scan.qqwallet%26usr%3D2074535077%26env%3Dlive%26id%3D1450008583%26target%3Dqr%26title%3D%25E8%2585%25BE%25E8%25AE%25AF%25E4%25BA%2591%26t%3D5Mcd144d4cce6c7a1254bc4860011bbf%26a%3D100703379%26b%3D1000016101" height="200" width="200" class="ep-qqpay-qrcode">
                                                    </div>
                                                    <div class="ep-qqpay-qrcode-notice">请打开手机QQ，扫一扫完成支付</div>
                                                </div>
                                                <div class="fl ep-wxpay-qrcode-tip">
                                                    <img src="//midas.gtimg.cn/enterprise/images/ep_sys_qq_tip.jpg">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="con channel-qqwallet">
                                            <div class="clearfix">
                                                <div class="fl">
                                                    <div class="ep-qrcode-loading hide">
                                                        <img src="//midas.gtimg.cn/enterprise/images/loading.gif" width="80" height="80">
                                                    </div>
                                                    <div class="ep-wxpay-qrcode-wrap">
                                                        <img src="//pay.qq.com/cgi-bin/account/get_qr_image.cgi?size=200&amp;url=https%3A%2F%2Fpay.qq.com%2Fh5%2FmqqPay.shtml%3F_wv%3D1027%26pf%3Dep.scan.qqwallet%26usr%3D2074535077%26env%3Dlive%26id%3D1450008583%26target%3Dqr%26title%3D%25E8%2585%25BE%25E8%25AE%25AF%25E4%25BA%2591%26t%3D5Mcd144d4cce6c7a1254bc4860011bbf%26a%3D100703379%26b%3D1000016101" height="200" width="200" class="ep-qqpay-qrcode">
                                                    </div>
                                                    <div class="ep-qqpay-qrcode-notice">请打开手机QQ，扫一扫完成支付</div>
                                                </div>
                                                <div class="fl ep-wxpay-qrcode-tip">
                                                    <img src="//midas.gtimg.cn/enterprise/images/ep_sys_qq_tip.jpg">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="con channel-bank">
                                            <div class="ep-unionpay-con">
                                                <div class="ep-unionpay-banks">
                                                    <div class="layer-neat-l banktype">
                                                        <span class="label">银行类型：</span> <label class="selected" data-banktype="peBank" data-action="banktype"> <input type="radio"> <i class="ep-icon ep-icon-radio"></i>个人银行 </label> <label data-banktype="epBank" data-action="banktype"> <input type="radio"> <i class="ep-icon ep-icon-radio"></i>企业银行 </label>
                                                    </div>
                                                    <div class="mod-bank cf">
                                                        <span class="title">选择银行</span>
                                                        <div class="bank-list epBank" style="display:none">
                                                            <label class="bank-logo-wrap" data-bank="icbc" data-action="bank">
                                                                 <i class="ico_icbc"></i>工商银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="abc" data-action="bank">
                                                                 <i class="ico_abc"></i>农业银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="cmb" data-action="bank">
                                                                 <i class="ico_cmb"></i>招商银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="boco" data-action="bank">
                                                                 <i class="ico_boco"></i>交通银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="ccb" data-action="bank">
                                                                 <i class="ico_ccb"></i>建设银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="spdb" data-action="bank">
                                                                 <i class="ico_ccb"></i>浦发银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="cebb" data-action="bank">
                                                                 <i class="ico_cebb"></i>光大银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="cib" data-action="bank">
                                                                 <i class="ico_cib"></i>兴业银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="boc" data-action="bank">
                                                                 <i class="ico_boc"></i>中国银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="pingan" data-action="bank">
                                                                 <i class="ico_pingan"></i>平安银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                        </div>
                                                        <div class="bank-list peBank" style="display:block">
                                                            <label class="bank-logo-wrap" data-bank="icbc" data-action="bank">
                                                                 <i class="ico_icbc"></i>工商银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="abc" data-action="bank">
                                                                 <i class="ico_abc"></i>农业银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="cmb" data-action="bank">
                                                                 <i class="ico_cmb"></i>招商银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="ccb" data-action="bank">
                                                                 <i class="ico_ccb"></i>建设银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="boc" data-action="bank">
                                                                 <i class="ico_boc"></i>中国银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="post" data-action="bank">
                                                                 <i class="ico_post"></i>邮政银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="boco" data-action="bank">
                                                                 <i class="ico_boco"></i>交通银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="gdb" data-action="bank">
                                                                 <i class="ico_gdb"></i>广发银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="cmbc" data-action="bank">
                                                                 <i class="ico_cmbc"></i>民生银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="pingan" data-action="bank">
                                                                 <i class="ico_pingan"></i>平安银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="cebb" data-action="bank">
                                                                 <i class="ico_cebb"></i>光大银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="cib" data-action="bank">
                                                                 <i class="ico_cib"></i>兴业银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="ecitic" data-action="bank">
                                                                 <i class="ico_ecitic"></i>中信银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="bob" data-action="bank">
                                                                 <i class="ico_bob"></i>北京银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="srcb" data-action="bank">
                                                                 <i class="ico_srcb"></i>上海农商 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="spdb" data-action="bank">
                                                                 <i class="ico_spdb"></i>浦发银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="nbcb" data-action="bank">
                                                                 <i class="ico_nbcb"></i>宁波银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="njcb" data-action="bank">
                                                                 <i class="ico_njcb"></i>南京银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                            <label class="bank-logo-wrap" data-bank="hkbea" data-action="bank">
                                                                 <i class="ico_hkbea"></i>东亚银行 <i class="ep-icon ep-icon-check"></i>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="layer-neat-l cardtype">
                                                        <span class="label">选择卡种：</span>
                                                        <label class="disabled debit" data-action="cardtype" data-cardtype="debit">
                                                             <input type="radio"> <i class="ep-icon ep-icon-radio"></i>储蓄卡
                                                        </label>
                                                        <label class="disabled credit" data-action="cardtype" data-cardtype="credit">
                                                             <input type="radio"> <i class="ep-icon ep-icon-radio"></i>信用卡
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="con channel-icard ">
                                            <div class="ep-tenpay-con">
                                                <div>
                                                    <img src="//midas.gtimg.cn/enterprise/images/ep_tenpay_con_tip.jpg" height="37" width="128" alt="">
                                                </div>
                                                <div class="text">在新打开的页面完成支付</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ep-qrcode-error-tip" style="display: none;">
                                        <span class="ep_icon_warning_tip"></span><span class="ep_warning_text"></span>
                                    </div>
                                     <div class="ep-pay-operate">
                                         <input type="hidden" name="id" value="<%= Req.get("id") %>">
                                         <input type="hidden" name="biao" value="<%= Req.get("biao") %>">
                                          <asp:Button runat="server" CssClass="ep-btn ep-btn-blue" Text="立即支付" OnClick="ButtonClick"></asp:Button>
                                     </div>
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="ep-pay-step ep-step-pending"></div>
                    <div class="ep-pay-step ep-step-success"></div>
                    <div class="ep-pay-step ep-step-fail"></div>
                </div>
            </div>
        </div>

</div>
</form>
</body>
</html>
