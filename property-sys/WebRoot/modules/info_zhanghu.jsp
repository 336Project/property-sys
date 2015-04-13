<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
<link rel="stylesheet" href="<%=path%>/css/bootstrap-responsive.css">
<script src="<%=path%>/js/libs/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/admin/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<h3 class="ptitle text-center" style="margin-top:0;">账户信息</h3>
<div class="span3" style="float: right;margin-top: 10px;">
		<button class="btn btn-primary" type="button"
			id="btn-modal-addAccount">充值</button>
	</div>
<div class="row-fluid userMsg box-shadow my-msg" >
	
	<div class="span12" style="padding:10px;min-height:200px;"><table id="table-chongzhi" class="hover order-column" ></table></div>
</div>
<!-- 充值弹出框 start  -->
		<div class="modal fade" id="addAccount" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
		        <h4 class="modal-title" id="myModalLabel">充值</h4>
		      </div>
		      <div class="modal-body row">
		        <form class="form-horizontal col-xs-offset-2 col-xs-8 " role="form" id="addAccountForm">
				  <div class="form-group" style="margin-top: 20px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">充值金额</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="money" name="money" placeholder="请输入要充值的金额">
				      <input type="text" class="form-control" id="userId" name="userId" value="${sessionScope.user.id}" style="display: none;">
				    </div>
				  </div>
				  <!-- <div class="form-group" style="margin-top: 20px;">
				    <label for="inputEmail3" class="col-sm-4 control-label">备注</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="remark" name="remark" placeholder="">
				    </div>
				  </div> -->
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button id="btn-addAccount" type="button" class="btn btn-primary">确认充值</button>
		      </div>
		    </div>
		  </div>
		</div>
<script>
$().ready(function(){
	var table_chongzhi=$("#table-chongzhi").DataTable({
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
					{data : 'balance',sTitle : "当前余额"},
					{data : 'completeTime',sTitle : "完成时间"}, 
					{data : 'money',sTitle : "交易金额(元)"}, 
					{data : 'type',sTitle : "交易类型"},
					{data : 'source',sTitle : "来源"},
					{data : 'status',sTitle : "状态"}
				],
		"dom":"<lf<t>ip>",
		"order": [[ 2, 'asc' ]],
		"scrollX": true,//水平滚动条
		"scrollXInner":"120%",
		"processing": true,
        "serverSide": true,
        "bAutoWidth": false,//自适应宽度
        "aLengthMenu": [5,10, 20, 30, 50],//定义每页显示数据数量
        "fnServerData":function(n,params,fnCallback,table){//向后台请求列表数据
        	//alert(JSON.stringify(params));
        	params.push({name:"sSearch",value:params[5].value.value});
        	$.ajax({
        		url:"/property-sys/property-sys/accountAction!listAccountsByUser.action",
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
	//点击充值按钮时，加载用户下拉框
	$("#btn-modal-addAccount").click(function(){
		//重置表单,ps:form元素才有reset
		$("#addAccount").find("form")[0].reset();
		$("#addAccount").modal("show");
	});
	//提交充值的表单
	$("#btn-addAccount").off('click.save').on("click.save",function(){
		/* $.ajax({
       		url:"/property-sys/property-sys/accountAction!applyRecharge.action",
       		type:"post",
       		dataType:"json",
       		data:{
       				"account.userId":$("#addAccount").find("[name=userId]").val(),
       				"account.money":$("#addAccount").find("[name=money]").val(),
       				"account.remark":$("#addAccount").find("[name=remark]").val()
       		},
       		success:function(d){
       			$("#addAccount").modal('hide');
       			$.W.alert(d.msg,true);
       			//添加后刷新表格
       			if(d.success){
       				table_chongzhi.draw();
       			}
       		}
       	}); */
       	$("#addAccount").modal('hide');
       	//recharge($("#addAccount").find("[name=money]").val());
       	$.ajax({
        url:"modules/chongzhi.jsp?money="+$("#addAccount").find("[name=money]").val(),
        dataType:"html",
        type:"get",
        cache:true,
        success:function(result){
        	/*if(params != null){
        		MODEL = params;
        	}*/
            $("#main-panel").html(result);
        },error:function(){
        	alert("404");
        }
    });
	});
	
});

</script>
