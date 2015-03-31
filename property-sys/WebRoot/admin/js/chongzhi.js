$().ready(function(){
	$("#menu-wuye").addClass("active");
	$("#table-chongzhi").DataTable({
		"columns":[//定义要显示的列名
					{ data: 'id',sTitle:"",
						render: function(id) {
			        		var cell = arguments[3];
			        		var index = (cell.settings._iDisplayStart+cell.row+1);
							var str = "<input class='tcheckbox' id='d"+index+"' name='slecteAccount' data-uid='"+id+"' type=checkbox> "
							   +"<label for='d"+index+"'>"+index+"</label>";
							return str;
			        	}
					},
					{data : 'userName',sTitle : "用户账号"}, 
					{data : 'balance',sTitle : "当前余额"},
					{data : 'createTime',sTitle : "创建时间"}, 
					{data : 'completeTime',sTitle : "完成时间"}, 
					{data : 'money',sTitle : "交易金额(元)"}, 
					{data : 'type',sTitle : "交易类型"},
					{data : 'source',sTitle : "来源"},
					{data : 'status',sTitle : "状态"},
					{data : 'remark',sTitle : "备注"}
				],
		"order": [[ 2, 'asc' ]],
		"scrollX": true,//水平滚动条
		"scrollXInner":"110%",
		"processing": true,
        "serverSide": true,
        "bAutoWidth": false,//自适应宽度
        "aLengthMenu": [5,10, 20, 30, 50],//定义每页显示数据数量
        "fnServerData":function(n,params,fnCallback,table){//向后台请求列表数据
        	//alert(JSON.stringify(params));
        	params.push({name:"sSearch",value:params[5].value.value});
        	$.ajax({
        		url:"/property-sys/property-sys/accountAction!listAccountsByParams.action",
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
		//加载充值功能中用户列表
		$.ajax({
	        type: "POST",
	        contentType: "application/json;utf-8",
	        dataType: "json",
	        url:"/property-sys/property-sys/userAction!listAllUsers.action",
	        success: function (d) {
	        	 //请将返回值的格式设置为[{id: "这里等于value", text: '这是text' },{id: "admin", text: '管理员'}]
	            var data=[];
	            var result=d.msg;
	            for ( var i = 0; i < result.length; i++) {//动态加载角色
					var obj=new Object();
					obj.id=result[i].id;
					obj.text=result[i].userName;
					data.push(obj);
				}
	            console.log(data);
	            $.fn.modal.Constructor.prototype.enforceFocus = function() {}; 
	            $("#addAccount").find("[name=userName]").select2({
				  placeholder: "选择用户名",
				  data:data
				}); 
	        }
		});
		$("#addAccount").modal("show");
	});
	//删除文章
	$("#btn_delete_wenzhang").on("click.delete",function(){
		var ListId = controls.getCheckedId("#table-wenzhang");
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
	        				window.location.reload(true);
	        			}
	        		}
	        	});
			});
		}else{
			$.W.alert("请选中要删除的文章！",true);
		}
	});
});