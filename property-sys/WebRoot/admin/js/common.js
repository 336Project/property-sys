
//行选中事件
$("table").on("click","tr",function(){
	var $check = $(this).find(".tcheckbox");
	if($check.prop("checked")){
		$check.prop("checked",false);
		$(this).removeClass('selected');
	}else{
		$check.prop("checked",true);
		$(this).addClass('selected');
	}
	// $(this).toggleClass('selected');
});

var controls = {
		getCheckedId:function(tableId){
			var idList = [];//被选中的订单
			var $orderId = $(tableId + " [name='slecteOrder']:checked");
			for(var i =0;i<$orderId.length;i++){
				idList.push($orderId.eq(i).data("uid"));
			}
			return idList;
		}
};

jQuery.W = {
		alert: function(param1,param2,param3,param4){
			var $talert;
			if ($(document).parent) {
				$talert = $(".tech-alert",parent.document); 
			}else{
				$talert = $(".tech-alert"); 
			}
			var title = "系统消息:";
			var message = "系统消息！";
			if (param1 && (typeof param2 == "string")) {
				title = param1;
				message = param2;
			}else if(typeof param1 == "string"){
				message = param1;
			}
			$talert.find('.title').text(title);
			$talert.find('.message').text(message);
			//是否显示按钮
			for (var i = 0; i < arguments.length; i++) {
				if (arguments[i] === true) {
					$talert.find('.alert-btn').show();
					if (typeof arguments[i+1] == "function") {
						$talert.off('click.sure').on('click.sure', '.sure',arguments[i+1]);	
						if(typeof arguments[i+2] == "function"){
							$talert.off('click.cancel').on('click.cancel', '.cancel',arguments[i+2]);	
						}
					}else{$talert.find('.cancel').hide();}
					break;
				}else if (typeof arguments[i] == "function") {
					$talert.find('.alert-btn').show();
					$talert.off('click.sure').on('click.sure', '.sure',arguments[i]);
					if(typeof arguments[i+1] == "function"){
						$talert.off('click.cancel').on('click.cancel', '.cancel',arguments[i+1]);	
					}
					break;
				};
				$talert.off('click.sure');
				$talert.off('click.cancel');
				$talert.find('.alert-btn').hide();
			};
			$talert.show();
		},
		setButton:function(){
			if(typeof arguments[0] == "string"){
				$(".tech-alert .sure").text(arguments[0]);
			};
			if(typeof arguments[1] == "string"){
				$(".tech-alert .cancel").text(arguments[1]);
			};
			//复位按钮
			$(".tech-alert").on('click.reset', '.close,.sure,.cancel', function(event) {
				$(".tech-alert .sure").text("确定");
				$(".tech-alert .cancel").text("取消");
		        $(".tech-alert").off('click.reset');
		    });
		}
	};


	$(document).ready(function(){
		var htmlStr = "<div class=\"tech-alert\" style=\"display:none;\"><div><span class=\"close\">X</span><p class=\"title\">系统消息：</p><section class=\"message\">消息提示!</section><p class=\"alert-btn\"><button class=\"btn btn-small btn-primary sure\" type=\"button\">确定</button><button class=\"btn btn-small cancel\" type=\"button\">取消</button></p></div></div>";
		$("body").append(htmlStr);
		$(".tech-alert").on('click.close', '.close,.sure,.cancel', function(event) {
	      $(".tech-alert").hide();
	    });
	});