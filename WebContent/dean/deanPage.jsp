<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body {
	SCROLLBAR-ARROW-COLOR: #ffffff;
	SCROLLBAR-BASE-COLOR: #dee3f7;
}
</style>
<link href="${pageContext.request.contextPath }/images/favicon.ico"
	rel="shortcut icon">
<title>绘本管理后台-院长</title>
</head>

<frameset rows="103,*,43" frameborder=0 border="0" framespacing="0">
	<frame src="${pageContext.request.contextPath}/dean/top.jsp"
		name="topFrame" scrolling="NO" noresize>
	<frameset cols="189,*" frameborder="0" border="0" framespacing="0">
		<frame src="${pageContext.request.contextPath}/dean/left.jsp"
			name="leftFrame" noresize scrolling="YES">
		<frame
			src="${pageContext.request.contextPath}/superManager/welcome.jsp"
			name="mainFrame">
	</frameset>
	<frame src="${pageContext.request.contextPath}/superManager/bottom.jsp"
		name="bottomFrame" scrolling="NO" noresize>
</frameset>
</html>