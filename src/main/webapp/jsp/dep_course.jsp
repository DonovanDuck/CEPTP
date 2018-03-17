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
a{color: #666;}
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
.Clable{width: 930px;height: 129px;position: relative;left: 216px;top:10px;}
.Clable ul{width: 930px;height: 129px;}
.Clable ul li{
	padding-top: 1px;
    width: 125px;
    height: 30px;
    line-height: 30px;
    float: left;
    margin-right: 7px;
    text-align: center;
    background: #f8f8f8;
}
.Clable ul li:hover{color: #55b929;}
.lable_span{
	display: inline-block;
    padding: 0 20px;
    width: 118px;
    overflow: hidden;
    font-size: 13px;
}
.lable_span:hover{background: #55b929;color: #fff}
.course{display:inline-block;position: relative;left: 252px;top:10px;}
.course_li{width: 687px;height: 152px;background: #f8f8f8;margin-bottom: 40px}
.course_img{width: 265px;height: 152px;float: left;}
.course_img img{width: 265px;height: 152px;}
.inform{width: 422px;height: 152px;float: left;}
.c_title{width: 400px;margin-left: 22px;margin-bottom: 10px;margin-top: 10px;font-size: 16px;}
.c_publisher{width: 400px;margin-left: 22px;margin-bottom: 10px;margin-top: 10px;color: #999;font-size: 12px}
.c_detail{width: 400px;margin-left: 22px;margin-bottom: 10px;margin-top: 10px;font-size: 14px;color: #666666;}
</style>

</head>
<body onload="myfun()">
	<!--header-->
 <nav class="navbar navbar-default"
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
		style="width: 400px; position: relative; left: 487px; top: 29px;margin-bottom: 55px">
		<input type="text" class="form-control" placeholder="搜索课程"> <span
			class="input-group-btn">
			<button class="btn btn-default" type="button">搜索</button> 
		</span>
	</div>

	<div class="Clable">
		<ul>
			<li>
				<a href="${pageContext.request.contextPath}/course/findCouByPage/1/0"><span class="lable_span">全部</span></a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/course/findCouByPage/1/0"><span class="lable_span">计算机工程</span></a>
			</li>
			<li>
				<a href="www.baidu.com"><span class="lable_span">机械工程</span></a>
			</li>
			<li>
				<a href="www.baidu.com"><span class="lable_span">设计艺术</span></a>
			</li>
			<li>
				<a href="www.baidu.com"><span class="lable_span">计算机</span></a>
			</li>
			<li>
				<a href="www.baidu.com"><span class="lable_span">计算机</span></a>
			</li>
			<li>
				<a href="www.baidu.com"><span class="lable_span">计算机</span></a>
			</li>
			<li>
				<a href="www.baidu.com"><span class="lable_span">计算机</span></a>
			</li>
			<li>
				<a href="www.baidu.com"><span class="lable_span">计算机</span></a>
			</li>
			<li>
				<a href="www.baidu.com"><span class="lable_span">计算机</span></a>
			</li>
			<li>
				<a href="www.baidu.com"><span class="lable_span">计算机</span></a>
			</li>
			<li>
				<a href="www.baidu.com"><span class="lable_span">计算机</span></a>
			</li>
			<li>
				<a href="www.baidu.com"><span class="lable_span">计算机</span></a>
			</li>
			
		</ul>
	</div>
	
	<div class="course">
		<ul>
			<c:forEach items="${courseList }" var="course" varStatus="index">
				<li>
			<a href="${pageContext.request.contextPath}/course/toIntoCourse/${course.course_id}">
				<div class="course_li">
					<div class="course_img">
						<img  src="${pageContext.request.contextPath}/img/11.jpg" />
					</div>
					<div class="inform">
						<div class="c_title"><span>${course.course_name }</span></div>
						<div class="c_publisher"><span>${usernames[index.index] }</span></div>
						<div class="c_detail"><span>${course.course_notes }</span></div>
					</div>
				</div>
			</a>
			</li>
			</c:forEach>
		
			
		</ul>
	</div>
	
	<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="/jsp/pager/pager.jsp" %>
</div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/shouye.js"
	type="text/javascript" charset="utf-8"></script>
</html>