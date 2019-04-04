<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
</HEAD>

<body>
	<form id="managerSuperManager_save_do" name="Form1"
		action="${pageContext.request.contextPath}/deanSuperManager_update"
		method="post">
		<input type="hidden" name="did"
			value="<s:property value="model.did"/>" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="50%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>园长用户信息</STRONG> </strong></td>
			</tr>

			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					用户名：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.username" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					密码：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.password" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					姓名：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.name" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					性别：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.sex" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					邮箱：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.email" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					联系方式：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.phone_number" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					是否有效：</td>
				<td class="ta_01" bgColor="#ffffff"><s:if
						test="model.isdelete==0">
							是
						</s:if> <s:else>
							否
						</s:else></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					所在学校：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.school" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					上级：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.manager.getName()" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					可添加教师数量：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.can_regist_count" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					已添加的教师数量：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.registed_count" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					登录次数：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.login_count" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					最后一次登录时间：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.last_login_time" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					注册时间：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.create_time" /></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4"><FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<INPUT class="button_ok" type="button"
					onclick="history.go(-1)" value="返回" /> <span id="Label1"></span></td>
			</tr>
		</table>
	</form>
</body>
</HTML>