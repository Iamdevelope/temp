<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript">
	function keypress(){
		var text1=document.getElementById("book_abstract").value;
		var len;
		if(text1.length>=300){
			document.getElementById("book_abstract").value=text1.substr(0,300);
			len=0;
		}
		else{
			len=300-text1.length;
		}
		var show="你还可以输入"+len+"个汉字";
		document.getElementById("abstract").innerText=show;
	}
</script>
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
	<form id="bookSuperManager_save_do" name="Form1"
		action="${pageContext.request.contextPath }/bookThemeSuperManager_update"
		method="post">
		<input type="hidden" name="idbooktheme"
			value="<s:property value="model.idbooktheme"/>" />
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4" height="26"><strong><STRONG>编辑主题信息</STRONG>
				</strong></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">绘本主题名：</td>
				<td bgColor="#ffffff"><input type="text" name="theme_name"
					value="<s:property value="model.theme_name"/>"
					id="bookSuperManager_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">所属班级类型：</td>
				<td bgColor="#ffffff">
					<select name="class_type">
						<option value="大班" <s:if test="model.class_type=='大班'">selected</s:if>>大班</option>
						<option value="中班" <s:if test="model.class_type=='中班'">selected</s:if>>中班</option>
						<option value="小班" <s:if test="model.class_type=='小班'">selected</s:if>>小班</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">学期：</td>
				<td bgColor="#ffffff">
					<select name="term">
						<option value="上学期" <s:if test="model.term=='上学期'">selected</s:if>>上学期</option>
						<option value="下学期" <s:if test="model.term=='下学期'">selected</s:if>>下学期</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">描述：</td>
				<td bgColor="#ffffff"><textarea id="book_abstract" rows="5"
						cols="60" name="theme_description" onKeyDown="keypress()"
						onblur="keypress()"><s:property
							value="model.theme_description" /></textarea> <font color="gray"><label
						id="abstract"></label></font>
				</td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="managerSuperManager_save_do_submit"
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
	</div>
</body>
</HTML>