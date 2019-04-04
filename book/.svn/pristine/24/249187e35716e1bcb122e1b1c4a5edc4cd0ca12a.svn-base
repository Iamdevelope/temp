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
		d.add('010101','0101','教师管理','${pageContext.request.contextPath}/teacherDean_findTeacherAll?page=1','','mainFrame');
		
		d.add('0102','01','绘本管理');
		d.add('010202','0102','社会');
		d.add('010203','010202','社会','${pageContext.request.contextPath}/bookDean_findBookAll?btype=1&page=1','','mainFrame');
		d.add('010204','0102','科学');
		d.add('010205','010204','数学','${pageContext.request.contextPath}/bookDean_findBookAll?btype=2&page=1','','mainFrame');
		d.add('010206','010204','探究','${pageContext.request.contextPath}/bookDean_findBookAll?btype=3&page=1','','mainFrame');
		d.add('010207','0102','艺术');
		d.add('010208','010207','美术','${pageContext.request.contextPath}/bookDean_findBookAll?btype=4&page=1','','mainFrame');
		d.add('010209','010207','音乐','${pageContext.request.contextPath}/bookDean_findBookAll?btype=5&page=1','','mainFrame');
		d.add('010210','0102','健康');
		d.add('010211','010210','健康','${pageContext.request.contextPath}/bookDean_findBookAll?btype=6&page=1','','mainFrame');
		d.add('010212','0102','语言');
		d.add('010213','010212','语言','${pageContext.request.contextPath}/bookDean_findBookAll?btype=7&page=1','','mainFrame');
		
		d.add('0103','01','学生管理');
		d.add('010301','0103','学生管理','${pageContext.request.contextPath}/studentDean_findStudentAll?page=1','','mainFrame');
		
		d.add('0104','01','个人中心');
		d.add('010401','0104','个人信息','${pageContext.request.contextPath}/dean_info?aid=1','','mainFrame');
		d.add('010402','0104','修改密码','${pageContext.request.contextPath}/dean_updatePasswordPage','','mainFrame');
		document.write(d);
	</script>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
