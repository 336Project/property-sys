<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div id="PL-main" style="width:100%;"></div>
<div class="PL-box" style="height:240px;">
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
						alert(result.msg);
						window.location.reload(true);
					}else{
						alert(result.msg);
					}
				}
			});
		});
		
		
		
		var plModel = {
			/*文章主体*/
				main:'<div class="h-content " style="border:1px solid #ddd;border-bottom:0;background:#fff; width:100%">'+
							'<div class="inline h-c-left" style="text-align:center;">'+
							'<span style="line-height:40px;">浏览量：<span style="color:#F26C4F;">{visitors}</span></span>'+
							'</div>'+
							'<div class="inline" style="padding-left:12px;">'+
								'<h4 style="margin:0;padding:0;">{title}</h4>'+
							'</div>'+
						'</div>'+
						'<div class="PL-box">'+
							'<table >'+
								'<tr>'+
									'<td class="h-c-left inline" style="line-height:50px;width:180px;text-align:center;">'+
										'<img class="img-polaroid" src="img/userDefaulIcon.png" style="margin-top:20px;"></img>'+
										'<div>作者：<span style="font-weight: bold;">{author}</span></div>'+
									'</td>'+
									'<td class="inline h-c-right" style="padding:10px 14px;vertical-align: top;">'+
										'<div style="border-bottom:1px dashed #CDCDCD;width:100%;">发表于：{publishDate}'+'<div style="float:right">楼主</div>'+'</div>'+
										'<div style="padding:20px 0;">{content}</div>'+
									'</td>'+
								'</tr>'+
							'</table>'+
						'</div>',
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
					/* <li><span class="active">1</span></li><li><a href="javascript:void(0);" class="paginaList" data-pag="1">2</a></li> */
		};
		
		var requestData=function(currPage){
			$.ajax({
			url : $.urlRoot+"/property-sys/articleAction!look.action",
			dataType : "json",
			type : "post",
			data : {
				id : MODEL.id,//文章id,
				currentPage:currPage,//评论当前页
				pageSize:5//评论页大小
			},
			success : function(result) {
				if (result.success) {
					$("#PL-main").empty();
					var article = result.msg.article;
					var Str="";
					if(currPage==1){
						Str = plModel.main.replace(/{author}/g,article.author)
										.replace(/{content}/g,article.content)
										.replace(/{publishDate}/g,article.publishDate)
										.replace(/{title}/g,article.title)
										//.replace(/{type}/g,article.type)
										.replace(/{id}/g,article.id)
										.replace(/{visitors}/g,article.visitors);
					}
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
					//feny
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
		}
		requestData(1);
		
	});
	//var ue = UE.getEditor('PL-Edict');
</script>