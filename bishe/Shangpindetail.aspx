<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shangpindetail.aspx.cs" Inherits="Shangpindetail" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>
<% Server.Execute("Header.aspx"); %>
<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<script src="js/jquery.validate.js"></script>


<div>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->


        <div class="title-modelbox-widget">
            <h3 class="section-title">
                产品详情
            </h3>
            <div class="sidebar-widget-body">


                <div class="">
                    <div class="goods-info clearfix">
                        <div class="gallery-list">
                            <div class="swiper-container gallery-top" id="shangpin-galler">
                                <div class="swiper-wrapper">
                                </div>
                            </div>
                            <div class="swiper-container gallery-thumbs" id="shangpin-thumb">
                                <div class="swiper-wrapper">
                                </div>
                            </div>
                        </div>
                        <div class="goods-right-content">
                            <h3 class="title"><%= map["mingcheng"] %></h3>
                            <div class="descount">
                                <div>
                                    <span class="name">
                                        编号：
                                    </span>
                                    <span class="val">
                                        <%= map["bianhao"] %>
                                    </span>
                                </div>
                                <div>
                                    <span class="name">
                                        分类：
                                    </span>
                                    <span class="val">
                                        <% var mapfenlei5 = Dao.find("SELECT fenleiming,id FROM fenlei where id='" + map["fenlei"] + "'"); %><%= mapfenlei5["fenleiming"] %>
                                    </span>
                                </div>
                                <div>
                                    <span class="name">
                                        价格：
                                    </span>
                                    <span class="val">
                                        <%= map["jiage"] %>
                                    </span>
                                </div>
                                <div>
                                    <span class="name">
                                        库存：
                                    </span>
                                    <span class="val">
                                        <%= map["kucun"] %>
                                    </span>
                                </div>
                                <div>
                                    <span class="name">
                                        销量：
                                    </span>
                                    <span class="val">
                                        <%= map["xiaoliang"] %>
                                    </span>
                                </div>
                                <div>
                                    <span class="name">
                                        是否新品：
                                    </span>
                                    <span class="val">
                                        <%= map["shifouxinpin"] %>
                                    </span>
                                </div>
                            </div>

                            <div class="mt10">
                                <a class="btn btn-info" href="Gouwucheadd.aspx?id=<%= map["id"] %>"> 加入购物车 </a>


                                <% var shoucangCount = Db.name("shoucang").@where("biao", "shangpin").@where("xwid", map["id"]).field("count(*) as count").find();
                                %>
                                <% if (Session["username"] != null && !("".Equals(Session["username"])))
                                   { %>
                                    <% var shoucang = Db.name("shoucang").@where("biao", "shangpin").@where("xwid", map["id"]).@where("username", Session["username"]).field("count(*) as count").find();
                                    %>

                                    <button type="button" class="btn btn-default btn-collects-click" data-url="Shoucangadd.aspx?f=f&xwid=<%= map["id"] %>&biao=shangpin&biaoti=<%= map["mingcheng"] %>" data-confirm="取消收藏" data-text="收藏" data-is-zan="<%= shoucang["count"] %>" data-count="<%= shoucangCount["count"] %>">


                                    </button>
                                <% }
                                   else
                                   { %>
                                    <button type="button" class="btn btn-default btn-xs" onclick="alert('请登录后操作')">

                                        收藏
                                        <span class="badge">
                                            <%= shoucangCount["count"] %>
                                        </span>

                                    </button>
                                <% } %>

                                <script>
    encodeURIComponent(location.href);

</script>

                            </div>
                        </div>
                    </div>
                    <div class="goods-content">
                        <%= map["xiangqing"] %>
                    </div>

                    <script>
        (function () {
            var images = "<%= map["tupian"] %>".split(",");
            if(images.length>0){
                for (var i=0;i < images.length;i++){
                    var path = images[i]
                    var src = '<div class="swiper-slide"><div class="img-box pb100"><div class="img" style="background-image: url('+path+')"></div></div></div>';
                    $('#shangpin-galler .swiper-wrapper').append(src);
                    $('#shangpin-thumb .swiper-wrapper').append(src);
                }

                var thumbsSwiper = new Swiper('#shangpin-thumb',{
                    spaceBetween: 10,
                    slidesPerView: 4,
                    watchSlidesVisibility: true,//防止不可点击
                })
                var gallerySwiper = new Swiper('#shangpin-galler',{
                    spaceBetween: 10,
                    thumbs: {
                        swiper: thumbsSwiper,
                    }
                })
            }

        })();

    </script>

                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


        <!-- container定宽，并剧中结束 -->
    </div>


