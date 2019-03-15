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
	<!--  -->
	<form id="teacher_save_do" name="Form1"
		action="${pageContext.request.contextPath}/teacher_regist"
		method="post" enctype="multipart/form-data">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="50%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>添加教师</STRONG> </strong></td>
			</tr>
			<p style="height: 4px; padding-left: 10px;">
				注：标有<span style="color: red;">*</span>号的内容为必填项
			</p>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>姓名：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="name" value="" id="teacher_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>密码：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="password" value="000000" id="teacher_save_do_logonName"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>性别：
				</td>
				<td class="ta_01" bgColor="#ffffff"><select name="sex">
						<option value=0>男</option>
						<option value=1>女</option>
				</select></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>手机号码：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="phone_number" value="" id="teacher_save_do_logonName"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>学校：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="school" value="" id="teacher_save_do_logonName" class="bg" />
				</td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>班级：
				</td>
				<td class="ta_01" bgColor="#ffffff"><select name="class_type">
						<option value="大班">大班</option>
						<option value="中班">中班</option>
						<option value="小班">小班</option>
				</select></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					邮箱：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="email" value="" id="teacher_save_do_logonName" class="bg" />
				</td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="teacher_save_do_submit" value="确定"
						class="button_ok">&#30830;&#23450;</button> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
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