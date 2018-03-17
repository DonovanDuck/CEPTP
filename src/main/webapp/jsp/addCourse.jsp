<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加课程</title>
		
		<link href="${pageContext.request.contextPath}/css/fourthpage.css" type="text/css" rel="stylesheet">
		<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script  type="text/javascript" >
			function AddMoreRow(){
					var oRow = event.srcElement.parentNode.parentNode;
					var oTable = oRow.parentNode.parentNode;
					var rowCount = oTable.rows.length;
					oNewRow = oTable.insertRow(rowCount);
					oNewRow.insertCell(0).innerHTML = "<input type='text' class='form-control' name='course_lable'style='width:223px;margin-bottom:3px;' />";
				}
	
		</script>
	</head>
	  
	
	<body>
     <header class="head1" style="height: 43px;width: 1089px;margin-bottom: 20px;margin: 0 auto;" >
        <nav class="navbar navbar-default" role="navigation" style="width:1120px;margin-left:20px;">
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
    </header>
		<form action="<c:url value='/course/addCourse'/>">
		<div class="detail">
			<span style="font-family: '微软雅黑''">学校*</span><br />
			<input type="text" class="form-control" name="school" /><br />
			<span>课程名*</span><br />
			<input type="text" class="form-control" name="course_name" /><br />
			<table style="margin-bottom:20px;">
				<tr>
					<td><input class="btn btn-info" type="button" value="添加标签" onclick="AddMoreRow()"><br /></td>
				</tr>
			</table>
			<span>课程简介</span><br />
			<textarea class="form-control" rows="3" name="course_notes"></textarea>
			<span>适用专业</span><br />
			<input type="text" class="form-control" name="application_pro" /><br />
			<span>添加课程图片</span><br />
			<div class="clphoto">
				<label for="file" class="filephoto">+</label>
				<input type="file" id="file" style=";" name="course_img">
			</div>
			<div class="sub">
				<button type="submit" class="btn btn-default" style="margin-right: 200px">提交</button>
				<button type="button" class="btn btn-default">取消</button>
				
			</div>
		</div>
		</form>
	</body>
</html>