</div>


<div>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->


        <div class="title-modelbox-widget">
            <h3 class="section-title">
                评论区
            </h3>
            <div class="sidebar-widget-body">


                <div class="gr-control-module-table">
                    <div class="">
                        <form action="pinglunadd.aspx?f=f" method="post">
                            <!-- form 标签开始 -->

                            <div class="form-group" style="display: none">
                                <div class="row">
                                    <label style="text-align: right" class="col-sm-2 hiddex-xs">评分</label>
                                    <div class="col-sm-10">

                                      

                                    </div>

                                </div>
                            </div>
                            <div class="form-group">

  <select style="width: 80%;height: 30px" class="form-control" name="pingfen">

                                            <option value="1">1分</option>
                                            <option value="2">2分</option>
                                            <option value="3">3分</option>
                                            <option value="4">4分</option>
                                            <option value="5">5分</option>

                                        </select>
                                <textarea style="width: 80%;height: 120px" class="form-control" name="pinglunneirong" placeholder="请输入评论内容"></textarea>

                            </div>
                            <input type="hidden" name="biao" value="shangpin"/>
                            <input name="biaoid" type="hidden" id="biaoid" value="<%= Request["id"] %>"/>
                            <input name="biaoti" type="hidden" id="biaoti" value="<%= map["mingcheng"] %>"/>
                            <input name="pinglunren" type="hidden" value="<%= Session["username"] %>"/>
                            <input type="hidden" class="referer_href" id="referer" name="referer" value=""/>
                            <script>
                $(function () {
                    $('.referer_href').val(location.href)
                });
            </script>

                            <div style="text-align: left">
                                
                                       <% if ("用户".Equals(Session["cx"]))
                                                   { %>
                                                  <button type="submit" class="btn btn-primary">
                                                                                发布评论
                                                                            </button>
                                                <% } %>
                                
                                
                                
                          
                            </div>

                            <!--form标签结束-->
                        </form>
                    </div>

                    <% var pinglunList = Db.name("pinglun").@where("biao", "shangpin").@where("biaoid", Request["id"]).@order("id desc").select();
                    %>

                    <div class="mt10">
                        <% foreach (var pl in pinglunList)
                           {
                        %>
                            <% var user = Db.name("yonghu").@where("yonghuming", pl["pinglunren"]).find();
                            %>

                            <div class="comment clearfix">
                                <div class="common-avatar J_User">
                                    <% if (user["touxiang"] == null || "".Equals(user["touxiang"]))
                                       { %>
                                        <img src="images/default.gif" width="100%" height="100%"/>
                                    <% }
                                       else
                                       { %>
                                        <img src="<%= user["touxiang"] %>" width="100%" height="100%"/>
                                    <% } %>
                                </div>
                                <div class="comment-block">
                                    <p class="comment-user">
                                        <span class="comment-username J_User"> <%= user["xingming"] %> </span>
                                        <span class="comment-time"><%= pl["addtime"] %></span>
      <span class="comment-username J_User"> 评分:<%= pl["pingfen"] %>分 </span>
                                 
                                        
                                               <% if ("用户".Equals(Session["cx"]))
                                                           { %>
                                                       <a href="Pinglunhuifuadd.aspx?id=<%= pl["id"] %>">回复</a>
                                                        <% } %>
                                        
                                        
                                        
                                    </p>
                                    <div class="comment-content J_CommentContent"><%= pl["pinglunneirong"] %></div>

                                    <% var huifuList = Db.name("pinglunhuifu").@where("pinglunid", pl["id"]).@order("id desc").select();
                                    %>

                                    <div class="reply J_ReplyBlock">
                                        <% foreach (var hf in huifuList)
                                           {
                                        %>
                                            <div class="reply-block">
                                                <div class="reply-content">
                                                    <span class="reply-user">
                                                        <b class="reply-user-nick J_User" data-userid="120161158"><%= hf["huifuren"] %></b> :
                                                    </span>
                                                    <%= hf["huifuneirong"] %>
                                                </div>
                                                <div class="reply-operate reply-operate--hot">
                                                    <i class="reply-dot">·</i>
                                                    <span><%= hf["addtime"] %></span>
                                                </div>
                                            </div>
                                        <% } %>

                                    </div>

                                </div>
                            </div>
                        <% } %>
                    </div>

                </div>


            </div>
            <!-- /.sidebar-widget-body -->
        </div>


        <!-- container定宽，并剧中结束 -->
    </div>


</div>


<% Server.Execute("Footer.aspx"); %>
<% Server.Execute("Foot.aspx"); %>