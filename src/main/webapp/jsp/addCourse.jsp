<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加课程</title>
		<link rel="stylesheet"href="${pageContext.request.contextPath}/css/二级.css" />
	</head>
	<body>
		<header class="header">
			<h1 class="fl logo">
				<a href="#"><img src="img/logo.jpg"/> </a>
			</h1>
			<div class="content">
				<ul>
					<li class="fl list"><a href="">任务中心</a></li>
					<li class="fl list"><a href="">|</a></li>
					<li class="fl list"><a href="">课程包</a></li>
					<li class="fl list"><a href="">|</a></li>
					<li class="fl list"><a href="">库管理</a></li>
					<li class="fl list"><a href="">|</a></li>
					<li class="fl list"><a href="">我的题库</a></li>
					<li class="fl list"><a href="">|</a></li>
				</ul>
				<ul>
					<li class="fl list"><a href=""><img src="img/logo.jpg"style="width: 20px;height: 20px;" /> </a></li>
					<li class="fl list"><a href="">用户名</a></li>
					<li class="fl list"><a href="">退出</a></li>
				</ul>
			</div>
		</header>
		<form action="<c:url value='/course/addCourse'/>">
		<div class="detail">
			<span>学校*</span><br />
			<input type="text"id="class"name="school" /><br />
			<span>课程名*</span><br />
			<select name="coures_name"class="kecheng">
				<option>请选择或填写课程</option>
				<option>汉语言文学</option>
				<option>大学英语</option>
				<option>计算机导论</option>
				<option>数据库原理</option>
				<option>高等数学</option>
				<option>大学体育</option>
			</select><br />
			<span>类型*</span><br />
			<input type="radio"name="course_lable"id="school" />
			学校课表班课（学校课表班课就是学校安排课表里的正常班课）<br />
			设置班课封面<br />
			<input type="file" name="course_img"><img src="img/3.png" /></input><br />
			<button type="submit"class="submit">确定</button>
			<button type="reset">取消</button>
		</div>
		</form>
	</body>
</html>
