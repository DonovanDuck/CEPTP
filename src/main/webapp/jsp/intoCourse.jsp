<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html">
<title>添加作业</title>
<link href="${pageContext.request.contextPath}/css/fourthpage.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/fourthpage.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/BootFour-one.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function AddMoreRow(){
		var oRow = event.srcElement.parentNode.parentNode;
		var oTable = oRow.parentNode.parentNode;
		var rowCount = oTable.rows.length;
		oNewRow = oTable.insertRow(rowCount);
		oNewRow.insertCell(0).innerHTML = "附件"+rowCount;
		oNewRow.insertCell(1).innerHTML = "<input type='file' name='FilePath' size='75' onKeyDown='DisabledKeyInput()' />";
		/* oRow.all("DelBtn").disabled = false;
		oNewRow.all("DelBtn").disabled = false; */
	}
	
	


	/* function DeleteMoreRow() {
		var oRow = event.srcElement.parentNode.parentNode;
		var oTable = oRow.parentNode.parentNode;
		var rowCount = oTable.rows.length;
		if (oTable.rows.length > 1) {
			oTable.deleteRow(rowCount - 1);
			if (oTable.rows.length == 1) {
				oTable.all("DelBtn").disabled = true;
			}
		}
	} */
	
	function DisabledKeyInput() {
		if (event.keyCode != 8 && event.keyCode != 46) {
			event.returnValue = false;
		}
	}
	
	function myfun()
	{
		var str = $("#task_details").val();
		document.getElementById('txt').innerHTML=str;
	}
	
</script>

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
	<div class="background-img">
		<img>
		<h5>
			<p style="font-size: 25px;">561</p>
			<p style="font-size: 18px;">java</p>
		</h5>
	</div>
	</header>
	<!--body-->
	<div class="container body">
		<!--information-->
		<div class="information">
			<ul id="myTab" class="nav nav-tabs" style="height: 42px;">
				<li class="fl self-pic"><img
					src="${pageContext.request.contextPath}/img/java.jpg"></li>

				<li><a href="#homework" data-toggle="tab"> 作业(2） </a></li>
				<li class="active"><a href="#member" data-toggle="tab">
						提交列表（1） </a></li>

				<li><a href="#activity" data-toggle="tab"> 活动（0） </a></li>
				<li><a href="#message" data-toggle="tab"> 消息（0） </a></li>
				<li><a href="#info" data-toggle="tab"> 详情 </a></li>

				<li><a href="#import" data-toggle="tab"> 导出/报告 </a></li>
				<li><a href="#group" data-toggle="tab"> 分组 </a></li>
			</ul>
		</div>
		<div
			style="width: 984px; height: 55px; margin-top: 18px; padding-top: 16px; background: #f4f4f4;">
			<span style="font-size: 16px; margin-left: 25px;"> <a
				href="${pageContext.request.contextPath}/course/toAddTask/${course_id}">
					<span class="glyphicon glyphicon-cog" style="color: #ffb011;"></span>
					<span>作业任务</span>
			</a>
			</span> <span style="font-size: 16px; margin-left: 25px;"> <a
				href="${pageContext.request.contextPath}/course/toAddTask/${course_id}">
					<span class="glyphicon glyphicon-file" style="color: #8dcf00"></span>
					<span>实验任务</span>
			</a>
			</span>
		</div>
	</div>
	
	
	<ul>
		<c:forEach items="${taskList }" var="task">
	
			<a href="${pageContext.request.contextPath}/course/toStudentUpList/${task.task_id}">
		<li>
			
	<div style="margin-left: 119px;margin-top: 19px;height: 100px;width: 533px;">
		<div class="pic">
		<img src="img/2.png" />
	</div>
	<div class="cent">
		<span>进行中</span> ${task.task_name } <br />
		<ul>
			<li class="fl">共5道题目</li>
			<li class="fl">|</li>
			<li class="fl">共51人作答</li>
			<li class="fl">|</li>
			<li class="fl">${task.create_time }</li>
			<li class="fl">|</li>
			<li class="fl"><a href="">3经验</a></li>
		</ul>
	</div>
	
		</li>
		</a>
		</c:forEach>
		
	</ul>
	
	
	

</body>
<script type="text/javascript" charset="utf-8">
	UE.getEditor('task_details');
	
	
</script>
</html>