<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
BODY {
	MARGIN: 0px;
	BACKGROUND-COLOR: #ffffff;
	FONT-SIZE: 12px;
	COLOR: #000000;
}

TD {
	FONT-SIZE: 12px;
	COLOR: #000000
}

TH {
	FONT-SIZE: 12px;
	COLOR: #000000
}

.title{
	position:relative;
	height:30px;
	background:url(../images/mis_01.jpg) repeat-x;
}
.time{
	position:absolute;
	left:60px;
	top:10px;
}
.quitBtn{
	position:absolute;
	right:260px;
	top:6px;
}
.user{
	position:absolute;
	background:url(../images/mis_05b.jpg) repeat-x;
	right:20px;
	top:6px;
}
</style>
<script type="text/javascript">
	function exit(){
		window.location.href="${pageContext.request.contextPath}/teacher_quit";
		parent.window.location.href="${pageContext.request.contextPath}/teacherIndex";
	}
</script>
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
</HEAD>
<body>
	<table width="100%" height="70%" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
			<%-- <td><img width="100%"
				src="${pageContext.request.contextPath}/images/top_01.jpg"></td>

			<td width="100%"
				background="${pageContext.request.contextPath}/images/top_100.jpg">
			</td> --%>
		</tr>
	</table>
	<div class="title">
		<div class="time">
			<font color="#000000">
				<script language="JavaScript">

tmpDate = new Date();
date = tmpDate.getDate();
month= tmpDate.getMonth() + 1 ;
year= tmpDate.getYear()+1900;
document.write(year);
document.write("年");
document.write(month);
document.write("月");
document.write(date);
document.write("日 ");

myArray=new Array(6);
myArray[0]="星期日"
myArray[1]="星期一"
myArray[2]="星期二"
myArray[3]="星期三"
myArray[4]="星期四"
myArray[5]="星期五"
myArray[6]="星期六"
weekday=tmpDate.getDay();
if (weekday==0 | weekday==6)
{
document.write(myArray[weekday])
}
else
{document.write(myArray[weekday])
};
				</script>
			</font>
			
		</div>
		<div class="quitBtn">
			<button id="exitBtn" type="button" onclick="exit()">
				<span style="cursor:pointer;color: red;">安全退出</span>
			</button>
		</div>
		<div class="user">
			<table>
				<tr>
					<td width="16px" background="${pageContext.request.contextPath}/images/mis_05b.jpg">
						<img src="${pageContext.request.contextPath}/images/mis_05a.jpg" width="6" height="18">
					</td>
					<td width="200px" valign="bottom" background="${pageContext.request.contextPath}/images/mis_05b.jpg">
						当前用户： <font color="blue"><s:property value="#session.existAdmin.name" /></font>
					</td>
					<td width="10px" align="right" background="${pageContext.request.contextPath}/images/mis_05b.jpg">
						<img src="${pageContext.request.contextPath}/images/mis_05c.jpg" width="6" height="18">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</HTML>
