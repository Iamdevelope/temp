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
	<form name="Form1">
		<input type="hidden" name="mid"
			value="<s:property value="model.mid"/>" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="50%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>学生信息</STRONG> </strong></td>
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
				<td class="ta_01" bgColor="#ffffff"><s:if test="model.sex==0">男</s:if>
					<s:else>女</s:else></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					父亲姓名：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.father_name" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					父亲电话：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.father_number" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					母亲姓名：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.mother_name" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					母亲电话：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.mother_number" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					所在学校：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.school" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					班级：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.class_type" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					班主任：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.teachr.getName()" /></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					注册时间：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.create_time" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					学生状态：</td>
				<td class="ta_01" bgColor="#ffffff"><s:if test="model.state==0">
							在读
						</s:if> <s:else>
							离校
						</s:else></td>
				
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					出生日期：</td>
				<td class="ta_01" bgColor="#ffffff"><s:property
						value="model.birthday" /></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4"><FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<INPUT style="position: center;" type="button" class="button_ok"
					onclick="history.go(-1)" value="返回" /> <span id="Label1"></span></td>
			</tr>
		</table>
	</form>
</body>
</HTML>