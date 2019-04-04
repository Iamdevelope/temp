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
	<form id="teacherSuperManager_save_do" name="Form1"
		action="${pageContext.request.contextPath}/teacherSuperManager_update"
		method="post">
		<input type="hidden" name="tid"
			value="<s:property value="model.tid"/>" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="50%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>编辑教师用户</STRONG> </strong></td>
			</tr>

			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					用户名称：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="username" value="<s:property value="model.username"/>"
					id="teacherSuperManager_save_do_logonName" class="bg" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					密码：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="password" value="<s:property value="model.password"/>"
					id="teacherSuperManager_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					真实姓名：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="name" value="<s:property value="model.name"/>"
					id="teacherSuperManager_save_do_logonName" class="bg" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					邮箱：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="email" value="<s:property value="model.email"/>"
					id="teacherSuperManager_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					性别：</td>
				<td bgColor="#ffffff" class="ta_01"><select name="sex">
						<option value="0" <s:if test="model.sex==0">selected</s:if>>男</option>
						<option value="1" <s:if test="model.sex==1">selected</s:if>>女</option>
				</select></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					注册时间：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="create_time" value="<s:property value="model.create_time"/>"
					id="deanSuperManager_save_do_logonName" class="bg"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					学校：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="school" value="<s:property value="model.school"/>"
					id="deanSuperManager_save_do_logonName" class="bg" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					所教班级：</td>
				<td class="ta_01" bgColor="#ffffff"><select name="class_type">
						<option value="大班"
							<s:if test="model.class_type=='大班'">selected</s:if>>大班</option>
						<option value="中班"
							<s:if test="model.class_type=='中班'">selected</s:if>>中班</option>
						<option value="小班"
							<s:if test="model.class_type=='小班'">selected</s:if>>小班</option>
				</select></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					上课时长：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="class_time" value="<s:property value="model.class_time"/>"
					id="deanSuperManager_save_do_logonName" class="bg"
					readonly="readonly" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					电话：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="phone_number" value="<s:property value="model.phone_number"/>"
					id="teacherSuperManager_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					是否有效：</td>
				<td class="ta_01" bgColor="#ffffff"><select name="isdelete">
						<option value="1" <s:if test="model.isdelete==0">selected</s:if>>是</option>
						<option value="0" <s:if test="model.isdelete==1">selected</s:if>>否</option>
				</select></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					地区：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="area" value="<s:property value="model.area"/>"
					id="deanSuperManager_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					注册人：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="dean.getName()" value="<s:property value="model.dean.getName()"/>"
					id="deanSuperManager_save_do_logonName" class="bg"
					readonly="readonly" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					最近登录时间：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="last_login_time"
					value="<s:property value="model.last_login_time"/>"
					id="deanSuperManager_save_do_logonName" class="bg"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					登录次数：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="login_count" value="<s:property value="model.login_count"/>"
					id="deanSuperManager_save_do_logonName" class="bg"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="teacherSuperManager_save_do_submit"
						value="确定" class="button_ok">&#30830;&#23450;</button> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <INPUT
					class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"></span>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>