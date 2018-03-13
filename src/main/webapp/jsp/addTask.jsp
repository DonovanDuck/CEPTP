<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html">
    <title>添加作业</title>
    <link href="${pageContext.request.contextPath}/css/fourthpage.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/BootFour-one.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/fourthpage.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/zh-cn.js"></script>
     
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script  type="text/javascript" >
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
        <!--搜索框-->
        <form  action="<c:url value='/course/publishTask'/>" enctype="multipart/form-data" 
       method="post">
        	<input type="hidden" name="course_id" value="${course_id }">
        	<div>
        		<p>作业详情：</p>
            	<textarea id = "task_details" class=""   cols="188" rows="10" placeholder="请输入" name="task_details"  ></textarea>
            	<p class="light">(选填)可输入文字或添加图片及其他类型附件</p>
        	</div>
            <table>
            	<tr>
	            	<td>
	            		<!-- <div class="file"> -->
	            			<input type="button" id="upFile" value="添加附件" onclick="AddMoreRow()">
	           			 
	           		</td>
            	</tr>
            </table>
            
            <div class="choice">
                <span class="form-title">作业标题：</span>
                <textarea placeholder="作业/小组任务" class="form-control" cols="188" name="task_name"></textarea>
                <!-- <div class="form-space">
                    <div>
                        <span>分组：</span>
                        <br>
                        <select>
                            <option>未分组</option>
                            <option>1111111</option>
                            <option>2222222</option>
                            <option>3333333</option>
                        </select>
                        <br>
                        <span class="light">请选择分组</span>
                    </div>
                    <div style="width: 1380px;margin-top: -75px;margin-left: 590px;">
                        <span>经验值：</span>
                        <br>
                        <select>
                            <option>3经验值</option>
                            <option>1111111</option>
                            <option>2222222</option>
                            <option>3333333</option>
                        </select>
                        <br>
                        <span class="light">学生提交结果后可获得该经验值</span>
                    </div>
                </div>
                <div class="form-space choice-end">
                    <div id="com-style" class="com-style">
                        <p>任务小组划分方式：学生将以小组为单位完成此活动，并按小组提交结果</p>
                        <div class="choice-style fl cho" style="width: 75px;">不分组</div>
                        <div class="choice-style fl" style="width: 125px;">随机划分小组</div>
                        <div class="choice-style fl" style="width: 125px;">线下划分小组</div>
                        <div class="choice-style fl" style="width: 125px;">使用成员小组</div>
                    </div>
                    <div id="result-style" class="result-style fl" style="margin-top: -16px;";>
                        <p>评价方式：可根据实际教学需求，选择对提交结果的评价方式</p>
                        <div class="choice-style fl cho" style="width: 100px;">教师评价</div>
                        <div class="choice-style fl" style="width: 180px;">指定助教/学生评价</div>
                        <div class="choice-style fl" style="width: 100px;">学生互评</div>
                    </div>
                </div> -->
                <div class="crecan">
                    <button type="submit" style="width: 75px" class="choice-style cho fl creat" >创建</button>
                    <div style="width: 75px" class="choice-style fl cancel">取消</div>
                </div>
            </div>
        </form>
    </div>

</body>
<script type="text/javascript" charset="utf-8">
	UE.getEditor('task_details');
	
	
</script>
</html>