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

			function check_data(){
				var code=document.getElementById("computer_code").value;
				var dean_name=document.getElementById("dean_name").value;
				console.log("当前正在修改软件注册码");
				if(code==null||code==""){
					alert("软件注册码不能为空");
					return false;
				}
				// 1.创建异步交互对象
				var xhr = createXmlHttp();
				// 2.设置监听
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4){
						if(xhr.status == 200){
							alert(xhr.responseText);
							location.reload(true);
						}
					}
				}
				// 3.打开连接
				xhr.open("GET","${pageContext.request.contextPath}/softwareCode_updateCode?computer_code="+code+"&deanName="+dean_name,true);
				// 4.发送
				xhr.send(null);
				//window.location.href="${pageContext.request.contextPath}/softwareCode_generateCode?computer_code="+code+"&deanName="+dean_name;
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
	<form id="bookSuperManager_save_do" name="Form1"
		action="${pageContext.request.contextPath }/softwareCode_update"
		method="post">
		<table cellSpacing="1" cellPadding="5" width="50%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4" height="26"><strong><STRONG>绘本信息</STRONG>
				</strong></td>
			</tr>

			<tr>
				<td width="30%" align="center" bgColor="#f5fafe">院长姓名：</td>
				<td bgColor="#ffffff"><input type="text" name="name"
					value="<s:property value="model.dean.getName()"/>"
					id="dean_name" class="bg" readonly="readonly" /></td>
			</tr>
			<tr>
				<td width="30%" align="center" bgColor="#f5fafe">计算机码：</td>
				<td bgColor="#ffffff"><input type="text" name="computerCode"
					value="<s:property value="model.computerCode"/>"
					id="computer_code" class="bg" /></td>
			</tr>
			<tr>
				<td width="30%" align="center" bgColor="#f5fafe">软件注册码：</td>
				<td bgColor="#ffffff"><input type="text" name="softwareCode"
					value="<s:property value="model.softwareCode"/>"
					id="softwate_code" class="bg" style="width:300px;" readonly="readonly" /></td>
			</tr>
			<tr>
				<td width="30%" align="center" bgColor="#f5fafe">是否激活：</td>
				<td bgColor="#ffffff"><input type="text" name="used"
					value="<s:property value="model.softwareCode"/>"
					id="softwate_code" class="bg" style="width:300px;" readonly="readonly" /></td>
			</tr>
			<tr>
				<td width="30%" align="center" bgColor="#f5fafe">有效期：</td>
				<td bgColor="#ffffff"><input type="text" name="time"
					value="<s:property value="model.time"/>"
					id="softwate_code" class="bg" style="width:300px;" readonly="readonly" /></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="button" id="submit"
						value="确定" onclick="check_data()" class="button_ok">生成注册码</button> <FONT
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