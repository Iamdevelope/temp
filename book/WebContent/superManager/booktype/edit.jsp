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
	<div align="center" class="book_context">
	<form id="bookSuperManager_save_do" name="Form1"
		action="${pageContext.request.contextPath }/bookTypeSuperManager_update"
		method="post">
		<input type="hidden" name="idbooktype"
			value="<s:property value="model.idbooktype"/>" />
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4" height="26"><strong><STRONG>绘本信息</STRONG>
				</strong></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe">绘本类型名：</td>
				<td bgColor="#ffffff"><input type="text" name="book_type_name"
					value="<s:property value="model.book_type_name"/>"
					id="bookSuperManager_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">描述：</td>
				<td bgColor="#ffffff"><textarea id="book_abstract" rows="5"
						cols="60" name="description" onKeyDown="keypress()"
						onblur="keypress()"><s:property
							value="model.description" /></textarea> <font color="gray"><label
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