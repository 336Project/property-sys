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
	<link rel="stylesheet" href="css/style.css" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="js/libs/datatables/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="js/libs/datatables/css/jquery.dataTables_themeroller.css">
	
	<script type="text/javascript" src="js/libs/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/libs/director/director.min.js"></script>
	<script type="text/javascript" src="js/libs/datatables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="js/ueditor/ueditor.config.js"></script>
	<script type="text/javascript">
		jQuery.urlRoot = "<%=path%>";
	</script>
	<script type="text/javascript" src="js/libs/echarts/echarts-all.js"></script>
</head>

<body>
<div class="l-container">
    <div class="l-b-row">
        <ul class="wgt-rainbow"><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul>
    </div>
    <div class="l-b-row ta-c">
        <div class="l-b-col l-side">
            <div class="box-shadow">
                <div class="wgt-logo">社区物业</div>
            </div>
            <div class="box-shadow">
                <div class="wgt-activityList sibar">
                    <div class="box-title">
                        <h3>品质服务</h3>
                        <!-- <a href="#" class="btn-more">更多</a> -->
                    </div>
                    <ul class="cst-services">
                        <li><a href="#/form/ruzhu">入住申请</a></li>
                        <li><a href="#/form/baoxiu">报修申请</a></li>
                        <li><a href="#/form/zhuangxiu">装修申请</a></li>
                        <li><a href="#/form/yiti">社会议题</a></li>
                        <li><a href="#/form/toupiao">发起投票</a></li>
                        <li><a href="#/form/huodong">发起活动</a></li>
                        <li><a href="#/form/tousu">投诉</a></li>
                        <li><a href="#/form/zixun">咨询</a></li>
                    </ul>
                    <div class="box-title">
                        <h3>与我相关</h3>
                        <!-- <a href="#" class="btn-more">更多</a> -->
                    </div>
                    <ul>
                    	<li><a href="#/info/my">我的信息</a></li>
                        <li><a href="#/info/zhanghu">账户信息</a></li>
                        <li><a href="#/info/jiaofei">缴费</a></li>
                        <li><a href="#/info/shenqing">我的申请</a></li>
                        <li><a href="#/info/fabu">我的发布</a></li>
                    </ul>
                </div>
            </div>
            <a class="box-shadow adshow-1" href="#">联系<strong>物业</strong>,请拨打<strong>1234567</strong></a>
        </div>
        <div class="l-b-col l-main">
          <div class="l-inner">
            <div class="l-header">         
                <ul class="wgt-topNav">
                    <li class="important">
                       <a href="#/listAll">首页</a>
                    </li>
                    <li>
                        <a href="#/list/gonggao">物业公告</a>
                    </li>
                    <li>
                        <a href="#/list/yiti">社会议题</a>
                    </li>
                    <li>
                        <a href="#/list/huodong">社区活动</a>
                    </li>
                    <li>
                        <a href="#/list/toupiao">社区投票</a>
                    </li>
                    <li>
                        <a href="#/list/tousu">投诉</a>
                    </li>
                    <li>
                        <a href="#/list/zixun">咨询</a>
                    </li>
                    <li>
                        <a href="<%=path%>/property-sys/userAction!login2back.action">我是管理员</a><!-- 后台管理登入入口 -->
                    </li>
                    <li>
                        <a href="<%=path%>/property-sys/userAction!logout.action">注销</a>
                    </li>
                </ul>
            </div>
            <div class="l-b-row row-fluid" id="main-panel">
                
            </div>
          </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
	var MODEl = null;/* 页面级参数 */
    var routes = {
        '/listAll':function(){changeMainPanel("list.html");},
        '/form':{ //表单页
            '/ruzhu':function(){changeMainPanel("form_ruzhu.html");}, //其中changeMainPanel()是切换主面板的内容，当然，也可以执行其他函数
            '/baoxiu': function(){changeMainPanel("form_baoxiu.html");},
            '/zhuangxiu': function(){changeMainPanel("form_zhuangxiu.html");},
            '/yiti': function(){changeMainPanel("form_yiti.html");},
            '/toupiao': function(){changeMainPanel("form_toupiao.html");},
            '/huodong': function(){changeMainPanel("form_huodong.html");},
            '/tousu': function(){changeMainPanel("form_tousu.html");},
            '/zixun': function(){changeMainPanel("form_zixun.html");}
        },
        '/list': { //列表页
			'/gonggao': function(){changeMainPanel("list_gonggao.html");},
			'/yiti': function(){changeMainPanel("list_yiti.html");},
			'/huodong': function(){changeMainPanel("list_huodong.html");},
            '/toupiao': function(){changeMainPanel("list_toupiao.html");},
            '/tousu': function(){changeMainPanel("list_tousu.html");},
            '/zixun': function(){changeMainPanel("list_zixun.html");}
        },
        '/content':{//将id传递到下一页，id 可以从MODEL.id中获取 ，如果存为{"xxx":someParams}，则可以通过MODEL.xxx获取到该参数
        	'/huodong/:id':function(id){changeMainPanel("toupiao.jsp",{"id":id,"type":"huodong"});},
        	'/gonggao/:id':function(id){changeMainPanel("content.jsp",{"id":id,"type":"gonggao"});},
        	'/toupiao/:id':function(id){changeMainPanel("toupiao.jsp",{"id":id,"type":"toupiao"});},
        	'/tousu/:id':function(id){changeMainPanel("content.jsp",{"id":id,"type":"tousu"});},
        	'/yiti/:id':function(id){changeMainPanel("content.jsp",{"id":id,"type":"yiti"});},
        	'/zixun/:id':function(id){changeMainPanel("content.jsp",{"id":id,"type":"zixun"});}
        },
        '/info':{
        	'/my':function(){changeMainPanel("info_my.jsp");},
        	'/zhanghu':function(){changeMainPanel("info_zhanghu.jsp");},
        	'/jiaofei':function(){changeMainPanel("info_jiaofei.jsp");},
        	'/shenqing':function(){changeMainPanel("info_shenqing.jsp");},
        	'/fabu':function(){changeMainPanel("info_fabu.jsp");}
        }
    };

    var router = Router(routes);
    router.init();
    
</script>
</body>
</html>