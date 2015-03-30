<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<h3 class="ptitle text-center">投票：<span class="toupiao-title"></span></h3>
<div class="row-fluid">
	<div  class="offset1 span10" style="box-shadow: 0 0 7px 0 rgba(0, 0, 0, 0.10);background-color: #fff;padding-top:10px;">
		<div id="chart-toupiao" style="width:100%;height:300px;"></div>
	</div>
</div>
<div class="row-fluid toupiao-main" style="margin-top:20px;font-size:16px;">
	<div class="offset1 span10">
		<h4>题目：</h4>
		<p class="toupiao-content"></p>

	    <button id="toupiao-sure" class="btn btn-primary pull-right" type="button">确 定</button>
	</div>
</div>

<script>
    var myChart = echarts.init(document.getElementById('chart-toupiao'));
    var option = {
		    title: {
		        x: 'left',
		        text: '当前投票结果',
		        textStyle:{
				    color: '#038BCE'
				} 
		    },
		    tooltip: {
		        trigger: 'item'
		    },
		    toolbox: {
		        show: true,
		        feature: {
		            restore: {show: true},
		            saveAsImage: {show: true}
		        }
		    },
		    calculable: true,
		    grid: {
		        borderWidth: 0,
		        y: 80,
		        y2: 60
		    },
		    xAxis: [
		        {
		            type: 'category',
		            show: false,
		            data: []
		        }
		    ],
		    yAxis: [
		        {
		            type: 'value',
		            show: true
		        }
		    ],
		    series: [
		        {
		            name: '社区投票统计',
		            type: 'bar',
		            itemStyle: {
		                normal: {
		                    color: function(params) {
		                        // build a color map as your need.
		                        var colorList = [
		                          '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
		                           '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
		                           '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
		                        ];
		                        return colorList[params.dataIndex]
		                    },
		                    label: {
		                        show: true,
		                        position: 'top',
		                        formatter: '{b}\n{c}'
		                    }
		                }
		            },
		            data: []
		        }
		    ]
		};
    //-----请求数据-----
    /* $,ajax({
    	//url:...,
    	success:function(data){
    		option.xAxis[0].data = ['选项1', '选项2', '选项三', '选项4', '选项5'];
    		option.series[0].data=[12,21,10,4,12];
    		myChart.setOption(option);
    		//假设选项有 
    	}
    }); */
    /*======—将这后面的行代码放到ajax成功后执行。  ===========*/
    //给标题和题目赋值
    $(".toupiao-content").text("这里是投票的说明文字，或者内容等一些废话的地方。");
    $(".toupiao-title").text("投票的标题");
    //x轴
    //假设选项数组dlist
    var dList=[{value:1,text:'选项1'}, {value:2,text:'选项2'}, {value:3,text:'选项3'}, {value:4,text:'选项4'}, {value:5,text:'选项5'}];
    
    //重新整合数据
    var xAxisList = [];
    //生成选项表单
    var hStr = '<label class="radio"><input type="radio" name="optionsRadios" id="optionsRadios2" value="{value}">{text}</label>';
	var allString ='';
    for(var i=0;i<dList.length;i++){
		xAxisList.push(dList[i].text);
		allString += hStr.replace(/{value}/g,dList[i].value)
						 .replace(/{text}/g,dList[i].text);
	};
		$("#toupiao-sure").before(allString);
    option.xAxis[0].data = xAxisList;
    //y轴数据，与x轴一一对应
    option.series[0].data=[12,21,10,4,12];      
    myChart.setOption(option);

     /*======—将这前面面的行代码放到ajax成功后执行。  ===========*/
    
</script>