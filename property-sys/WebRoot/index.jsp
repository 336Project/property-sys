<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
	<title>社区物业管理系统</title>
	<meta charset="utf-8">	
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.css">
	<link rel="stylesheet" href="css/pages/index.css" type="text/css"></link>
</head>

<body>
<div class="l-container">
    <div class="l-b-row">
        <ul class="wgt-rainbow"><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul>
    </div>
    <div class="l-b-row ta-c">
        <div class="l-b-col l-side">
            <div class="box-shadow">
                <div class="wgt-logo">家园物业</div>
            </div>
            <div class="box-shadow">
                <div class="wgt-activityList sibar">
                    <div class="box-title">
                        <h3>品质服务</h3>
                        <a href="#" class="btn-more">更多</a>
                    </div>
                    <ul class="cst-services">
                        <li>入住申请</li>
                        <li>报修申请</li>
                        <li>装修申请</li>
                        <li>信息发布</li>
                        <li>发起投票</li>
                        <li>发起活动</li>
                        <li>投诉</li>
                        <li>咨询</li>
                    </ul>
                    <div class="box-title">
                        <h3>与我相关</h3>
                        <a href="#" class="btn-more">更多</a>
                    </div>
                    <ul>
                        <li>账户信息</li>
                        <li>缴费</li>
                        <li>充值</li>
                        <li>申请结果</li>
                        <li>我发布的信息</li>
                        <li>我的投票</li>
                    </ul>
                </div>
            </div>
            <a class="box-shadow adshow-1" href="/pages/about">联系<strong>物业</strong>,请拨打<strong>1234567</strong></a>
        </div>
        <div class="l-b-col l-main">
          <div class="l-inner">
            <div class="l-header">         
                <nav class="wgt-topNav">
                    <li class="important">
                       <a href="#">首页</a>
                    </li>
                    <li>
                        <a href="#">物业公告</a>
                    </li>
                    <li>
                        <a href="#">社区活动</a>
                    </li>
                    <li>
                        <a href="#">社区投票</a>
                    </li>
                    <li>
                        <a href="#">投诉咨询</a>
                    </li>
                    <li>
                        <a href="admin/login.jsp">我是管理员</a><!-- 后台管理登入入口 -->
                    </li>
                    <li>
                        <a href="login.jsp">注销</a>
                    </li>
                </nav>
            </div>
            <div class="l-b-row row-fluid">
                <div class="pagination pagination-right">
                <ul>
                    <li><a href="#">1</a></li>
                    <li><span class="active">2</span></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="5">5</a></li>
                </ul>
                </div>
                <div class="wgt-zpList row-fluid  ">
                    <ul class="thumbnails">
                        <li class="span4">
                            <div class="inner">
                                <div class="preview-box">
                                        <blockquote>一个基于jQuery的日历选择组件，支持假期显示，dataRang，下拉选择年，月等其他主流日历框功能...</blockquote>
                                </div>
                                <a class="preview-mask" href="/works/285" title="yo-datepicker"></a>
                                <h5>
                                    <a href="/works/285" title="yo-datepicker">yo-datepicker</a>
                                </h5>
                                <div class="info">
                                    <span class="author-info">
                                        <a href="/author/727" class="author-name" title="norfish">norfish</a>

                                        
                                    </span>

                                    <span class="opts">

                                        <a href="javascript:void(0)" onclick="do_good_await('Works','good',285)" class="btn-like" title="喜欢+1">

                                            <span id="do_good_285">2</span>

                                        </a>

                                    </span>

                                </div>

                            </div>
                        </li><li class="span4">

                            <div class="inner">

                                <div class="preview-box">

                                    <img src="http://layasset.qiniudn.com/labs/UI.jpg" alt="响应式用户交互组件库UI">
                                                                
                                </div>

                                <a class="preview-mask" href="/works/284" title="响应式用户交互组件库UI"></a>

                                <h5>

                                    <a href="/works/284" title="响应式用户交互组件库UI">响应式用户交互组件库UI</a>

                                </h5>

                                <div class="info">

                                    <span class="author-info">

                                        <a href="/author/724" class="author-name" title="bh-lay">bh-lay</a>

                                        
                                    </span>

                                    <span class="opts">

                                        <a href="javascript:void(0)" onclick="do_good_await('Works','good',284)" class="btn-like" title="喜欢+1">

                                            <span id="do_good_284">1</span>

                                        </a>

                                    </span>

                                </div>

                            </div>

                        </li><li class="span4">

                            <div class="inner">

                                <div class="preview-box">

                                    
                                        <blockquote>功能源于公司内部需求，需要在地图上展示土地分布（建筑用地），包括展示和增加新的坐标集，因为原始数据需要保密，所以用的测试数据。尝试了mvc分层的模式来开发，尽量靠近面向对象的js编程。...</blockquote>
                                </div>

                                <a class="preview-mask" href="/works/282" title="百度地图的描点工具"></a>

                                <h5>

                                    <a href="/works/282" title="百度地图的描点工具">百度地图的描点工具</a>

                                </h5>

                                <div class="info">

                                    <span class="author-info">

                                        <a href="/author/721" class="author-name" title="luzuoquan">luzuoquan</a>

                                        
                                    </span>

                                    <span class="opts">

                                        <a href="javascript:void(0)" onclick="do_good_await('Works','good',282)" class="btn-like" title="喜欢+1">

                                            <span id="do_good_282">1</span>

                                        </a>

                                    </span>

                                </div>

                            </div>

                        </li><li class="span4">

                            <div class="inner">

                                <div class="preview-box">

                                    
                                        <blockquote>短小精悍的CSS3动画库...</blockquote>
                                </div>

                                <a class="preview-mask" href="/works/280" title="Animator：CSS3动画库"></a>

                                <h5>

                                    <a href="/works/280" title="Animator：CSS3动画库">Animator：CSS3动画库</a>

                                </h5>

                                <div class="info">

                                    <span class="author-info">

                                        <a href="/author/698" class="author-name" title="牧之">牧之</a>

                                        
                                    </span>

                                    <span class="opts">

                                        <a href="javascript:void(0)" onclick="do_good_await('Works','good',280)" class="btn-like" title="喜欢+1">

                                            <span id="do_good_280">3</span>

                                        </a>

                                    </span>

                                </div>

                            </div>

                        </li>
                    </ul>
                </div>
                <div class="pagination pagination-right">
                    <ul>
                          <li><a href="#">1</a></li>
                          <li><span class="active">2</span></li>
                          <li><a href="#">3</a></li>
                          <li><a href="#">4</a></li>
                          <li><a href="5">5</a></li>
                    </ul>
                </div>
            </div>
          </div>
        </div>
    </div>
</div>
</body>
</html>