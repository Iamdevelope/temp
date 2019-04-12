<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head onbeforeunload="return exit();">
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
<script type="text/javascript">
    	/* window.onbeforeunload=function(e){
    		console.log("该用户退出成功");
    		window.location.href="${pageContext.request.contextPath}/superManager_quit";
    	}
		window.onunload=function(){
			if(self.screenTop>9000){			
				window.location.href="${pageContext.request.contextPath}/superManager_quit";
			}
		} */
		
    </script>
<title>绘本管理后台-超级管理员</title>
</head>
	<frameset rows="30,*,43" frameborder=0 border="0" framespacing="0">
		<frame src="${pageContext.request.contextPath}/superManager/top.jsp"
			name="topFrame" scrolling="NO" noresize>
		<frameset cols="189,*" frameborder="0" border="0" framespacing="0">
			<frame src="${pageContext.request.contextPath}/superManager/left.jsp"
				name="leftFrame" noresize scrolling="YES">
			<frame
				src="${pageContext.request.contextPath}/superManager/welcome.jsp"
				name="mainFrame">
		</frameset>
		<frame src="${pageContext.request.contextPath}/superManager/bottom.jsp"
			name="bottomFrame" scrolling="NO" noresize>
	</frameset>
</html>