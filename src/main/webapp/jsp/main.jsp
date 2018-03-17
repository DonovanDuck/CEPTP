<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html">
<title>首页</title>
<link href="${pageContext.request.contextPath}/css/fourthpage.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/new_file.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/fourthpage.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>

<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.banner {
	height: 360px;
	position: relative;
	margin: 0 auto;
	margin-bottom: 99px;
}

.banner .tupian1 {
	width: 500%;
	height: 360px;
	position: absolute;
}

.banner .tupian1 li {
	
	height: 360px;
	width:1366px;
	float: left;
}

.banner img {
	height: 360px;
	width:1366px;
	position: absolute;
}

.banner ul.dian1 {
	position: absolute;
	left: 50%;
	bottom: 10%;
	margin-left: -77px;
}

.banner ul.dian1 li {
	width: 12px;
	height: 12px;
	border-radius: 12px;
	background-color: white;
	margin: 12px;
	cursor: pointer;
}

.banner ul.dian1 li.col {
	background-color: #0094E1;
	cursor: pointer;
}
.course{display:inline-block;width: 1024px}
.course ul{width: 1024px; min-height:300px;height:auto; margin-left: 178px; margin-top: 0px;display:inline-block;}
.course ul li{float: left; width: 225px; height: 352px; margin-right: 31px; margin-bottom: 42px;}
.course_img{width: 225px; height: 222px;}
.course_img img{width: 100%; height: 100%;}
.course_d{font-family: 微软雅黑; font-size: 13px; margin-bottom: 2px; opacity: 0.8;}
.publisher img{width: 30px; height: 30px; float: left; margin-right: 5px; border-radius: 50%;}
.publisher span{float: left; font-family: 微软雅黑; margin-left: 11px; padding-top: 6px;}
.course_title{font-family: 微软雅黑;position: relative;top:-14px;left: 175px;}
.more{float: right;position: relative;top:-24px;left: 137px;}
</style>

