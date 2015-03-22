$().ready(function(){
	$("#menu-zhanghu").addClass("active");
	$("#table-zhuhu").DataTable({
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
					{data : 'customerUser',sTitle : "用户账号"},
					{data : 'contactTelUser',sTitle : "用户联系电话"}, 
					{data : 'customerCompany',sTitle : "公司账号"},
					{data : 'contactTelCompany',sTitle : "公司联系电话"}, 
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
	    	//alert(JSON.stringify(params));
	    	params.push({name:"sSearch",value:params[5].value.value});
	    	$.ajax({
	    		url:$.urlRoot+"...",
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
});