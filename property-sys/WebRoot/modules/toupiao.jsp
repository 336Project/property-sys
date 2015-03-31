<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<h3 class="ptitle text-center">标题：<span class="toupiao-title"></span></h3>
<div class="row-fluid">
	<div  class="offset1 span10" style="box-shadow: 0 0 7px 0 rgba(0, 0, 0, 0.10);background-color: #fff;padding-top:10px;">
		<div id="chart-toupiao" style="width:100%;height:300px;"></div>
	</div>
</div>
<div class="row-fluid toupiao-main" style="margin-top:20px;font-size:16px;">
	<div class="offset1 span10">
		<div><h4 style="display:inline-block;">内容：</h4>(当前浏览量：<span class="overviewNum"></span>)</div>
		<p class="toupiao-content"></p>
		<div id="toupiao-option"></div>
	    <button id="toupiao-sure" class="btn btn-primary pull-right" type="button">确 定</button>
	</div>
</div>
<div id="PL-main" style="width:100%;margin-top: 20px;"></div>
<div class="PL-box" style="height:240px;margin-top: 20px;">
	<div class="h-c-left inline" style="line-height:50px;text-align:center;">
		<img class="img-polaroid" src="img/userDefaulIcon.png" style="margin-top:20px;"></img>
		<div>当前用户：<span style="font-weight: bold;" id="userNmae">${sessionScope.user.userName}</span></div>
	</div>
	<div class="inline h-c-right" style="padding:10px 14px;vertical-align: top;">
		<div style="border-bottom:1px dashed #CDCDCD;width:100%;">
			发表评论
		</div>
		<div style="padding:20px 0;" >
			<textarea rows="5" style="width:100%;" id="PL-Edict"></textarea>
		</div>
		<div style="text-align:right;" ><button class="btn btn-primary"  type="button" id="btn_publish">发表</button></div>
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
		                        return colorList[params.dataIndex];
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
		
		var plModel = {
			/*文章评论*/
				pl:'<div class="PL-box">'+
						'<div class="h-c-left inline" style="line-height:50px;text-align:center;">'+
							'<img class="img-polaroid" src="img/userDefaulIcon.png" style="margin-top:20px;"></img>'+
							'<div>评论：<span style="font-weight: bold;">{author}</span></div>'+
						'</div>'+
						'<div class="inline h-c-right" style="padding:10px 14px;vertical-align: top;">'+
							'<div style="border-bottom:1px dashed #CDCDCD;width:100%;">'+
								'发表于：{date}'+'<div style="float:right">{id}楼</div>'+
							'</div>'+
							'<div style="padding:20px 0;">{content}</div>'+
						'</div>'+
					'</div>',
			/*评论分页*/
				pg:'<div class="pagination pagination-right">'+
	    				'<ul></ul>'+
					'</div>'
		};
		
    //-----请求数据-----
   /* 请求文章详情数据 */
		var requestData=function(currPage){
			$.ajax({
			url : $.urlRoot+"/property-sys/articleAction!look.action",
			dataType : "json",
			type : "post",
			data : {
				id : MODEL.id,//文章id,
				currentPage:currPage,//评论当前页
				pageSize:2//评论页大小
			},
			success : function(result) {
				if (result.success) {
					console.log(MODEL.type);
					/**生成投票start*/
					var article = result.msg.article;
					$(".overviewNum").text(article.visitors);
					var options = result.msg.options;
					 //给标题和题目赋值
    				$(".toupiao-content").text(article.content);
    				$(".toupiao-title").text(article.title);
    				//x轴
    				var dList=[];//选项
    				var xDataList = [];
					for(var i=0;i<options.length;i++){
						var obj=new Object();
						obj.value=options[i].id;
						obj.text=options[i].name;
						dList.push(obj);
						xDataList.push(options[i].supporters);
					}
					//重新整合数据
				    var xAxisList = [];
				    //生成选项表单
				    $("#toupiao-option").empty();
				    var hStr = '<label class="radio"><input type="radio" name="optionsRadios" id="optionsRadios2" value="{value}">{text}</label>';
					var allString ='';
				    for(var i=0;i<dList.length;i++){
						xAxisList.push(dList[i].text);
						allString += hStr.replace(/{value}/g,dList[i].value)
										 .replace(/{text}/g,dList[i].text);
					};
					$("#toupiao-option").html(allString);
				    option.xAxis[0].data = xAxisList;
				    //y轴数据，与x轴一一对应
				    option.series[0].data=xDataList;      
				    myChart.setOption(option);
				    /**生成投票end*/
				    
				    //评论
				    $("#PL-main").empty();
					var Str="";
					//此处for循环将评论也贴上去。
					var comments = result.msg.comments;
					//页码
					var page=result.msg.page;
					console.log(page);
					for ( var i = 0; i < comments.length; i++) {
						Str += plModel.pl.replace(/{author}/g,comments[i].reviewer)
										 .replace(/{date}/g,comments[i].publishTime)
										 .replace(/{content}/g,comments[i].content)
										 .replace(/{id}/g,((page.crr-1)*page.size)+i+1);
					}
					var pageStr="";
					//分页
					for(var i=1;i<=page.end;i++){
						var liStr = "";
						if(i == page.crr){
							liStr = "<li><span class='active'>"+i+"</span></li>";
						}else{
							liStr = "<li><a href='javascript:void(0);' class='paginaList' data-pag='"+i+"'>"+i+"</a></li>";
						}
						pageStr+=liStr;
					}
					Str+=plModel.pg;
					$("#PL-main").html(Str);
					$(".pagination ul").html(pageStr);
					$(".paginaList").on("click.p",function(){//这个是分页的
						pageNum = $(this).data("pag");
						requestData(pageNum);
				});
				}
			}
		});
		};
		
		requestData(1);
     
     $().ready(function() {
		$("#btn_publish").click(function(){
			$.ajax({
			url : $.urlRoot+"/property-sys/commentAction!publish.action",
			dataType : "json",
			type : "post",
			data : {
				"comment.articleId":MODEL.id,//文章id
				"comment.reviewer":$("#userNmae").html(),
				"comment.content":$("#PL-Edict").val()
			},
			success : function(result) {
					if(result.success){
						//alert(result.msg);
						window.location.reload(true);
					}else{
						alert(result.msg);
					}
				}
			});
		});
		//投票
		$("#toupiao-sure").click(function(){
			$.ajax({
			url : $.urlRoot+"/property-sys/optionAction!increase.action",
			dataType : "json",
			type : "post",
			data : {
				id:$("input[name='optionsRadios']:checked").val()
			},
			success : function(result) {
					if(result.success){
						window.location.reload(true);
					}
				}
			});
		});
	});
    
</script>