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
		d.add('0101','01','绘本管理');
		d.add('010102','0101','绘本类型管理');
		d.add('01010201','010102','社会');
		d.add('01010202','01010201','社会','${pageContext.request.contextPath}/bookTeacher_findBookAll?btype=1&page=1','','mainFrame');
		d.add('01010203','010102','科学');
		d.add('01010204','01010203','数学','${pageContext.request.contextPath}/bookTeacher_findBookAll?btype=2&page=1','','mainFrame');
		d.add('01010205','01010203','探究','${pageContext.request.contextPath}/bookTeacher_findBookAll?btype=3&page=1','','mainFrame');
		d.add('01010206','010102','艺术');
		d.add('01010207','01010206','美术','${pageContext.request.contextPath}/bookTeacher_findBookAll?btype=4&page=1','','mainFrame');
		d.add('01010208','01010206','音乐','${pageContext.request.contextPath}/bookTeacher_findBookAll?btype=5&page=1','','mainFrame');
		d.add('01010209','010102','健康');
		d.add('01010210','01010209','健康','${pageContext.request.contextPath}/bookTeacher_findBookAll?btype=6&page=1','','mainFrame');
		d.add('01010211','010102','语言');
		d.add('01010212','01010211','语言','${pageContext.request.contextPath}/bookTeacher_findBookAll?btype=7&page=1','','mainFrame');
		
		d.add('010103','0101','绘本主题管理');

		d.add('010114','0101','我的绘本','${pageContext.request.contextPath}/bookTeacher_findSelfAllBook?page=1','','mainFrame');
		
		d.add('0102','01','绘本教案');
		d.add('010201','0102','教案论坛','${pageContext.request.contextPath}/bookTeacher_bookForum','','mainFrame');	
		d.add('010202','0102','我的教案','${pageContext.request.contextPath}/bookTeacher_findSelfNotes','','mainFrame');
		
		d.add('0103','01','学生管理');
		d.add('010301','0103','学生管理','${pageContext.request.contextPath}/studentTeacher_findStudentAll?page=1','','mainFrame');
		
		d.add('0104','01','个人中心');
		d.add('010401','0104','个人信息','${pageContext.request.contextPath}/teacher_info?tid=1','','mainFrame');
		d.add('010402','0104','修改密码','${pageContext.request.contextPath}/teacher_updatePasswordPage','','mainFrame');
		document.write(d);
	</script>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
