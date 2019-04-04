<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="teacher/bookForum/css/forumstyle.css" rel="stylesheet" />
<script type="text/javascript" href="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('li').click(function(){
		$('.current_page_item').attr('class','');
		var self = $(this);
		self.attr('class','current_page_item');
	})
});
</script>
</head>
<body>
<div>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1><a href="#">至慧堂绘本论坛</a></h1>
				<!-- <p> <a href="http://www.java1234.com/" rel="nofollow"></a></p> -->
			</div>
		</div>
	</div>
	<div id="menu-wrapper">
		<div id="menu" class="container">
			<ul>
				<li class="current_page_item"><a href="${pageContext.request.contextPath }/bookTeacher_bookForum?page=1">首　页</a></li>
				<li ><a href="#" >申请版主</a></li>
				<li ><a href="#" >在线文档</a></li>
				<li ><a href="#" >站点帮助</a></li>
				<li ><a href="#" >资源下载</a></li>
			</ul>
		</div>
		<!-- end #menu --> 
	</div>
</div>
</body>
</html>