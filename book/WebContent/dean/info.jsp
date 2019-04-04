<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript">
			function updatePasswordPage(){
				window.location.href="${pageContext.request.contextPath}/dean_updatePasswordPage";
			}
			function edit(){
				window.location.href="${pageContext.request.contextPath}/dean_editPage";
			}
		</script>
</HEAD>

<body>
	<form id="superManager_save_do" name="Form1">
		<input type="hidden" id="aid" name="did"
			value="<s:property value="#session.existAdmin.did"/>" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="50%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>院长用户信息</STRONG> </strong></td>
			</tr>

			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					姓名：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="#session.existAdmin.name" /></td>
			</tr>

			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					联系方式：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="#session.existAdmin.phone_number" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					邮箱：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="#session.existAdmin.email" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					性别：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:if test="#session.existAdmin.sex==0">
					 	男
					</s:if><s:else>
						女
					</s:else>
				</td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					学校：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="#session.existAdmin.school" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					创建时间：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="#session.existAdmin.create_time" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					最后一次登录时间：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="#session.existAdmin.last_login_time" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					登录次数：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="#session.existAdmin.login_count" /></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4"><input type="button" class="button_ok"
					onclick="edit()" value="修改信息" /> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<INPUT type="button" class="button_ok"
					onclick="history.go(-1)" value="返回" /> <span id="Label1"></span></td>
			</tr>
		</table>
	</form>
</body>
</HTML>