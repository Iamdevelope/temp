<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>绘本后台管理系统</title>
<%@include file="title.jsp"%>
</head>

<body onload="getCookies();">
	<div class="container login">
		<div class="span12 last">
			<div class="wrap">
				<dir class="main">
					<div class="title">
						<strong>用户登录</strong>USER LOGIN
					</div>
					<div>
						<span style="color: red;"><s:actionerror /></span>
					</div>
					<form id="loginForm" action="${pageContext.request.contextPath }/user_login" method="post" novalidate="novalidate">
						<table>
							<tbody>
								<tr>
									<th><font color="white">用户名：</font></th>
									<td><input type="text" id="name" name="name" class="text"
										maxlength="20"/></td>
								</tr>
								<tr>
									<th><font color="white">密&nbsp;&nbsp;码：</font></th>
									<td><input type="password" id="password" name="password"
										class="text" maxlength="20" autocomplete="off"/></td>
								</tr>
								<tr>
									<th>
										<font color="white">验证码：</font>
									</th>
									<td><span class="fieldSet"> <input type="text"
											id="checkcode" name="checkcode" class="text captcha"
											maxlength="4" autocomplete="off"/><img id="checkImg"
												class="captchaImage"
												src="${pageContext.request.contextPath}/checkImg"
												onclick="change()" title="点击更换验证码"/></span></td>
								</tr>
								<tr>
									<th><font color="white">记住密码：</font></th>
									<td><span> <input
											style="height: 20px; width: 20px;" type="checkbox"
											id="checkbox" name="checkbox"/>
										</span>
										<span class="STYLE11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="white">园长</font> <label>
										<input style="height: 20px; width: 20px;" type="radio" name="identity" value="dean"
											checked />
										</label> &nbsp;&nbsp; <font color="white">教师</font> <label>
											<input style="height: 20px; width: 20px;" type="radio" name="identity" value="teacher" />
										</label>
										</span>
									</td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit"
										onclick="return userCheck()" value="登录"/></td>
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
