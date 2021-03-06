<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>绘本论坛-首页</title>
<link href="teacher/bookForum/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="teacher/bookForum/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />

<script type="text/javascript" src="bootstrap/js/jQuery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="common/top.jsp"/>
</div>
<div id="content" class="content" >
	<div class="book_forum_left">
		<div>
			<h4>绘本类别</h4>
			<div class="grap"></div>
		</div>
		<div class="book_type_list">
			<div class="book_type_item">
				<a href="javascript:void()">社会</a>
				<div class="grap"></div>
			</div>
			
			<div class="book_type_item">
				<a href="javascript:void()">数学</a>
				<div class="grap"></div>
			</div>
			<div class="book_type_item">
				<a href="javascript:void()">探究</a>
				<div class="grap"></div>
			</div>
			<div class="book_type_item">
				<a href="javascript:void()">美术</a>
				<div class="grap"></div>
			</div>
			<div class="book_type_item">
				<a href="javascript:void()">音乐</a>
				<div class="grap"></div>
			</div>
			<div class="book_type_item">
				<a href="javascript:void()">健康</a>
				<div class="grap"></div>
			</div>
			<div class="book_type_item">
				<a href="javascript:void()">语言</a>
				<div class="grap"></div>
			</div>
		</div>
	</div>
	<div class="book_forum_tiezi">	
		<jsp:include page="common/default.jsp"></jsp:include>
	</div>
	<div class="book_forum_right"></div>
</div>
<%-- <div id="footer" style="width: 1200px; margin: 0 auto;">
	<jsp:include page="common/footer.jsp"/>
</div> --%>
</body>
</html>