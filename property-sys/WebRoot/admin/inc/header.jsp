<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div id="topbar">
	
	<div class="container">
		
		<a href="javascript:;" id="menu-trigger" class="dropdown-toggle" data-toggle="dropdown" data-target="#">
			<i class="icon-cog"></i>
		</a>
	
		<div id="top-nav">			
			<ul class="pull-right">
				<li><a href="javascript:;"><span class="badge badge-primary">1</span> 新消息</a></li>
				<li><a href="login.jsp">退出</a></li>
			</ul>
		</div> <!-- /#top-nav -->
		
	</div> <!-- /.container -->
	
</div> <!-- /#topbar -->


	
	
<div id="header">
	
	<div class="container">
		
		<a href="./index.jsp" class="brand">个人信息</a>
		
		<a href="javascript:;" class="btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        	<i class="icon-reorder"></i>
      	</a>
	
		<div class="nav-collapse">
			<ul id="main-nav" class="nav pull-right">
				<li class="nav-icon">
					<a href="./admin_index.jsp">
						<i class="icon-home"></i>
						<span>首页</span>        					
					</a>
				</li>
				
				<li class="dropdown" id="menu-zhanghu">
					<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-th"></i>
						<span>账户管理</span> 
						<b class="caret"></b>
					</a>	
				
					<ul class="dropdown-menu">
						<li><a href="zhuhu.jsp">住户账户管理</a></li>
						<li><a href="administrator.jsp">管理员账户管理</a></li>
					</ul>    				
				</li>
				
				<li class="dropdown">					
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-copy"></i>
						<span>论堂管理</span> 
						<b class="caret"></b>
					</a>	
				
					<ul class="dropdown-menu">
						<li><a href="yiti.jsp">议题管理</a></li>
						<li><a href="huodong.jsp">活动管理</a></li>
						<li><a href="toupiao.jsp">投票管理</a></li>
					</ul>    				
				</li>
				
				<li class="dropdown" id="menu-wuye">					
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-external-link"></i>
						<span>物业管理</span> 
						<b class="caret"></b>
					</a>	
				
					<ul class="dropdown-menu">							
						<li><a href="ruzhu.jsp">入住审批</a></li>
						<li><a href="zhuangxiu.jsp">装修审批</a></li>
						<li><a href="baoxiu.jsp">报修处理</a></li>
						<li><a href="jiaofei_tongzhi.jsp">缴费通知</a></li>
						<li><a href="chongzhi.jsp">用户充值</a></li>
					</ul>    				
				</li>
			</ul>
			
		</div> <!-- /.nav-collapse -->

	</div> <!-- /.container -->
	
</div> <!-- /#header -->
