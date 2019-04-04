<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/css/left.css"
	rel="stylesheet" type="text/css" />
<link rel="StyleSheet"
	href="${pageContext.request.contextPath}/css/mytree.css"
	type="text/css" />
</head>
<body>
	<table width="100" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="12"></td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td>
				<div class="dtree">

					<a href="javascript: d.openAll();">展开所有</a> | <a
						href="javascript: d.closeAll();">关闭所有</a>

					<script type="text/javascript"
						src="${pageContext.request.contextPath}/js/dtree.js"></script>
					<script type="text/javascript">
		d = new dTree('d');
		d.add('01',-1,'系统菜单树');
		d.add('0101','01','教师管理','','','mainFrame');
		d.add('010101','0101','教师管理','${pageContext.request.contextPath}/teacherSuperManager_findTeacherAll?page=1','','mainFrame');
		
		d.add('0102','01','园长管理');
		d.add('010201','0102','园长管理','${pageContext.request.contextPath}/deanManager_findDeanAll?page=1','','mainFrame');
		
		d.add('0103','01','绘本管理');
		d.add('010302','0103','社会');
		d.add('010303','010302','社会','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=1&page=1','','mainFrame');
		d.add('010304','0103','科学');
		d.add('010305','010304','数学','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=2&page=1','','mainFrame');
		d.add('010306','010304','探究','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=3&page=1','','mainFrame');
		d.add('010307','0103','艺术');
		d.add('010308','010307','美术','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=4&page=1','','mainFrame');
		d.add('010309','010307','音乐','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=5&page=1','','mainFrame');
		d.add('010310','0103','健康');
		d.add('010311','010310','健康','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=6&page=1','','mainFrame');
		d.add('010312','0103','语言');
		d.add('010313','010312','语言','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=7&page=1','','mainFrame');
		
		d.add('0104','01','学生管理');
		d.add('010401','0104','学生管理','${pageContext.request.contextPath}/studentSuperManager_findStudentAll?page=1','','mainFrame');
		
		d.add('0105','01','个人中心');
		d.add('010501','0105','个人信息','${pageContext.request.contextPath}/manager_info?aid=1','','mainFrame');
		d.add('010502','0105','修改密码','${pageContext.request.contextPath}/manager_updatePasswordPage','','mainFrame');
		document.write(d);
	</script>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
