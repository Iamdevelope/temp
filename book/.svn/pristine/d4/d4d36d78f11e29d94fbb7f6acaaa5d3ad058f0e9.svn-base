<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript">
			function okBtn(){
				var oldpassword = document.getElementById("oldpassword").value;
				if(oldpassword==null||oldpassword==""){
					alert("密码不能为空！");
					return false;
				}
				var password = document.getElementById("password").value;
				var repassword = document.getElementById("repassword").value;
				if(password==null||password==""){
					alert("新密码不能为空！");
					return false;
				}
				if(password!=repassword){
					alert("两次输入的密码不一致！");
					return false;
				}
				// 1.创建异步交互对象
				var xhr = createXmlHttp();
				// 2.设置监听
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4){
						if(xhr.status == 200){
							alert(xhr.responseText);
						}
					}
				}
				// 3.打开连接
				xhr.open("GET","${pageContext.request.contextPath}/manager_updatePassword?pwd="+oldpassword+"&newpwd="+password,true);
				// 4.发送
				xhr.send(null);
				//window.location.href="${pageContext.request.contextPath}/superManager_updatePassword?pwd="+oldpassword+"&newpwd="+password;
			}
			function createXmlHttp(){
				var xmlHttp;
				try{ // Firefox, Opera 8.0+, Safari
				      xmlHttp=new XMLHttpRequest();
				}
				catch (e){
					try{// Internet Explorer
						xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
					}
					catch (e){
					    try{
					         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
					      }
					    catch (e){}
					}
				}
				return xmlHttp;
			}
		</script>
</HEAD>

<body>
	<form id="teacher_edit_do" name="Form1">
		<input type="hidden" name="mid"
			value="<s:property value="model.mid"/>" />
		<table cellSpacing="1" cellPadding="5" width="50%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26">
					<h3>修改密码</h3>
				</td>
			</tr>

			<tr>
				<td width="50%" align="center" bgColor="#f5fafe">旧密码：</td>
				<td bgColor="#ffffff"><input type="password" name="oldpassword"
					id="oldpassword" class="bg" /> <span id="span1"></span></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe">新密码：</td>
				<td bgColor="#ffffff"><input type="password" name="password"
					id="password" class="bg" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe">确认密码：</td>
				<td bgColor="#ffffff"><input type="password" name="repassword"
					id="repassword" class="bg" /></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="button" id="teacher_edit_do_submit" value="确定"
						class="button_ok" onclick="okBtn()">&#30830;&#23450;</button> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>