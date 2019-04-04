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
	<form id="manager_edit_do" name="Form1"
		action="${pageContext.request.contextPath}/manager_edit"
		method="post">
		<input type="hidden" name="mid"
			value="<s:property value="model.mid"/>" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="50%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>编辑管理员用户</STRONG> </strong></td>
			</tr>

			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					姓名：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="name" value="<s:property value="model.name"/>"
					id="manager_edit_do_logonName" class="bg" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					用户名：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="username" value="<s:property value="model.username"/>"
					id="manager_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					联系方式：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="phone_number"
					value="<s:property value="model.phone_number"/>"
					id="manager_save_do_logonName" class="bg" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					邮箱：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="email" value="<s:property value="model.email"/>"
					id="manager_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					所属管理类型：</td>
				<td class="ta_01" bgColor="#ffffff"><select name="power">
						<option value="社会" <s:if test="model.power=='社会'">selected</s:if>>社会</option>
						<option value="语言" <s:if test="model.power=='语言'">selected</s:if>>语言</option>
						<option value="美术" <s:if test="model.power=='美术'">selected</s:if>>美术</option>
						<option value="音乐" <s:if test="model.power=='音乐'">selected</s:if>>音乐</option>
						<option value="健康" <s:if test="model.power=='健康'">selected</s:if>>健康</option>
						<option value="科学" <s:if test="model.power=='科学'">selected</s:if>>科学</option>
						<option value="探究" <s:if test="model.power=='探究'">selected</s:if>>探究</option>
				</select></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					性别：</td>
				<td class="ta_01" bgColor="#ffffff"><select name="sex">
						<option value=0 <s:if test="model.sex==0">selected</s:if>>男</option>
						<option value=1 <s:if test="model.sex==1">selected</s:if>>女</option>
				</select></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					注册时间：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="create_time" value="<s:property value="model.create_time"/>"
					id="manager_save_do_logonName" class="bg" readonly="readonly" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					登录次数：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="login_count" value="<s:property value="model.login_count"/>"
					id="manager_save_do_logonName" class="bg" readonly="readonly" /></td>
			</tr>
			<tr>

				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					最近登录时间：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="last_login_time"
					value="<s:property value="model.last_login_time"/>"
					id="manager_save_do_logonName" class="bg" readonly="readonly" /></td>
			</tr>

			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="manager_edit_do_submit" value="确定"
						class="button_ok">&#30830;&#23450;</button> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>