<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>翻书效果</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mybase.css">
<script type="text/javascript" src="js/PDFObject.js"></script>
<style type="text/css">
.gl_book_content{
	width:100%;
}
</style>
</head>
<body onload="loadPage();">
	<input type="hidden" id="bid" name="bid" value="<s:property value="model.idteaching_plan"/>"/>
	<input type="hidden" id="book_name" value="<s:property value="model.teaching_plan_name" />"/>
	<div class="gl_book_content">
		<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border:1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4" height="26">
					<strong>教案信息</strong>
					<input type="hidden" id="book_type" name="book_type" value="<s:property value="book_type"/>"> 
				</td>
			</tr>
			<tr>
				<td height="850">
					<div id="pdf"></div>
					<!-- <iframe id="word" src='' width='100%' height='100%' frameborder='1'>
					</iframe> -->
				</td>
			</tr>
		</table>
	</div>

	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/turn.js"></script>
	<script type="text/javascript" src="js/mybase.js"></script>
	<script type="text/javascript">
function loadPage(){
	var iframe = document.getElementById("word");
	var name=document.getElementById("book_name").value;
	//iframe.src = "http://47.102.133.243/book/teachingplans/"+name+".html";
	var book_type = $('#book_type').val();
	
	var url = "http://47.102.133.243/book/teachingplans/"+book_type+"/"+name+".pdf";
	var options = {
            height: "850px",
            pdfOpenParams: {view: 'FitV', page: '0' },
            name:"mans",
            fallbackLink: "<p>您的浏览器暂不支持此pdf，请下载最新的浏览器</p>"
        };
	PDFObject.embed(url, "#pdf",options);
}
</script>
</body>
</html>