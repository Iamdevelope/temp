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
</HEAD>

<body>
	<form id="bookSuperManager_save_do" name="Form1"
		action="${pageContext.request.contextPath }/bookSuperManager_update"
		method="post">
		<input type="hidden" name="bid"
			value="<s:property value="model.bid"/>" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="50%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4" height="26"><strong><STRONG>绘本信息</STRONG>
				</strong></td>
			</tr>

			<tr>
				<td width="30%" align="center" bgColor="#f5fafe">绘本名：</td>
				<td bgColor="#ffffff"><input type="text" name="name"
					value="<s:property value="model.name"/>"
					id="bookSuperManager_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">绘本类型：</td>
				<td bgColor="#ffffff"><select name="book_type">
						<option value="社会"
							<s:if test="model.book_type=='社会'">selected</s:if>>社会</option>
						<option value="语言"
							<s:if test="model.book_type=='语言'">selected</s:if>>语言</option>
						<option value="美术"
							<s:if test="model.book_type=='美术'">selected</s:if>>美术</option>
						<option value="音乐"
							<s:if test="model.book_type=='音乐'">selected</s:if>>音乐</option>
						<option value="健康"
							<s:if test="model.book_type=='健康'">selected</s:if>>健康</option>
						<option value="科学"
							<s:if test="model.book_type=='科学'">selected</s:if>>科学</option>
						<option value="探究"
							<s:if test="model.book_type=='探究'">selected</s:if>>探究</option>
				</select></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">绘本所属班级类型：</td>
				<td bgColor="#ffffff"><select name="book_class">
						<option value="大班"
							<s:if test="model.book_class=='大班'">selected</s:if>>大班</option>
						<option value="中班"
							<s:if test="model.book_class=='中班'">selected</s:if>>中班</option>
						<option value="小班"
							<s:if test="model.book_class=='小班'">selected</s:if>>小班</option>
				</select></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">绘本路径：</td>
				<td bgColor="#ffffff"><input type="text" name="book_path"
					width="30px" value="<s:property value="model.book_path"/>"
					id="bookSuperManager_save_do_logonName" class="bg"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">绘本使用时长：</td>
				<td bgColor="#ffffff"><input type="text" name="book_used_time"
					value="<s:property value="model.book_used_time"/>"
					id="bookSuperManager_save_do_logonName" class="bg"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">绘本主题：</td>
				<td bgColor="#ffffff"><input type="text" name="book_theme"
					value="<s:property value="model.book_theme"/>"
					id="bookSuperManager_save_do_logonName" class="bg" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">是否可以被使用：</td>
				<td bgColor="#ffffff"><select name="isdelete">
						<option value=0 <s:if test="model.isdelete==0">selected</s:if>>可以</option>
						<option value=1 <s:if test="model.isdelete==1">selected</s:if>>不可以</option>
				</select></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">绘本使用次数：</td>
				<td bgColor="#ffffff"><input type="text" name="book_used_count"
					value="<s:property value="model.book_used_count"/>"
					id="bookSuperManager_save_do_logonName" class="bg"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">绘本添加时间：</td>
				<td bgColor="#ffffff"><input type="text" name="addtime"
					value="<s:property value="model.addtime"/>"
					id="bookSuperManager_save_do_logonName" class="bg"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">绘本描述：</td>
				<td bgColor="#ffffff"><textarea id="book_abstract" rows="5"
						cols="60" name="book_abstract" onKeyDown="keypress()"
						onblur="keypress()"><s:property
							value="model.book_abstract" /></textarea> <font color="gray"><label
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
</body>
</HTML>