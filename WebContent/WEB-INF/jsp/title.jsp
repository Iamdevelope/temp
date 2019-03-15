<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="${pageContext.request.contextPath }/images/favicon.ico"
	rel="shortcut icon">
<link href="${pageContext.request.contextPath }/css/mylogin.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/mycommon.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.base64.js"></script>
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
				var checked = $("input[type='checkbox']").is(':checked');//获取是否需要记住账号
				if(checked){
					setCookies();
				}else{
					clearAllCookies();
				}
			}
			function change(){
				var img1 = document.getElementById("checkImg");
				img1.src="${pageContext.request.contextPath}/checkImg?"+new Date().getTime();
			}
			//设置浏览器cookie
			function setCookies(){
				var username=document.getElementById("name").value;
				var password = document.getElementById("password").value;
				var checked = $("input[type='checkbox']").is(':checked');//获取是否需要记住账号
				if(checked){
					var date=new Date();
					date.setTime(date.getTime+60*1000);
					$.cookie("username",username,{expires:date,path:'/'});
					$.cookie("aaa",$.base64.encode(password),{expires:date,path:'/'});
				}else{
					$.cookie("login_code",null);
					$.cookie("login_code",null);
				}
			}
			function getCookies(){
				var username = $.cookie("username");
				var password = $.cookie("aaa");
				if(!username||username==0){
					
				}else{
					$("#name").val(username);
				}
				if(!password||password==0){
				}else{
					$("#password").val($.base64.decode(password));
					$("[name='checkbox']").attr("checked",true);
				}
			}
			function clearAllCookies(){
				var date = new Date();
				date.setTime(date.getTime()-10000);
				var keys = document.cookie.match(/[^ =;]+(?=\=)/g);
				if(keys){
					for(var i=keys.length;i--;){
						document.cookie = keys[i]+"=0;expire="+date.toGMTString()+"; path=/";
					}
				}
			}
		</script>
</head>
</html>