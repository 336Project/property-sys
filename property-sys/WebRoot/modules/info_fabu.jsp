<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=path%>/admin/js/common.js"></script>
<h3 class="ptitle text-center" style="margin-top:0;">我的发布</h3>
<div class="span3" style="float: right;margin-top: 10px;">
		<button class="btn btn-primary" type="button" id="btn_delete_wenzhang">删除</button>
	</div>
<div class="row-fluid userMsg box-shadow my-msg" >
	
	<div class="span12" style="padding:10px;min-height:200px;"><table id="table-fabu" class="hover order-column" ></table></div>
</div>

<script>
$().ready(function(){
	var table_fabu=$("#table-fabu").DataTable({
		"columns":[//定义要显示的列名
					{ data: 'id',sTitle:"",
						render: function(id) {
			        		var cell = arguments[3];
			        		var index = (cell.settings._iDisplayStart+cell.row+1);
							var str = "<input class='tcheckbox' id='d"+index+"' name='slecteOrder' data-uid='"+id+"' type=checkbox> "
							   +"<label for='d"+index+"'>"+index+"</label>";
							return str;
			        	}
					},
					{data : 'author',sTitle : "用户账号"},
					{data : 'title',sTitle : "标题"},
					{data : 'publishDate',sTitle : "发布时间"},
					{data : 'content',sTitle : "发布内容"},
					{data : 'type',sTitle : "类型"}, 
					{data : 'visitors',sTitle : "访问人数"}
				],
		"order": [[ 1, 'asc' ]],
		"scrollX": true,//水平滚动条
		"scrollXInner":"120%",
		"processing": true,
	    "serverSide": true,
	    "bAutoWidth": false,//自适应宽度
	    "aLengthMenu": [5,10, 20, 30, 50],//定义每页显示数据数量
	    "fnServerData":function(n,params,fnCallback,table){//向后台请求列表数据
	    	params.push({name:"sSearch",value:params[5].value.value});
	    	$.ajax({
	    		url:"/property-sys/property-sys/articleAction!listArticleByUser.action",
	    		type:"post",
	    		dataType:"json",
	    		data:{dataTableParams:JSON.stringify(params)},
	    		success:function(d){
	   			fnCallback(d.msg);
	   		}
	   	});
	   },
		"sort": false,
		"language": {
			"search":"快速搜索",                    //汉化   
		    "lengthMenu": "每页显示 _MENU_ 条记录",   
		    "zeroRecords": "没有查询到相关数据",
		    "info" : "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
		    "infoEmtpy": "没有数据",   
		    "processing": "正在加载数据...",   
		    "paginate": {   
		        "first": "首页",   
		        "previous": "上一页",
		        "next": "下一页",   
		        "last": "尾页"  
			} 
		}
	});
	//删除文章
	$("#btn_delete_wenzhang").on("click.delete",function(){
		var ListId = controls.getCheckedId("#table-fabu");
		if(ListId.length>0){
			$.W.alert("确定删除"+ListId.length+"条记录？",true,function(){
				console.log("参数id数组："+ListId);
				//ajax提交
				$.ajax({
	        		url:"/property-sys/property-sys/articleAction!deleteArticleByIds.action",
	        		type:"post",
	        		dataType:"json",
	        		data:{ids:ListId.toString()},
	        		success:function(d){
	        			$.W.alert(d.msg,true);
	        			//删除后刷新表格
	        			if(d.success){
	        				table_fabu.draw();
	        			}
	        		}
	        	});
			});
		}else{
			$.W.alert("请选中要删除的文章！",true);
		}
	});
});

</script>
