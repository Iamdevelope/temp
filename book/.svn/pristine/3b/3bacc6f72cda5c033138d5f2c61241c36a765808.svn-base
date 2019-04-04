<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>绘本后台管理系统</title>
<%@include file="title.jsp"%>
<%-- <link href="${pageContext.request.contextPath }/images/ad.gif" rel="shortcut icon">
		<link href="${pageContext.request.contextPath }/css/mylogin.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath }/css/mycommon.css" rel="stylesheet" type="text/css"/>
		<script>
			function userCheck(){
				var username=document.getElementById("name").value;
				if(username==""||username==null){
					alert("登录失败：用户名不能为空！");
					return false;
				}
				var password = document.getElementById("password").value;
				if(password==""||password==null){
					alert=("登录失败：密码不能为空！");
					return false;
				}
			}
			function change(){
				var img1 = document.getElementById("checkImg");
				img1.src="${pageContext.request.contextPath}/checkImg?"+new Date().getTime();
			}
		</script> --%>
</head>

<body onload="getCookies();">
	<div class="container login">
		<%-- <div class="span12">
			<div class="ad">
				<img src="${pageContext.request.contextPath }/images/indexBG.jpg" height="800" width="1060" alt="果拉文化" title="果拉文化" />
			</div>
		</div> --%>
		<div class="span12 last">
			<div class="wrap">
				<dir class="main">
					<div class="title">
						<strong>教师登录</strong>TEACHER LOGIN
					</div>
					<div>
						<span style="color: red;"><s:actionerror /></span>
					</div>
					<form id="loginForm"
						action="${pageContext.request.contextPath }/teacher_login"
						method="post" novalidate="novalidate"
						onsubmit="return userCheck();">
						<table>
							<tbody>
								<tr>
									<th>用户名：</th>
									<td><input type="text" id="name" name="name" class="text"
										maxlength="20"></td>
								</tr>
								<tr>
									<th>密&nbsp;&nbsp;码：</th>
									<td><input type="password" id="password" name="password"
										class="text" maxlength="20" autocomplete="off"></td>
								</tr>
								<tr>
									<th><span style="color: red">*</span>验证码:</th>
									<td><span class="fieldSet"> <input type="text"
											id="checkcode" name="checkcode" class="text captcha"
											maxlength="4" autocomplete="off"><img id="checkImg"
												class="captchaImage"
												src="${pageContext.request.contextPath}/checkImg"
												onclick="change()" title="点击更换验证码"></span></td>
								</tr>
								<tr>
									<th>记住密码</th>
									<td><span> <input
											style="height: 20px; width: 20px;" type="checkbox"
											id="checkbox" name="checkbox"></span></td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit"
										onclick="return userCheck()" value="登录"></td>
								</tr>
							</tbody>
						</table>
					</form>
				</dir>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
