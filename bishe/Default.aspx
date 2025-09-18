<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>
<% Server.Execute("Header.aspx"); %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>




<div>
<% var bhtList = Db.name("lunbotu").@order("id desc").@limit(5).select();
 %>

<div class="swiper-container" id="base/banner272">
    <div class="swiper-wrapper">
        <%  foreach(var bht in bhtList )
{ 
 %>
        <div class="swiper-slide">
            <div class="decoimg_b2">
                <a class="btn btn-" href="<%= bht["url"] %>" style="background-image: url('<%= bht["image"] %>'); height: 400px"></a>
            </div>
        </div>
        <% } %>
    </div>
    <!-- 如果需要分页器 -->
    <div class="swiper-pagination"></div>
    <!-- 如果需要导航按钮 -->
            <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>


<script>
    var mySwiper = new Swiper ('#base/banner272', {
        loop: true, // 循环模式选项
        autoplay:{
            delay:3000,
            disableOnInteraction:false
        },
        // 如果需要分页器
        pagination: {
            el: '.swiper-pagination',
        },
                // 如果需要前进后退按钮
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
                // 如果需要滚动条
        /*scrollbar: {
            el: '.swiper-scrollbar',
        },*/
    })
</script>


</div>




<div>

    
<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                    

    
<div class="title-modelbox-widget">
        <h3 class="section-title">
                        <div class="more">
                <a href="Zixunxinxilist.aspx">更多&gt;&gt;</a>
            </div>
                        健康资讯        </h3>
        <div class="sidebar-widget-body">
            

    
<div class="fengjing clearfix">
        <% var zixunxinxilist278 = Db.name("zixunxinxi").@limit(8).@order("id desc").select();
 %>                <div class="row">
    
            <%  foreach(var r in zixunxinxilist278 )
{ 
 %>
            <div class="col-md-3">
    
                <div class="card">
                    <a href="Zixunxinxidetail.aspx?id=<%= r["id"] %>">
                        <div class="img-box pb100">
                            <div class="img card-img-top" style="background-image: url('<%= r["tupian"] %>')"></div>
                        </div>
                    </a>
                    <div class="card-body">
                        <div class="feng">
                            <div class="feng-left">
                                <a href="Zixunxinxidetail.aspx?id=<%= r["id"] %>">
                                    <h5><%= Info.subStr(r["biaoti"], 15) %></h5>
                                </a>
                            </div>
                                                            <div class="feng-right">
                                    <div class="property-price">
                                        <h5>点击率：<%= r["dianjilv"] %></h5>
                                    </div>
                                </div>
                                                    </div>
                    </div>
                </div>
            
</div>
            <% } %>
        
</div>
        
    </div>



        </div>
        <!-- /.sidebar-widget-body -->
    </div>


        
    
<!-- container定宽，并剧中结束 --></div>


</div>




<div>

    
<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                    

    
<div class="title-modelbox-widget">
        <h3 class="section-title">
                        <div class="more">
                <a href="Shangpinlist.aspx">更多&gt;&gt;</a>
            </div>
                        健康产品        </h3>
        <div class="sidebar-widget-body">
            

    
<div class="floor_goods_wrap clearfix">
        <% var shangpinlist284 = Db.name("shangpin").@where("issh", "是").@limit(8).@order("id desc").select();
 %>                <div class="row">
    
            <%  foreach(var r in shangpinlist284 )
{ 
 %>
            <div class="col-md-3">
    
                <div class="floor_goods_wrap_li">
                    <div class="floor_goods_wrap_b clearfix">
                        <a href="Shangpindetail.aspx?id=<%= r["id"] %>" class="floor_goods_img">
                            <div class="img-box pb70">
                                <div class="img" style="background-image: url('<%= Info.images(r["tupian"]) %>')"></div>
                            </div>
                        </a>
                        <a href="Shangpindetail.aspx?id=<%= r["id"] %>" class="floor_goods_tit"><%= Info.subStr(r["bianhao"], 10) %></a>
                        <a href="Shangpindetail.aspx?id=<%= r["id"] %>" class="floor_goods_txt"><%= Info.subStr(r["xiangqing"], 15) %></a>
                                                <a href="Shangpindetail.aspx?id=<%= r["id"] %>" class="floor_goods_price">
                            ￥<%= r["jiage"] %>元
                        </a>
                        
                    </div>
                </div>

            
</div>
            <% } %>
        
</div>
            </div>


        </div>
        <!-- /.sidebar-widget-body -->
    </div>


        
    
<!-- container定宽，并剧中结束 --></div>


</div>


<% Server.Execute("Footer.aspx"); %>
<% Server.Execute("Foot.aspx"); %>