<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<jsp:include page="/admin/inc/commonheader.jsp"></jsp:include>
	<script src="../js/libs/modernizr-2.5.3.min.js"></script>

</head>

<body>
	
<div id="wrapper">
	<jsp:include page="/admin/inc/header.jsp"></jsp:include>
	<div id="masthead">
		<div class="container">
			<div class="masthead-pad">
				<div class="masthead-text">
					<h2>缴费通知<h2>
				<!-- 	<p>这里也可以不写任何内容</p> -->
				</div> <!-- /.masthead-text -->
			</div>
		</div> <!-- /.container -->	
	</div> <!-- /#masthead -->
	
	<div id="content">
		<div class="container">
			<blockquote>
			  <p>用户缴费情况</p>
			  <small>历史缴费记录和当前须缴费明细表</small>
			</blockquote>
			<div class="row-fluid">
				<div class="span12"><table id="table-jiaofei" class="hover order-column"></table></div>
			</div>
			<blockquote style="margin-top:20px;">
			  <p>费用情况</p>
			  <small>物业费用标准，住户所产生的费用将根据您输入的参数进行计算</small>
			</blockquote>
			<div class="row-fluid">
				<div class="form-horizontal">
				  <div class="control-group">
				    <label class="control-label" for="fangzhu">房租单价(元/平方米)</label>
				    <div class="controls">
				      <input type="text" id="fangzhu" placeholder="0.00">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="wuye">物业单价(元/户)</label>
				    <div class="controls">
				      <input type="text" id="wuye" placeholder="0.00">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="ranqi">燃气单价(元/立方米)</label>
				    <div class="controls">
				      <input type="text" id=""ranqi"" placeholder="0.00">
				    </div>
				  </div>
				  <div class="control-group">
				    <div class="controls">
				      <button type="submit" class="btn">保存修改</button>
				    </div>
				  </div>
				</div>
			</div>
		</div> <!-- /.container -->
	
	</div> <!-- /#content -->

</div> <!-- /#wrapper -->
<jsp:include page="/admin/inc/footer.jsp"></jsp:include>
<script type="text/javascript" src="js/jiaofei_tongzhi.js"></script>
</body>
</html>