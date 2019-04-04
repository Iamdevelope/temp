<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet" />

	<style type="text/css">	
.book_context {
	position: fixed;
	left:30%;
	top:30%;
	width: 700px;
	height: 1000px;
}
</style>
</HEAD>

<body>
	<div class="book_context">
		<form id="bookSuperManager_save_do" name="Form1">
			<table cellSpacing="1" cellPadding="5" width="100%" align="center"
				bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26"><strong><STRONG>绘本主题信息</STRONG> </strong></td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">绘本主题：</td>
					<td bgColor="#ffffff"><s:property value="model.theme_name" /></td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">所属班级类型：</td>
					<td bgColor="#ffffff"><s:property value="model.class_type" /></td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">学期：</td>
					<td bgColor="#ffffff"><s:if test="model.term==0">上学期</s:if>
					<s:else>下学期</s:else>
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">描述：</td>
					<td bgColor="#ffffff" style="align: left;"><textarea rows="5"
							cols="60" name="book_type" readonly="readonly"><s:property
								value="model.theme_description" /></textarea></td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<INPUT style="position: center;" type="hidden"
						class="button_cancel" /> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" /> <span
						id="Label1"></span></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</HTML>