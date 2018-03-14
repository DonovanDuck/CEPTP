<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html">
    <title>我的课程</title>
    <link href="${pageContext.request.contextPath}/css/fourthpage.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/fourthpage.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
     
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    

</head>
<body onload="myfun()">
<!--header-->
    <header class="header">
        <nav class="navbar navbar-default" role="navigation" style="width:1120px;margin-left:107px;">
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
        <div class="input-group" style="width: 738px;position: relative;left: 487px;top:29px;">
      <input type="text" class="form-control" placeholder="搜索课程">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button">搜索</button>
        <a href="${pageContext.request.contextPath}/course/toAddCourse"><button class="btn btn-default" type="button" style="margin-left: 135px;">创建课程</button></a>
        <a href="${pageContext.request.contextPath}/course/toJoinCourse"><button class="btn btn-default" type="button" style="margin-left: 35px;">加入课程</button></a>
      </span>
    </div>
    <div>
    	<ul style="width: 1087px;height:  300px;margin-left: 178px;margin-top: 90px;">
    		<li style="float: left;width: 225px;height: 352px;margin-right: 31px;margin-bottom: 42px;">
    			<div style="width: 225px;height: 222px;">
    				<img style="width: 100%;height: 100%;" alt="" src="${pageContext.request.contextPath}/img/background.jpg">
    			</div>
    			<div>
    				<h3 style="font-family: 微软雅黑;font-size: 18px">题目</h3>
    			</div>
    			<div style="font-family: 微软雅黑;font-size: 13px;margin-bottom: 2px;opacity: 0.8;">标签</div>
    			<div style="font-family: 微软雅黑;font-size: 13px;margin-bottom: 2px;opacity: 0.8;">专业</div>
    			<div>
    				<img style=" width: 30px;height: 30px;float: left;margin-right: 5px;border-radius: 50%;" alt="" src="${pageContext.request.contextPath}/img/background.jpg">
    				<span style="float: left;font-family: 微软雅黑;margin-left: 11px;padding-top: 6px;">发布者</span>
    			</div>
    		</li>
    		
    		
    		
    		<li style="float: left;width: 225px;height: 352px;margin-right: 31px;margin-bottom: 42px;">
    			<div style="width: 225px;height: 222px;">
    				<img style="width: 100%;height: 100%;" alt="" src="${pageContext.request.contextPath}/img/background.jpg">
    			</div>
    			<div>
    				<h3 style="font-family: 微软雅黑;font-size: 18px">题目</h3>
    			</div>
    			<div style="font-family: 微软雅黑;font-size: 13px;margin-bottom: 2px;opacity: 0.8;">标签</div>
    			<div style="font-family: 微软雅黑;font-size: 13px;margin-bottom: 2px;opacity: 0.8;">专业</div>
    			<div>
    				<img style=" width: 30px;height: 30px;float: left;margin-right: 5px;border-radius: 50%;" alt="" src="${pageContext.request.contextPath}/img/background.jpg">
    				<span style="float: left;font-family: 微软雅黑;margin-left: 11px;padding-top: 6px;">发布者</span>
    			</div>
    		</li><li style="float: left;width: 225px;height: 352px;margin-right: 31px;margin-bottom: 42px;">
    			<div style="width: 225px;height: 222px;">
    				<img style="width: 100%;height: 100%;" alt="" src="${pageContext.request.contextPath}/img/background.jpg">
    			</div>
    			<div>
    				<h3 style="font-family: 微软雅黑;font-size: 18px">题目</h3>
    			</div>
    			<div style="font-family: 微软雅黑;font-size: 13px;margin-bottom: 2px;opacity: 0.8;">标签</div>
    			<div style="font-family: 微软雅黑;font-size: 13px;margin-bottom: 2px;opacity: 0.8;">专业</div>
    			<div>
    				<img style=" width: 30px;height: 30px;float: left;margin-right: 5px;border-radius: 50%;" alt="" src="${pageContext.request.contextPath}/img/background.jpg">
    				<span style="float: left;font-family: 微软雅黑;margin-left: 11px;padding-top: 6px;">发布者</span>
    			</div>
    		</li><li style="float: left;width: 225px;height: 352px;margin-right: 31px;margin-bottom: 42px;">
    			<div style="width: 225px;height: 222px;">
    				<img style="width: 100%;height: 100%;" alt="" src="${pageContext.request.contextPath}/img/background.jpg">
    			</div>
    			<div>
    				<h3 style="font-family: 微软雅黑;font-size: 18px">题目</h3>
    			</div>
    			<div style="font-family: 微软雅黑;font-size: 13px;margin-bottom: 2px;opacity: 0.8;">标签</div>
    			<div style="font-family: 微软雅黑;font-size: 13px;margin-bottom: 2px;opacity: 0.8;">专业</div>
    			<div>
    				<img style=" width: 30px;height: 30px;float: left;margin-right: 5px;border-radius: 50%;" alt="" src="${pageContext.request.contextPath}/img/background.jpg">
    				<span style="float: left;font-family: 微软雅黑;margin-left: 11px;padding-top: 6px;">发布者</span>
    			</div>
    		</li><li style="float: left;width: 225px;height: 352px;margin-right: 31px;margin-bottom: 42px;">
    			<div style="width: 225px;height: 222px;">
    				<img style="width: 100%;height: 100%;" alt="" src="${pageContext.request.contextPath}/img/background.jpg">
    			</div>
    			<div>
    				<h3 style="font-family: 微软雅黑;font-size: 18px">题目</h3>
    			</div>
    			<div style="font-family: 微软雅黑;font-size: 13px;margin-bottom: 2px;opacity: 0.8;">标签</div>
    			<div style="font-family: 微软雅黑;font-size: 13px;margin-bottom: 2px;opacity: 0.8;">专业</div>
    			<div>
    				<img style=" width: 30px;height: 30px;float: left;margin-right: 5px;border-radius: 50%;" alt="" src="${pageContext.request.contextPath}/img/background.jpg">
    				<span style="float: left;font-family: 微软雅黑;margin-left: 11px;padding-top: 6px;">发布者</span>
    			</div>
    		</li><li style="float: left;width: 225px;height: 352px;margin-right: 31px;margin-bottom: 42px;">
    			<div style="width: 225px;height: 222px;">
    				<img style="width: 100%;height: 100%;" alt="" src="${pageContext.request.contextPath}/img/background.jpg">
    			</div>
    			<div>
    				<h3 style="font-family: 微软雅黑;font-size: 18px">题目</h3>
    			</div>
    			<div style="font-family: 微软雅黑;font-size: 13px;margin-bottom: 2px;opacity: 0.8;">标签</div>
    			<div style="font-family: 微软雅黑;font-size: 13px;margin-bottom: 2px;opacity: 0.8;">专业</div>
    			<div>
    				<img style=" width: 30px;height: 30px;float: left;margin-right: 5px;border-radius: 50%;" alt="" src="${pageContext.request.contextPath}/img/background.jpg">
    				<span style="float: left;font-family: 微软雅黑;margin-left: 11px;padding-top: 6px;">发布者</span>
    			</div>
    		</li>
    		
    	</ul>
    </div>
</body>

</html>