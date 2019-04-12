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
		
		d.add('010202','0102','绘本类型');
		d.add('01020201','010202','社会');
		d.add('01020202','01020201','社会','${pageContext.request.contextPath}/bookDean_findBookAll?btype=1&page=1','','mainFrame');
		d.add('01020203','010202','科学');
		d.add('01020204','01020203','数学','${pageContext.request.contextPath}/bookDean_findBookAll?btype=2&page=1','','mainFrame');
		d.add('01020205','01020203','探究','${pageContext.request.contextPath}/bookDean_findBookAll?btype=3&page=1','','mainFrame');
		d.add('01020206','010202','艺术');
		d.add('01020207','01020206','美术','${pageContext.request.contextPath}/bookDean_findBookAll?btype=4&page=1','','mainFrame');
		d.add('01020208','01020206','音乐','${pageContext.request.contextPath}/bookDean_findBookAll?btype=5&page=1','','mainFrame');
		d.add('01020209','010202','健康');
		d.add('01020210','01020209','健康','${pageContext.request.contextPath}/bookDean_findBookAll?btype=6&page=1','','mainFrame');
		d.add('01020211','010202','语言');
		d.add('01020212','01020211','语言','${pageContext.request.contextPath}/bookDean_findBookAll?btype=7&page=1','','mainFrame');
		
		d.add('010203','0102','绘本教案');
		d.add('01020301','010203','社会');
		d.add('01020302','01020301','社会','${pageContext.request.contextPath}/userTeachingPlan_findTeachingPlans?btype=1&page=1','','mainFrame');
		d.add('01020303','010203','科学');
		d.add('01020304','01020303','数学','${pageContext.request.contextPath}/userTeachingPlan_findTeachingPlans?btype=2&page=1','','mainFrame');
		d.add('01020305','01020303','探究','${pageContext.request.contextPath}/userTeachingPlan_findTeachingPlans?btype=3&page=1','','mainFrame');
		d.add('01020306','010203','艺术');
		d.add('01020307','01020306','美术','${pageContext.request.contextPath}/userTeachingPlan_findTeachingPlans?btype=4&page=1','','mainFrame');
		d.add('01020308','01020306','音乐','${pageContext.request.contextPath}/userTeachingPlan_findTeachingPlans?btype=5&page=1','','mainFrame');
		d.add('01020309','010203','健康');
		d.add('01020310','01020309','健康','${pageContext.request.contextPath}/userTeachingPlan_findTeachingPlans?btype=6&page=1','','mainFrame');
		d.add('01020311','010203','语言');
		d.add('01020312','01020311','语言','${pageContext.request.contextPath}/userTeachingPlan_findTeachingPlans?btype=7&page=1','','mainFrame');

		
		d.add('0103','01','学生管理');
		d.add('010301','0103','学生管理','${pageContext.request.contextPath}/studentDean_findStudentAll?page=1','','mainFrame');
		
		d.add('0104','01','激活码');
		d.add('010401','0104','我的激活码','${pageContext.request.contextPath}/softwareCodeDean_myCode?page=1','','mainFrame');
		
		d.add('0105','01','个人中心');
		d.add('010501','0105','个人信息','${pageContext.request.contextPath}/dean_info?aid=1','','mainFrame');
		d.add('010502','0105','修改密码','${pageContext.request.contextPath}/dean_updatePasswordPage','','mainFrame');
		document.write(d);
	</script>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
