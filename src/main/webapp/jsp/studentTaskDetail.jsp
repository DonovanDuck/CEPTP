<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html">
<title>提交列表</title>
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
	
	function downloadtest(id){
		var url = "<%=request.getContextPath()%>/course/download" + "/" + id;
		$("#pluginurl").attr("href",url);
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
		<h5>
			<p style="font-size: 25px;">561</p>
			<p style="font-size: 18px;">java</p>
		</h5>
	</div>
	</header>
	<!--body-->
	<div class="container body">
		<!--information-->
		<div class="information" style="margin-bottom: 57px;">
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
		
		<!--作业详情-->
			<input type="hidden" name="course_id" value="${task.course_id }">
			<div>
				<p style="font-size: 24px;position: relative;left: 472px;top:-12px;font-family: 微软雅黑">${user.user_name }的作业详情：</p>
				<textarea id="task_details" class="" disabled="disabled" cols="188"
					rows="10" placeholder="请输入" name="task_details"
					style="display: none;">${task.uploadTask_details }</textarea>
			</div>
			<div id="txt" style="margin-bottom: 10px;background-color: #efecec;"></div>
			<p>下载附件：</p>
			<c:forEach items="${task.uploadAccs }" var ="acc">
				<a href="#" onclick="javascript:downloadtest('${acc.accessory_id}')"  id="pluginurl"  style="color: #83AFE2;text-decoration:underline;">${acc.accessory_name }</a>
				</br>
			</c:forEach>
			
			<div style="margin-top: 28px;">
			</div>
			<c:if test="${status == 2 && grade==-1}">
				<div>
					<p>总体评分：</p>
					<form action="${pageContext.request.contextPath}/course/setGrade">
						<input type="hidden" name="task_id" value="${task.task_id }"/>
						<input type="hidden" name="user_id" value="${user.user_id }"/>
						<div class="input-group" style="width: 188px;">
      <input type="text" class="form-control" placeholder="评分" name="grade">
      <span class="input-group-btn">
        <button class="btn btn-default" type="submit">搜索</button>
      </span>
    </div>
					</form>
				</div>
			</c:if>
			
			<c:if test="${status==2 && grade!=-1 }">
				<div>
					<span>总体评分：</span>
					<span style="font-size: 32px;color: #ff6600;position: relative;top:6px;left: -4px;">${grade }</span>
					<a href="${pageContext.request.contextPath}/course/toupdateGrade/${task.task_id}/${user.user_id}"><span style="font-size: 14px;position: relative;top:2px;left: 10px;">修改成绩</span></a>
				</div>
			</c:if>
			
	</div>

</body>

</html>