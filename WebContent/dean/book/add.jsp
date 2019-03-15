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
				if(text1.length>=30){
					document.getElementById("book_abstract").value=text1.substr(0,30);
					len=0;
				}
				else{
					len=30-text1.length;
				}
				var show="你还可以输入"+len+"个汉字";
				document.getElementById("abstract").innerText=show;
			}
		</script>
</HEAD>

<body>
	<!--  -->
	<form id="teacher_save_do" name="Form1"
		action="${pageContext.request.contextPath}/bookSuperManager_save"
		method="post" enctype="multipart/form-data">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>添加绘本</STRONG> </strong></td>
			</tr>
			<p style="height: 4px; padding-left: 10px;">
				注：标有<span style="color: red;">*</span>号的内容为必填项
			</p>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本名：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="name" value="" id="bookSuperManager_save_do_logonName"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本类型：
				</td>
				<td class="ta_01" bgColor="#ffffff"><select name="book_type">
						<option value="社会">社会</option>
						<option value="语言">语言</option>
						<option value="美术">美术</option>
						<option value="音乐">音乐</option>
						<option value="健康">健康</option>
						<option value="科学">科学</option>
						<option value="探究">探究</option>
				</select></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本所属班级类型：
				</td>
				<td class="ta_01" bgColor="#ffffff"><select name="book_class">
						<option value="大班">大班</option>
						<option value="中班">中班</option>
						<option value="小班">小班</option>
				</select></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本主题：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="book_theme" value="" id="bookSuperManager_save_do_logonName"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本路径：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="book_path" value="" id="bookSuperManager_save_do_logonName"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					绘本描述：</td>
				<td class="ta_01" bgColor="#ffffff"><textarea
						id="book_abstract" rows="5" cols="30" name="book_abstract"
						onKeyDown="keypress()" onblur="keypress()"><s:property
							value="model.book_abstract" /></textarea> <font color="gray"><label
						id="abstract"></label>你还可以输入30个汉字</font></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="bookSuperManager_save_do_submit"
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