<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath }/images/favicon.ico"
	rel="shortcut icon">
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
						d.add('0103','01','园长管理');
						d.add('010301','0103','园长管理','${pageContext.request.contextPath}/deanSuperManager_findDeanAll?page=1','','mainFrame');
						
						d.add('0104','01','绘本管理');
						d.add('010401','0104','绘本管理');
						d.add('01040101','010401','社会');
						d.add('0104010101','01040101','社会','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=1&page=1','','mainFrame');
						d.add('01040102','010401','科学');
						d.add('0104010201','01040102','数学','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=2&page=1','','mainFrame');
						d.add('0104010202','01040102','探究','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=3&page=1','','mainFrame');
						d.add('01040103','010401','艺术');
						d.add('0104010301','01040103','美术','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=4&page=1','','mainFrame');
						d.add('0104010302','01040103','音乐','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=5&page=1','','mainFrame');
						d.add('01040104','010401','健康');
						d.add('0104010401','01040104','健康','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=6&page=1','','mainFrame');
						d.add('01040105','010401','语言');
						d.add('0104010501','01040105','语言','${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype=7&page=1','','mainFrame');
						
						d.add('010402','0104','教案管理');
						d.add('01040201','010402','社会');
						d.add('0104020101','01040201','社会','${pageContext.request.contextPath}/teachingPlan_findTeachingPlans?btype=1&page=1','','mainFrame');
						d.add('01040202','010402','科学');
						d.add('0104020201','01040202','数学','${pageContext.request.contextPath}/teachingPlan_findTeachingPlans?btype=2&page=1','','mainFrame');
						d.add('0104020202','01040202','探究','${pageContext.request.contextPath}/teachingPlan_findTeachingPlans?btype=3&page=1','','mainFrame');
						d.add('01040203','010402','艺术');
						d.add('0104020301','01040203','美术','${pageContext.request.contextPath}/teachingPlan_findTeachingPlans?btype=4&page=1','','mainFrame');
						d.add('0104020302','01040203','音乐','${pageContext.request.contextPath}/teachingPlan_findTeachingPlans?btype=5&page=1','','mainFrame');
						d.add('01040204','010402','健康');
						d.add('0104020401','01040204','健康','${pageContext.request.contextPath}/teachingPlan_findTeachingPlans?btype=6&page=1','','mainFrame');
						d.add('01040205','010402','健康');
						d.add('0104020501','01040205','语言','${pageContext.request.contextPath}/teachingPlan_findTeachingPlans?btype=7&page=1','','mainFrame');
						
						d.add('010403','0104','绘本主题');
						d.add('01040301','010403','大班','${pageContext.request.contextPath}/bookThemeSuperManager_booktheme?page=1&classType=大班','','mainFrame');
						d.add('01040302','010403','中班','${pageContext.request.contextPath}/bookThemeSuperManager_booktheme?page=1&classType=中班','','mainFrame');
						d.add('01040303','010403','小班','${pageContext.request.contextPath}/bookThemeSuperManager_booktheme?page=1&classType=小班','','mainFrame');
						d.add('010404','0104','绘本类型');
						d.add('01040401','010404','绘本类型','${pageContext.request.contextPath}/bookTypeSuperManager_booktype?page=1','','mainFrame');
						
						d.add('0105','01','学生管理');
						d.add('010501','0105','学生管理','${pageContext.request.contextPath}/studentSuperManager_findStudentAll?select=0&page=1','','mainFrame');
						
						d.add('0106','01','软件管理');
						d.add('010601','0106','注册码管理','${pageContext.request.contextPath}/softwareCode_findAllCode?page=1','','mainFrame');
						
						d.add('0107','01','个人中心');
						d.add('010701','0107','个人信息','${pageContext.request.contextPath}/superManager_info?aid=1','','mainFrame');
						d.add('010702','0107','修改密码','${pageContext.request.contextPath}/superManager_updatePasswordPage','','mainFrame');
						document.write(d);
					</script>
				</div>
			</td>
		</tr>
	</table>
	
</body>
</html>
