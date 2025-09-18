<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Jiankangtongji.aspx.cs" Inherits="Jiankangtongji" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<script src="js/echarts/echarts.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>


<div>

    <%
        var where = " 1=1 ";
        object Request;

        if ("用户".Equals(Session["cx"]))
        {
            where += " AND jktj.yonghu='" + Session["yonghuming"] + "' ";
        }

        var jiankangList = Db.name("jiankang")
            .alias("jktj")
            .field("jktj.riqi as yonghu")
            .order("jktj.riqi asc")
            .field("(jktj.yinshireliangzhi) sum_yinshireliangzhi")
            .field("(jktj.bmi) sum_bmi")
            .field("(jktj.yundongshizhang) sum_yundongshizhang")
            .field("(jktj.jichudaixielv) sum_jichudaixielv")
            .where(where).select();
    %>

    
    

    
    
    <div style="padding: 20px">

    </div>


</div>




<div>

    <div id="lineOptionsKey1" class="" style="height: 300px;background-color: #ffffff;padding: 20px"></div>


    <script>
    var chartDom = document.getElementById('lineOptionsKey1');
    var myChart = echarts.init(chartDom);
    var option = {
        title: {
            text: "饮食统计"
        },
        tooltip: {
            trigger: 'axis'
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: [
                <% foreach (var v in jiankangList)
                   {
                %>
                    '<%= v["yonghu"] %>',
                <% } %>
            ]
        },
        yAxis: {
            type: 'value'
        },
        series: [
                        {
                name: '饮食热量值',
                type: 'line',
                stack: 'Total',
                data: [
                    <% foreach (var v in jiankangList)
                       {
                    %>
                        <%= v["sum_yinshireliangzhi"] %>,
                    <% } %>
                ]
            },
                    ]
    }

    option && myChart.setOption(option);
</script>


</div>


<div>

    <div id="lineOptionsKey2" class="" style="height: 300px;background-color: #ffffff;padding: 20px"></div>


    <script>
    var chartDom = document.getElementById('lineOptionsKey2');
    var myChart = echarts.init(chartDom);
    var option = {
        title: {
            text: "bmi统计"
        },
        tooltip: {
            trigger: 'axis'
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: [
                <% foreach (var v in jiankangList)
                   {
                %>
                    '<%= v["yonghu"] %>',
                <% } %>
            ]
        },
        yAxis: {
            type: 'value'
        },
        series: [
                        {
                name: 'BMI',
                type: 'line',
                stack: 'Total',
                data: [
                    <% foreach (var v in jiankangList)
                       {
                    %>
                        <%= v["sum_bmi"] %>,
                    <% } %>
                ]
            },
                    ]
    }

    option && myChart.setOption(option);
</script>


</div>


<div>

    <div id="barOptionsKey1" class="" style="height: 300px;background-color: #ffffff;padding: 20px"></div>


    <script>
    (function (){
		var chartDom = document.getElementById('barOptionsKey1');
		var myChart = echarts.init(chartDom);
        var xValue = [];
        var yValue = [];
        <% foreach (var v in jiankangList)
           {
        %>
        xValue.push('<%= v["yonghu"] %>');
        <% } %>



		var option = {
			title: {
				text: '运动统计'
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


<div>

    <div id="lineOptionsKey3" class="" style="height: 300px;background-color: #ffffff;padding: 20px"></div>


    <script>
    var chartDom = document.getElementById('lineOptionsKey3');
    var myChart = echarts.init(chartDom);
    var option = {
        title: {
            text: "代谢统计"
        },
        tooltip: {
            trigger: 'axis'
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: [
                <% foreach (var v in jiankangList)
                   {
                %>
                    '<%= v["yonghu"] %>',
                <% } %>
            ]
        },
        yAxis: {
            type: 'value'
        },
        series: [
                        {
                name: '基础代谢率',
                type: 'line',
                stack: 'Total',
                data: [
                    <% foreach (var v in jiankangList)
                       {
                    %>
                        <%= v["sum_jichudaixielv"] %>,
                    <% } %>
                ]
            },
                    ]
    }

    option && myChart.setOption(option);
</script>


</div>


