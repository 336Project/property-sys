$().ready(function(){
	$("#menu-wuye").addClass("active");
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
	    		url:"/property-sys/property-sys/paymentAction!listPaymentsByParams.action",
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
	
	//点击缴费通知时，加载用户下拉框
	$("#btn_add_jiaofei").click(function(){
		$("#otherItem").empty();
		//重置表单,ps:form元素才有reset
		$("#add-jiaofei").find("form")[0].reset();
		//加载充值功能中用户列表
		$.ajax({
	        type: "POST",
	        contentType: "application/json;utf-8",
	        dataType: "json",
	        url:"/property-sys/property-sys/userAction!listAllUsers.action",
	        success: function (d) {
	        	 //请将返回值的格式设置为[{id: "这里等于value", text: '这是text' },{id: "admin", text: '管理员'}]
	            //var data=[];
	            var result=d.msg;
	            var options="";
	            for ( var i = 0; i < result.length; i++) {//动态加载角色
	            	options+="<option value='"+result[i].id+"'>"+result[i].userName+"</option>";
				}
	            $("#userName").html(options);
	        }
		});
		$("#add-jiaofei").modal("show");
	});
	
	var newItmeStr = '<div class="control-group option" style="margin-top: 10px;">'+
						'<div class="col-sm-8 item" style="text-align: center;">'+
							'<input type="text" name="itemName" placeholder="请输入缴费项"/>：'+
							'<input type="text" name="itemMoney" placeholder="请输入金额"/>'+
						'</div>'+
					'</div>';
	//添加缴费项
	$("#addItem").click(function(){
		$("#otherItem").append(newItmeStr);
	});
	//确定提交
	$("#btn-commit").click(function(){
		var $items = $(".item");
		var list=new Array();
		for(var i=0;i<$items.length;i++){
			var obj=new Object();
			obj.name=$items.eq(i).find("input[name=itemName]").val();
			obj.money=$items.eq(i).find("input[name=itemMoney]").val();
			list.push(obj);
		}
		console.log(JSON.stringify(list));
		$.ajax({
	        type: "POST",
	        dataType: "json",
	        url:"/property-sys/property-sys/paymentAction!addPayment.action",
	        data:{
	        	"payment.userId":$("#add-jiaofei").find("[name=userName]").val(),
	        	"payment.endTime":$("#add-jiaofei").find("[name=endTime]").val(),
	        	"payment.remark":$("#add-jiaofei").find("[name=remark]").val(),
	        	 items:JSON.stringify(list)
	        },
	        success: function (d) {
	        	$.W.alert(d.msg,true);
	        	if(d.success){
	        		$("#add-jiaofei").modal('hide');
	        		table_jiaofei.draw();
	        	}
	        }
		});
	});
	
	//删除缴费记录
	$("#btn_delete_jiaofei").on("click.delete",function(){
		var ListId = controls.getCheckedId("#table-jiaofei");
		if(ListId.length>0){
			$.W.alert("确定删除"+ListId.length+"条记录？",true,function(){
				console.log("参数id数组："+ListId);
				//ajax提交
				$.ajax({
	        		url:"/property-sys/property-sys/paymentAction!deletePaymentByIds.action",
	        		type:"post",
	        		dataType:"json",
	        		data:{ids:ListId.toString()},
	        		success:function(d){
	        			$.W.alert(d.msg,true);
	        			//删除后刷新表格
	        			if(d.success){
	        				table_jiaofei.draw();
	        			}
	        		}
	        	});
			});
		}else{
			$.W.alert("请选中要删除的记录！",true);
		}
	});
	var itmeDetailStr='<div class="control-group option" style="margin-top: 10px;">'+
						'<div class="col-sm-8 item" style="text-align: center;">'+
							'<input type="text" value="{name}" />：'+
							'<input type="text" value="{money}" />'+
						'</div>'+
					  '</div>';
	//查看文章
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
});