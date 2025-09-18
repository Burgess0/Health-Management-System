<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Leixingtongji.aspx.cs" Inherits="Leixingtongji" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<% Server.Execute("Head.aspx"); %>
<script src="js/echarts/echarts.js"></script>


<div>

    <%
        var where = " 1=1 ";

    if ("用户".Equals(Session["cx"]))
        {
            where += " AND lx.yonghu='" + Session["yonghuming"] + "' ";
        }
        var jiankangList = Db.name("jiankang")
	        .alias("lx")
	        
	        .joinLeft("leixing ji", "lx.yundongleixing=ji.id")
	        .field("ji.leixingming").group("ji.leixingming")
	        .field("sum(lx.yundongshizhang) sum_yundongshizhang")
	        .where(where).select();
    %>




</div>


<div>


    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">


            <div class="col-md-6">


                <div id="barOptionsKey2" class="" style="height: 300px;background-color: #ffffff;padding: 20px"></div>


                <script>
    (function (){
		var chartDom = document.getElementById('barOptionsKey2');
		var myChart = echarts.init(chartDom);
        var xValue = [];
        var yValue = [];
        <% foreach (var v in jiankangList)
           {
        %>
        xValue.push('<%= v["leixingming"] %>');
        <% } %>



		var option = {
			title: {
				text: '运动时长统计'
			},
			tooltip: {
				trigger: 'axis',
				axisPointer: {
					type: 'shadow'
				}
			},
			grid: {
				left: '3%',
				right: '4%',
				bottom: '3%',
				containLabel: true
			},
			xAxis: [
				{
					type: 'category',
					data: xValue,
					axisTick: {
						alignWithLabel: true
					}
				}
			],
			yAxis: [
				{
					type: 'value'
				}
			],
			series: [
								{
					name: '运动时长',
					type: 'bar',
					barWidth: '20px',
					data: [
						<% foreach (var v in jiankangList)
						   {
						%>
						<%= v["sum_yundongshizhang"] %>,
						<% } %>


					],
				},
							]
		}

		option && myChart.setOption(option);
    })();

</script>


            </div>
            <div class="col-md-6">


                <div id="pieOptionsKey2" class="" style="height: 300px;background-color: #ffffff;padding: 20px"></div>


                <script>
    var chartDom = document.getElementById('pieOptionsKey2');
    var myChart = echarts.init(chartDom);
    var option = {
        title: {
            text: '占比统计',
            left: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter:'{b}：{c},{d}%'
        },
        legend: {
            orient: 'vertical',
            left: 'left'
        },
        series: [
            {
                name: '运动时长',
                type: 'pie',
                radius: '50%',
                data: [
                    <% foreach (var v in jiankangList)
                       {
                    %>
                    {
                        value:parseFloat("<%= v["sum_yundongshizhang"] %>"),
                        name:'<%= v["leixingming"] %>'
                    },
                    <% } %>
                ],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    }

    option && myChart.setOption(option);
</script>


            </div>


        </div>


        <!-- container定宽，并剧中结束 -->
    </div>


</div>


<% Server.Execute("Foot.aspx"); %>