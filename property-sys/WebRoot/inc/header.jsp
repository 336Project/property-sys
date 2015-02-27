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
			
			<!-- <ul>
				<li class="dropdown">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
						我的社区			
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu pull-right">
						<li><a href="javascript:;">发布信息</a></li>
						<li><a href="javascript:;">社区活动</a></li>
						<li><a href="javascript:;">咨询</a></li>
						<li><a href="javascript:;">投诉</a></li>
						<li class="dropdown-submenu">
		                  <a tabindex="-1" href="#">下拉菜单</a>
		                  <ul class="dropdown-menu">
		                    <li><a tabindex="-1" href="#">菜单1</a></li>
		                    <li><a tabindex="-1" href="#">菜单2</a></li>
		                    <li><a tabindex="-1" href="#">菜单3</a></li>
		                  </ul>
		                </li>
					</ul> 
				</li>
			</ul> -->
			
			<ul class="pull-right">
				<li><a href="javascript:;"><span class="badge badge-primary">1</span> 新消息</a></li>
				<!-- <li class="dropdown">
					<a href="./pages/settings.html" class="dropdown-toggle" data-toggle="dropdown">
						设置						
						<b class="caret"></b>
					</a>
					
					<ul class="dropdown-menu pull-right">
						<li><a href="javascript:;">设置 #1</a></li>
						<li><a href="javascript:;">设置 #2</a></li>
						<li class="dropdown-submenu">
		                  <a tabindex="-1" href="#">下拉菜单</a>
		                  <ul class="dropdown-menu">
		                    <li><a tabindex="-1" href="#">菜单1</a></li>
		                    <li><a tabindex="-1" href="#">菜单2</a></li>
		                    <li><a tabindex="-1" href="#">菜单3</a></li>
		                  </ul>
		                </li>
					</ul> 
				</li> -->
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
				<li class="nav-icon active">
					<a href="./index.jsp">
						<i class="icon-home"></i>
						<span>首页</span>        					
					</a>
				</li>
				
				<li class="dropdown">
					<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-th"></i>
						<span>模块一</span> 
						<b class="caret"></b>
					</a>	
				
					<ul class="dropdown-menu">
						<li><a href="#">二级菜单</a></li>
						<li><a href="#">二级菜单</a></li>
						<li><a href="#">二级菜单</a></li>
						<li><a href="#">二级菜单</a></li>
						<li><a href="#">二级菜单</a></li>
						<li class="dropdown-submenu">
		                  <a tabindex="-1" href="#">二级菜单</a>
		                  <ul class="dropdown-menu">
		                    <li><a tabindex="-1" href="#">三级菜单</a></li>
		                    <li><a tabindex="-1" href="#">三级菜单</a></li>
		                    <li><a tabindex="-1" href="#">三级菜单</a></li>
		                  </ul>
		                </li>
					</ul>    				
				</li>
				
				<li class="dropdown">					
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-copy"></i>
						<span>模块二</span> 
						<b class="caret"></b>
					</a>	
				
					<ul class="dropdown-menu">
						<li><a href="#">二级菜单</a></li>
						<li><a href="#">二级菜单</a></li>
						<li><a href="#">二级菜单</a></li>
						<li><a href="#">二级菜单</a></li>
						<li><a href="#">二级菜单</a></li>
					</ul>    				
				</li>
				
				<li class="dropdown">					
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-external-link"></i>
						<span>模块三</span> 
						<b class="caret"></b>
					</a>	
				
					<ul class="dropdown-menu">							
						<li><a href="#">二级菜单</a></li>
						<li><a href="#">二级菜单</a></li>
						<li><a href="#">二级菜单</a></li>
						<li><a href="#">二级菜单</a></li>
						<li><a href="#">二级菜单</a></li>
					</ul>    				
				</li>
			</ul>
			
		</div> <!-- /.nav-collapse -->

	</div> <!-- /.container -->
	
</div> <!-- /#header -->
