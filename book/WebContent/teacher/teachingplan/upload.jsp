<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>上传文件</title>

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/UploadW.js"></script>
<script type="text/javascript" src="js/excel.js"></script>
<link rel="stylesheet" href="css/uploadW.css">
</head>
<body>
	<form id="importForm" action="${pageContext.request.contextPath }/teachingPlan_importWordData" enctype="multipart/form-data" method="post">
   		<table width="100%">
   			<tr>
   				<td>
   					<div class="file_upload">
    					<input type="submit" id="importWordBtn" class="subBtn" value="导入"/>
    					<input type="button" onclick="window.location.reload()" id="clear" class="subBtn" value="清空"/>
   					</div>
   					<input id="wordInput" class="m_upload" name="wordInput" type="file" value=""/>
   				</td>
   			</tr>
   		</table>
   	</form>
</body>
</body>

<!-- 引用控制层插件样式 -->
<!-- 
<link rel="stylesheet" href="css/zyUpload.css" type="text/css">
<script src="http://www.lanrenzhijia.com/ajaxjs/jquery.min.js"></script>
引用核心层插件
<script src="js/zyFile.js"></script>
引用控制层插件
<script src="js/zyUpload.js"></script>
引用初始化JS
<script src="js/lanrenzhijia.js"></script>
</head>
<body>
<h1 style="text-align:center;">上传教案</h1>
<div id="demo" class="demo"></div>
</body> -->
</html>