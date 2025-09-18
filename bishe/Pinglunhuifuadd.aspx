<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pinglunhuifuadd.aspx.cs" Inherits="Pinglunhuifuadd" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>
<% Server.Execute("Header.aspx"); %>

<script src="js/jquery.validate.js"></script>


<div>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->


        <div class="panel panel-default">
            <div class="panel-heading">
                <span class="titles">
                    添加评论回复
                </span>
            </div>
            <div class="panel-body">


                <form action="Pinglunhuifuadd.aspx?f=f" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <input type="hidden" name="pinglunid" value="<%= Request["id"] %>"/>
                    <div style="display: none" class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">表<span style="color: red;">*</span></label>
                            <div class="col-sm-10">

                                <%= readMap["biao"] %><input type="hidden" id="biao" name="biao" value="<%= Info.html(readMap["biao"]) %>"/>
                            </div>

                        </div>
                    </div>
                    <div style="display: none" class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">表id<span style="color: red;">*</span></label>
                            <div class="col-sm-10">

                                <%= readMap["biaoid"] %><input type="hidden" id="biaoid" name="biaoid" value="<%= Info.html(readMap["biaoid"]) %>"/>
                            </div>

                        </div>
                    </div>
                    <div style="display: none" class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">标题<span style="color: red;">*</span></label>
                            <div class="col-sm-10">

                                <%= readMap["biaoti"] %><input type="hidden" id="biaoti" name="biaoti" value="<%= Info.html(readMap["biaoti"]) %>"/>
                            </div>

                        </div>
                    </div>
                    <div style="display: none" class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">评论内容</label>
                            <div class="col-sm-10">

                                <pre style="padding: 5px;background: none;border: none;margin: 0;"><%= readMap["pinglunneirong"] %></pre><input type="hidden" id="pinglunneirong" name="pinglunneirong" value="<%= Info.html(readMap["pinglunneirong"]) %>"/>
                            </div>

                        </div>
                    </div>
                    <div style="display: none" class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">评论人</label>
                            <div class="col-sm-10">

                                <%= readMap["pinglunren"] %><input type="hidden" id="pinglunren" name="pinglunren" value="<%= Info.html(readMap["pinglunren"]) %>"/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">回复内容</label>
                            <div class="col-sm-10">

                                <textarea style="width: 80%;height: 120px" class="form-control" placeholder="输入回复内容" id="huifuneirong" name="huifuneirong"></textarea>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">回复人</label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" placeholder="输入回复人" style="width:150px;" readonly="readonly" id="huifuren" name="huifuren" value="<%= Session["username"] %>"/>
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

                    <!--form标签结束-->
                </form>


                <script>
    $(function (){
        $('#form1').validate();
    });
</script>


            </div>
        </div>


        <!-- container定宽，并剧中结束 -->
    </div>


</div>


<% Server.Execute("Footer.aspx"); %>
<% Server.Execute("Foot.aspx"); %>