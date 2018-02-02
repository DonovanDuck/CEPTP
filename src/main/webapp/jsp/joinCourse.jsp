<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet"href="${pageContext.request.contextPath}/css/addCourse.css" />
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
					<li class="fl list"><a href=""><img src="${pageContext.request.contextPath}/img/logo.jpg"style="width: 20px;height: 20px;" /> </a></li>
					<li class="fl list"><a href="">用户名</a></li>
					<li class="fl list"><a href="">退出</a></li>
				</ul>
			</div>
		</header>
		<form action="<c:url value='/course/joinCourse'/>">
		<div class="press">
			请输邀请码<br />
			<input type="text"id="press"name="press" /><br />
			<button type="submit"class="reset">查找</button>
			<button type="reset">取消</button>
		</div>
		</form>
	</body>
</html>