</head>
<body onload="myfun()">
	<!--header-->
	<header class="header"> <nav class="navbar navbar-default"
		role="navigation" style="width:1120px;margin-left:107px;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand glyphicon-cloud" href="#">我的班课</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#"> 任务中心</a></li>
			<li><a href="#"> 课程包</a></li>
			<li><a href="#"> 库管理</a></li>
			<li><a href="#"> 我的题库</a></li>
			<li><a href="#"> 用户名</a></li>
			<li><a href="#"> 退出</a></li>
		</ul>
	</div>
	</nav>
	<div class="input-group"
		style="width: 738px; position: relative; left: 487px; top: 29px;margin-bottom: 55px">
		<input type="text" class="form-control" placeholder="搜索课程"> <span
			class="input-group-btn">
			<button class="btn btn-default" type="button">搜索</button> <a
			href="${pageContext.request.contextPath}/course/toAddCourse"><button
					class="btn btn-default" type="button" style="margin-left: 135px;">创建课程</button></a>
			<a href="${pageContext.request.contextPath}/course/toJoinCourse"><button
					class="btn btn-default" type="button" style="margin-left: 35px;">加入课程</button></a>
		</span>
	</div>

	<div class="banner pr overhidden">
		<ul class="tupian1">
			<li class="fl"><img
				src="${pageContext.request.contextPath}/img/11.jpg" /></li>
			<li class="fl"><img
				src="${pageContext.request.contextPath}/img/12.jpg" /></li>
			<li class="fl"><img
				src="${pageContext.request.contextPath}/img/13.jpg" /></li>
			<li class="fl"><img
				src="${pageContext.request.contextPath}/img/14.jpg" /></li>
		</ul>

		<ul class="dian1">
			<li class="fl col"></li>
			<li class="fl"></li>
			<li class="fl"></li>
			<li class="fl"></li>
		</ul>
	</div>

	
	<div class="course">
		<div class="course_title">
		<h3>创建的课程</h3>
	</div>
		<ul>
			<a
				href="${pageContext.request.contextPath}/course/toIntoCourse/152056138_372388382828">
				<li>
					<div class="course_img" >
						<img alt=""
							src="${pageContext.request.contextPath}/img/background.jpg">
					</div>
					<div>
						<h3 style="font-family: 微软雅黑; font-size: 18px">题目</h3>
					</div>
					<div class="course_d">学期</div>
					<div class="course_d">专业</div>
					<div class="publisher">
						<img alt=""
							src="${pageContext.request.contextPath}/img/background.jpg">
						<span>发布者</span>
					</div>
			</li>
			</a>



			
			
			<a
				href="${pageContext.request.contextPath}/course/toIntoCourse/152056138_372388382828">
				<li>
					<div class="course_img" >
						<img alt=""
							src="${pageContext.request.contextPath}/img/background.jpg">
					</div>
					<div>
						<h3 style="font-family: 微软雅黑; font-size: 18px">题目</h3>
					</div>
					<div class="course_d">学期</div>
					<div class="course_d">专业</div>
					<div class="publisher">
						<img alt=""
							src="${pageContext.request.contextPath}/img/background.jpg">
						<span>发布者</span>
					</div>
			</li>
			</a>
			<a
				href="${pageContext.request.contextPath}/course/toIntoCourse/152056138_372388382828">
				<li>
					<div class="course_img" >
						<img alt=""
							src="${pageContext.request.contextPath}/img/background.jpg">
					</div>
					<div>
						<h3 style="font-family: 微软雅黑; font-size: 18px">题目</h3>
					</div>
					<div class="course_d">学期</div>
					<div class="course_d">专业</div>
					<div class="publisher">
						<img alt=""
							src="${pageContext.request.contextPath}/img/background.jpg">
						<span>发布者</span>
					</div>
			</li>
			</a>
			<a
				href="${pageContext.request.contextPath}/course/toIntoCourse/152056138_372388382828">
				<li>
					<div class="course_img" >
						<img alt=""
							src="${pageContext.request.contextPath}/img/background.jpg">
					</div>
					<div>
						<h3 style="font-family: 微软雅黑; font-size: 18px">题目</h3>
					</div>
					<div class="course_d">学期</div>
					<div class="course_d">专业</div>
					<div class="publisher">
						<img alt=""
							src="${pageContext.request.contextPath}/img/background.jpg">
						<span>发布者</span>
					</div>
			</li>
			</a>
			
		</ul>
		<div class="more">
		<a href="${pageContext.request.contextPath}/jsp/myclass.jsp">
			<span>更多>></span>
		</div>
		</a>
	</div>
	
	<div class="course">
	<div class="course_title">
		<h3>加入的课程</h3>
	</div>
		<ul>
			<a
				href="${pageContext.request.contextPath}/course/toIntoCourse/152056138_372388382828">
				<li
				style="float: left; width: 225px; height: 352px; margin-right: 31px; margin-bottom: 42px;">
					<div style="width: 225px; height: 222px;">
						<img style="width: 100%; height: 100%;" alt=""
							src="${pageContext.request.contextPath}/img/background.jpg">
					</div>
					<div>
						<h3 style="font-family: 微软雅黑; font-size: 18px">题目</h3>
					</div>
					<div
						style="font-family: 微软雅黑; font-size: 13px; margin-bottom: 2px; opacity: 0.8;">学期</div>
					<div
						style="font-family: 微软雅黑; font-size: 13px; margin-bottom: 2px; opacity: 0.8;">专业</div>
					<div>
						<img
							style="width: 30px; height: 30px; float: left; margin-right: 5px; border-radius: 50%;"
							alt=""
							src="${pageContext.request.contextPath}/img/background.jpg">
						<span
							style="float: left; font-family: 微软雅黑; margin-left: 11px; padding-top: 6px;">发布者</span>
					</div>
			</li>
			</a>



			<li
				style="float: left; width: 225px; height: 352px; margin-right: 31px; margin-bottom: 42px;">
				<div style="width: 225px; height: 222px;">
					<img style="width: 100%; height: 100%;" alt=""
						src="${pageContext.request.contextPath}/img/background.jpg">
				</div>
				<div>
					<h3 style="font-family: 微软雅黑; font-size: 18px">题目</h3>
				</div>
				<div
					style="font-family: 微软雅黑; font-size: 13px; margin-bottom: 2px; opacity: 0.8;">学期</div>
				<div
					style="font-family: 微软雅黑; font-size: 13px; margin-bottom: 2px; opacity: 0.8;">专业</div>
				<div>
					<img
						style="width: 30px; height: 30px; float: left; margin-right: 5px; border-radius: 50%;"
						alt="" src="${pageContext.request.contextPath}/img/background.jpg">
					<span
						style="float: left; font-family: 微软雅黑; margin-left: 11px; padding-top: 6px;">发布者</span>
				</div>
			</li>
			<li
				style="float: left; width: 225px; height: 352px; margin-right: 31px; margin-bottom: 42px;">
				<div style="width: 225px; height: 222px;">
					<img style="width: 100%; height: 100%;" alt=""
						src="${pageContext.request.contextPath}/img/background.jpg">
				</div>
				<div>
					<h3 style="font-family: 微软雅黑; font-size: 18px">题目</h3>
				</div>
				<div
					style="font-family: 微软雅黑; font-size: 13px; margin-bottom: 2px; opacity: 0.8;">学期</div>
				<div
					style="font-family: 微软雅黑; font-size: 13px; margin-bottom: 2px; opacity: 0.8;">专业</div>
				<div>
					<img
						style="width: 30px; height: 30px; float: left; margin-right: 5px; border-radius: 50%;"
						alt="" src="${pageContext.request.contextPath}/img/background.jpg">
					<span
						style="float: left; font-family: 微软雅黑; margin-left: 11px; padding-top: 6px;">发布者</span>
				</div>
			</li>
			<li
				style="float: left; width: 225px; height: 352px; margin-right: 31px; margin-bottom: 42px;">
				<div style="width: 225px; height: 222px;">
					<img style="width: 100%; height: 100%;" alt=""
						src="${pageContext.request.contextPath}/img/background.jpg">
				</div>
				<div>
					<h3 style="font-family: 微软雅黑; font-size: 18px">题目</h3>
				</div>
				<div
					style="font-family: 微软雅黑; font-size: 13px; margin-bottom: 2px; opacity: 0.8;">学期</div>
				<div
					style="font-family: 微软雅黑; font-size: 13px; margin-bottom: 2px; opacity: 0.8;">专业</div>
				<div>
					<img
						style="width: 30px; height: 30px; float: left; margin-right: 5px; border-radius: 50%;"
						alt="" src="${pageContext.request.contextPath}/img/background.jpg">
					<span
						style="float: left; font-family: 微软雅黑; margin-left: 11px; padding-top: 6px;">发布者</span>
				</div>
			</li>
			<li
				style="float: left; width: 225px; height: 352px; margin-right: 31px; margin-bottom: 42px;">
				<div style="width: 225px; height: 222px;">
					<img style="width: 100%; height: 100%;" alt=""
						src="${pageContext.request.contextPath}/img/background.jpg">
				</div>
				<div>
					<h3 style="font-family: 微软雅黑; font-size: 18px">题目</h3>
				</div>
				<div
					style="font-family: 微软雅黑; font-size: 13px; margin-bottom: 2px; opacity: 0.8;">学期</div>
				<div
					style="font-family: 微软雅黑; font-size: 13px; margin-bottom: 2px; opacity: 0.8;">专业</div>
				<div>
					<img
						style="width: 30px; height: 30px; float: left; margin-right: 5px; border-radius: 50%;"
						alt="" src="${pageContext.request.contextPath}/img/background.jpg">
					<span
						style="float: left; font-family: 微软雅黑; margin-left: 11px; padding-top: 6px;">发布者</span>
				</div>
			</li>
			
		</ul>
		<div class="more">
			<span>更多>></span>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/js/shouye.js"
	type="text/javascript" charset="utf-8"></script>
</html>