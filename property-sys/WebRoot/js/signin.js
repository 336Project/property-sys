$(function () {

	jQuery.support.placeholder = false;
	test = document.createElement('input');
	if('placeholder' in test) jQuery.support.placeholder = true;
	if (!$.support.placeholder) {

		$('.field').find ('label').show();

	}
	//注册
	$("#btn_signup").click(
			function(){
				if($("#password").val().length==0){
					alert("密码不能为空");
					return ;
				}
				if($("#password").val()==$("#confirm_password").val()){
					$.ajax({
						type:"post",
						url:"property-sys/userAction!register.action",
						data:{
							"user.userName":$("#username").val(),
							"user.tel":$("#tel").val(),
							"user.email":$("#email").val(),
							"user.password":$("#password").val(),
							"user.roleCode":2
						},
						dataType : "json",
						success:function(data){
							if(data.success){
								if(data.msg=="恭喜,注册成功!"){
									window.location.href ="login.jsp";
								}
							}
							alert(data.msg);
						}
					});
				}else{
					alert("两次输入的密码不一致，请重新输入");
				}
			}
		);
});