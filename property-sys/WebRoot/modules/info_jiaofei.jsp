<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
<link rel="stylesheet" href="<%=path%>/css/bootstrap-responsive.css">
<script src="<%=path%>/js/libs/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/admin/js/common.js"></script>
<h3 class="ptitle text-center" style="margin-top:0;">缴费记录</h3>
<div class="span3" style="float: right;margin-top: 10px;">
		<button class="btn btn-primary" type="button" id="btn_look_jiaofei">查看</button>
		<button class="btn btn-primary" type="button" id="btn_jiaofei">缴费</button>
	</div>
<div class="row-fluid userMsg box-shadow my-msg" >
	
	<div class="span12" style="padding:10px;min-height:200px;"><table id="table-jiaofei" class="hover order-column" ></table></div>
</div>
<!-- 查看缴费明细弹出框 start  -->
		<div class="modal fade" id="look-jiaofei" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
		        <h4 class="modal-title" id="myModalLabel">缴费明细</h4>
		      </div>
		      <div class="modal-body row">
		        <form class="form-horizontal col-xs-offset-2 col-xs-8 " role="form" id="addAccountForm">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-4 control-label">用户名</label>
					    <div class="col-sm-8">
						    <input type="text" class="form-control" id="look-userName" placeholder="" name="userName">
					    </div>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">创建时间</label>
					    <div class="col-sm-8">
						    <input type="text" class="form-control" id="look-createTime" placeholder="" name="createTime">
					    </div>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">总额</label>
					    <div class="col-sm-8">
						    <input type="text" class="form-control" id="look-money" placeholder="" name="money">
					    </div>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">截止时间</label>
					    <div class="col-sm-8">
						    <input type="text" class="form-control" id="look-endTime" placeholder="" name="endTime">
					    </div>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">完成时间</label>
					    <div class="col-sm-8">
						    <input type="text" class="form-control" id="look-payTime" placeholder="" name="payTime">
					    </div>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">状态</label>
					    <div class="col-sm-8">
						    <input type="text" class="form-control" id="look-status" placeholder="" name="status">
					    </div>
				  </div>
				  <div class="form-group" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">备注</label>
					    <div class="col-sm-8">
						    <input type="text" class="form-control"  placeholder="备注" id="look-remark" name="remark">
					    </div>
				  </div>
				  <div class="control-group option" style="margin-top: 10px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">缴费明细：</label>
				  </div>
				  <div id="itemDetail"></div>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
		      </div>
		    </div>
		  </div>
		</div>
<script>
$().ready(function(){
	var table_jiaofei=$("#table-jiaofei").DataTable({
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
					{data : 'userName',sTitle : "用户账号"},
					{data : 'createTime',sTitle : "创建时间"}, 
					{data : 'money',sTitle : "金额(元)"},
					{data : 'endTime',sTitle : "截止时间"},
					{data : 'payTime',sTitle : "完成时间"}, 
					{data : 'status',sTitle : "状态"}, 
					{data : 'remark',sTitle : "备注"}
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
	    		url:"/property-sys/property-sys/paymentAction!listPaymentsByUser.action",
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
	var itmeDetailStr='<div class="control-group option" style="margin-top: 10px;">'+
						'<div class="col-sm-8 itemDetail" style="text-align: center;">'+
							'<input type="text" value="{name}" />：'+
							'<input type="text" value="{money}" />'+
						'</div>'+
					  '</div>';
	//查看缴费记录
	$("#btn_look_jiaofei").click(function(){
		//选中的行
		//获取到该行的所有信息
		var $tr = $("#table-jiaofei [name='slecteOrder']:checked").parent().parent();
		var obj = table_jiaofei.row($tr.eq(0)).data();
		if($tr.length>1){
			$.W.alert("不能同时查看多条记录!",true);
		}else if($tr.length<=0){
			$.W.alert("请先选中行再点击查看!",true);
		}else{
			$("#itemDetail").empty();
			$("#look-userName").val(obj.userName);
			$("#look-createTime").val(obj.createTime);
			$("#look-money").val(obj.money);
			$("#look-endTime").val(obj.endTime);
			$("#look-payTime").val(obj.payTime);
			$("#look-status").val(obj.status);
			$("#look-remark").val(obj.remark);
			//获取缴费明细
			$.ajax({
        		url:"/property-sys/property-sys/paymentAction!listPayItemById.action",
        		type:"post",
        		dataType:"json",
        		data:{id:obj.id},
        		success:function(d){
        			console.log(d.msg);
        			for(var i=0;i<d.msg.length;i++){
        				var item=d.msg[i];
        				console.log(item);
        				var str=itmeDetailStr.replace(/{name}/g, item.name).replace(/{money}/g, item.money+"元");
        				$("#itemDetail").append(str);
        			}
        		}
        	});
			$("#look-jiaofei").modal("show");
		}
	});
	//缴费
	$("#btn_jiaofei").click(function(){
		//获取到该行的所有信息
		var $tr = $("#table-jiaofei [name='slecteOrder']:checked").parent().parent();
		var obj = table_jiaofei.row($tr.eq(0)).data();
		if($tr.length>1){
			$.W.alert("不能同时缴费多条记录!",true);
		}else if($tr.length<=0){
			$.W.alert("请先选中行再点击缴费!",true);
		}else{
			if(obj.status=="未支付"){
				$.ajax({
	        		url:"/property-sys/property-sys/paymentAction!toPay.action",
	        		type:"post",
	        		dataType:"json",
	        		data:{
	        			id:obj.id,
	        			userName:obj.userName
	        			},
	        		success:function(d){
	        			$.W.alert(d.msg,true);
	        			//删除后刷新表格
	        			if(d.success){
	        				table_jiaofei.draw();
	        			}
	        		}
	        	});
        	}else{
        		$.W.alert("该记录已支付了，请勿重复缴费!",true);
        	}
		}
	});
});

</script>
