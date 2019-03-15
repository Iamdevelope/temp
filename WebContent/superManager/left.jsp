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
		d.add('01',-1,'系统菜单');
		d.add('0101','01','管理员管理','','','mainFrame');
		d.add('010101','0101','管理员管理','${pageContext.request.contextPath}/managerSuperManager_findManagerAll?page=1','','mainFrame');
		d.add('0102','01','教师管理','','','mainFrame');
		d.add('010201','0102','教师管理','${pageContext.request.contextPath}/teacherSuperManager_findTeacherAll?page=1','','mainFrame');
		d.add('0103','01','院长管理');
		d.add('010301','0103','院长管理','${pageContext.request.contextPath}/deanSuperManager_findDeanAll?page=1','','mainFrame');
		
		d.add('0104','01','绘本管理');
		d.add('010402','0104','社会');
		d.add('010403','010402','社会','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=0&page=1','','mainFrame');
		d.add('010404','0104','科学');
		d.add('010405','010404','数学','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=1&page=1','','mainFrame');
		d.add('010406','010404','探究','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=2&page=1','','mainFrame');
		d.add('010407','0104','艺术');
		d.add('010408','010407','美术','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=3&page=1','','mainFrame');
		d.add('010409','010407','音乐','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=4&page=1','','mainFrame');
		d.add('010410','0104','健康');
		d.add('010411','010410','健康','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=5&page=1','','mainFrame');
		d.add('010412','0104','语言');
		d.add('010413','010412','语言','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=6&page=1','','mainFrame');
		d.add('0105','01','学生管理');
		d.add('010501','0105','学生管理','${pageContext.request.contextPath}/studentSuperManager_findStudentAll?page=1','','mainFrame');
		d.add('0106','01','个人中心');
		d.add('010601','0106','个人信息','${pageContext.request.contextPath}/superManager_info?aid=1','','mainFrame');
		d.add('010602','0106','修改密码','${pageContext.request.contextPath}/superManager_updatePasswordPage','','mainFrame');
		document.write(d);
	</script>
				</div>
			</td>
		</tr>
	</table>
	<%-- d.add('010401','0104','所有绘本','${pageContext.request.contextPath}/bookSuperManager_findBookAll?page=1','','mainFrame'); --%>
</body>
</html>
