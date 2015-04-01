$().ready(function(){
	$("#menu-wuye").addClass("active");
	var table_shenqing=$("#table-shenqing").DataTable({
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
					{data : 'realName',sTitle : "真实姓名"},
					{data : 'contactNumber',sTitle : "用户联系电话"}, 
					{data : 'address',sTitle : "地址"},
					{data : 'type',sTitle : "申请类型"},
					{data : 'content',sTitle : "申请内容"},
					{data : 'applyTime',sTitle : "申请时间"}, 
					{data : 'completeTime',sTitle : "完成时间"}, 
					{data : 'reply',sTitle : "回复内容"}, 
					{data : 'status',sTitle : "状态"}
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
	    		url:"/property-sys/property-sys/applyAction!listApplyByParams.action",
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
	
	//删除申请
	$("#btn_delete_apply").on("click.delete",function(){
		var ListId = controls.getCheckedId("#table-shenqing");
		if(ListId.length>0){
			$.W.alert("确定删除"+ListId.length+"条记录？",true,function(){
				console.log("参数id数组："+ListId);
				//ajax提交
				$.ajax({
	        		url:"/property-sys/property-sys/applyAction!deleteApplyByIds.action",
	        		type:"post",
	        		dataType:"json",
	        		data:{ids:ListId.toString()},
	        		success:function(d){
	        			$.W.alert(d.msg,true);
	        			//删除后刷新表格
	        			if(d.success){
	        				//
	        				window.location.reload(true);
	        			}
	        		}
	        	});
			});
		}else{
			$.W.alert("请选中要删除的申请！",true);
		}
	});
	//批量通过申请
	$("#btn_shenhe_apply").on("click.delete",function(){
		var ListId = controls.getCheckedId("#table-shenqing");
		if(ListId.length>0){
			$.W.alert("确定审核通过"+ListId.length+"条记录？",true,function(){
				console.log("参数id数组："+ListId);
				//ajax提交
				$.ajax({
	        		url:"/property-sys/property-sys/applyAction!passByIds.action",
	        		type:"post",
	        		dataType:"json",
	        		data:{ids:ListId.toString()},
	        		success:function(d){
	        			$.W.alert(d.msg,true);
	        			//删除后刷新表格
	        			if(d.success){
	        				window.location.reload(true);
	        			}
	        		}
	        	});
			});
		}else{
			$.W.alert("请选中要审核的申请！",true);
		}
	});
	
	//弹出申请的表单窗口
	$("#btn_reply_apply").click(function(){
		//选中的行
		//获取到该行订单的所有信息
		var $tr = $("#table-shenqing [name='slecteOrder']:checked").parent().parent();
		var obj = table_shenqing.row($tr.eq(0)).data();
		if($tr.length>1){
			$.W.alert("不能同时回复多条记录!",true);
		}else if($tr.length<=0){
			$.W.alert("请先选中行再点击回复!",true);
		}else{
			if(obj.status=="申请中"){
				//将信息填充到表单上
				$("#update-id").val(obj.id);
				$("#update-content").val(obj.content);
				$("#update-userName").val(obj.userName);
				$("#update-realName").val(obj.realName);
				$("#update-type").val(obj.type);
				$("#update-contactNumber").val(obj.contactNumber);
				$("#update-address").val(obj.address);
				$("#update-applyTime").val(obj.applyTime);
				$("#update-reply").val(obj.reply);
				$("#replyApply").modal("show");
			}else{
				$.W.alert("该记录已审核过!",true);
			}
		}
	});
	//审核通过
	$("#btn-pass").off('click.save').on("click.save",function(){
		$.ajax({
    		url:"/property-sys/property-sys/applyAction!reply.action",
    		type:"post",
    		dataType:"json",
    		data:{
    				id:$("#replyApply").find("[name=id]").val(),
    				type:1,
    				reply:$("#replyApply").find("[name=reply]").val()
    		},
    		success:function(d){
    			$.W.alert(d.msg,true);
    			//添加后刷新表格
    			if(d.success){
    				$("#replyApply").modal('hide');
    				window.location.reload(true);
    			}
    		}
    	});
	});
	//审核不通过
	$("#btn-no-pass").off('click.save').on("click.save",function(){
		$.ajax({
    		url:"/property-sys/property-sys/applyAction!reply.action",
    		type:"post",
    		dataType:"json",
    		data:{
    				id:$("#replyApply").find("[name=id]").val(),
    				type:2,
    				reply:$("#replyApply").find("[name=reply]").val()
    		},
    		success:function(d){
    			$.W.alert(d.msg,true);
    			//添加后刷新表格
    			if(d.success){
    				$("#replyApply").modal('hide');
    				window.location.reload(true);
    			}
    		}
    	});
	});
	
});