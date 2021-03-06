<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath }/images/favicon.ico"
	rel="shortcut icon">
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/Style1.css"
	rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<script type="text/javascript" src="js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.2.6/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.2.6/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="css/excel.css" />
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/jquery.uploadify.v2.1.0.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/commons.js"></script>
	<link rel="stylesheet" type="text/css" href="css/uploadify.css"   />
	<script type="text/javascript" src="js/swfobject.js"></script>
	<script type="text/javascript" src="js/jquery.uploadify.v2.1.0.min.js"></script>
	<script type="text/javascript" src="js/excel.js"></script>
<style type="text/css">
h2 {
	border-top: solid cornflowerblue 1px;
	border-left: solid cornflowerblue 1px;
	width: 50px;
	height: 25px;
	margin: 0;
	float: left;
	text-align: center;
}

.tab-content {
	border: solid cornflowerblue 1px;
	width: 152px;
	height: 100px;
}

.tab-content div {
	display: none;
}

.selected {
	background-color: cornflowerblue;
}

.tab-content .show {
	display: block;
}
ul{
	margin:0;
	padding:0;
	backgroung-color:#DAE6FF;
}
.classType{
	font-size:16px;
}
.classType li{
	list-style: none;
	float:left;
	background-color:#DAE6FF;
	font-size:16px;
	border: 1px solid #8AA2CC;
	padding:2px 40px 2px 40px;
	cursor:pointer;
}
li:hover,li:active{
	background-color:#1E6BAE;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#md').menubutton({
		menu:'#mm'
	});
	$('#addPage').on('click',function(){
		$('#addModel').dialog('open');
	});
	$('input#selectBtn').on('click',function(){
		var select=$('input#select').val();
		var reg=/[`~!@#$%^&*()_+<>?:"{},.\/;'[\]]/;
		if(reg.test(select)){
			$.messager.alert('提示信息','关键字中存在非法字符');
			return;
		}
		if(select==null||select=="院长名"){
			$.messager.alert('提示信息','请输入关键字');
			return;
		}
		window.location.href="${pageContext.request.contextPath}/softwareCode_findCodeByDid?page=1&deanName="+select;
	});
});


function check_data(){
	var code=document.getElementById("computer_code").value;
	var dean_name=document.getElementById("dean_name").value;
	if(code==null||code==""){
		alert("软件注册码不能为空");
		return false;
	}
	else if(dean_name==null||dean_name==""){
		alert("院长姓名不能为空");
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
	xhr.open("GET","${pageContext.request.contextPath}/softwareCode_generateCode?computer_code="+code+"&deanName="+dean_name,true);
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
<title>软件注册码列表</title>
</head>
<body>
<div>
	<form id="Form1" name="Form1">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<div class="excelBtn">
							<a class="exportId icon-add" id="md" style="padding-left:20px;" href="javascript:void(0)" title="新增软件注册码数据" iconCls="icon-add" >新增数据</a>
						</div>
						<strong>软件注册码列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01"><span>关键词：</span><input type="text" id="select" name="select"
						value="院长名"
						onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
						onBlur="if(!value){value=defaultValue;this.style.color='#999'}"
						style="color: #999999"></input> <input type="button" class="button_search"
						id="selectBtn" title="搜索"  />
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="2%">编号</td>
								<td align="center" width="17%">软件注册码</td>
								<td align="center" width="8%">用户计算机码</td>
								<td width="8%" align="center">所属用户</td>
								<td width="8%" align="center">是否激活</td>
								<td width="8%" align="center">有效期</td>
								<td width="8%" align="center">编辑</td>
							</tr>
							<c:if test="${pageBean.list.size()>0 }">
							
								<c:forEach var="b" items="${pageBean.list}">
									<tr onmouseover="this.style.backgroundColor = 'white'"
										onmouseout="this.style.backgroundColor = '#F5FAFE';">
	
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="2%">${b.softwareId}</td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="17%"><a
											href="${pageContext.request.contextPath }/softwareCode_info?softwareid=${b.softwareId }">
												${b.softwareCode }
										</a></td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="8%">
											${b.computerCode }
											</td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="8%">
											${b.dean.getName()}
										</td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="8%">
											<c:if test="${b.used==0 }">未激活</c:if>
											<c:if test="${b.used==1 }">已激活</c:if>
										</td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="8%">
											${b.time }
										</td>
											
										<td align="center" style="HEIGHT: 30px"><a
											href="${ pageContext.request.contextPath }/softwareCode_edit?softwareid=${b.softwareId }">
												<img
												src="${pageContext.request.contextPath}/images/i_edit.gif"
												border="0" style="CURSOR: hand" title="编辑">
										</a></td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</td>
				</tr>
				<tr align="center">
					<td colspan="7"><s:if test="pageBean.totalCount>0">
								第<s:property value="pageBean.page" />/<s:property
								value="pageBean.totalPage" />页 
								<s:if test="pageBean.page != 1">
								<a
									href="${ pageContext.request.contextPath }/softwareCode_findAllCode?page=1">首页</a>|
									<a
									href="${ pageContext.request.contextPath }/softwareCode_findAllCode?page=<s:property value="pageBean.page-1"/>">上一页</a>|
								</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a
									href="${ pageContext.request.contextPath }/softwareCode_findAllCode?page=<s:property value="pageBean.page+1"/>">下一页</a>|
									<a
									href="${ pageContext.request.contextPath }/softwareCode_findAllCode?page=<s:property value="pageBean.totalPage"/>">尾页</a>
							</s:if>
							</s:if>
						<div>
							<span style="color: red;font-size:20px;"><s:actionerror /></span>
						</div>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
	</div>
	
	<div class="easyui-dialog" title="生成软件码" id="addModel" draggable=true modal=true closed=true style="display:black;width:500px;height:165px" >
		<form id="teacher_save_do" name="Form1">
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			
			<tr>
				<td width="40%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>院长姓名：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="dean_name" id="dean_name" class="bg" />
				</td>
			</tr>
			<tr>
				<td width="40%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>计算机码：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="computerName" value="XXX.XXX.XXX.XXX"
					onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
					onBlur="if(!value){value=defaultValue;this.style.color='#999'}"
					id="computer_code" style="color:#999999;width:240px;"/></td>
			</tr>
			<tr>
				<td width="40%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color:red">*</span>有效期：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<select name="time">
						<option value="1">1年</option>
						<option value="2">2年</option>
						<option value="3">3年</option>
						<option value="4">4年</option>
						<option value="5">5年</option>
						<option value="6">6年</option>
						<option value="7">7年</option>
						<option value="8">8年</option>
						<option value="9">9年</option>
						<option value="10">10年</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="button" id="submit"
						value="点击生成软件码" onclick="check_data()" class="button_ok">生成注册码</button> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_ok">&#37325;&#32622;</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<div id="mm" style="width:12%;">
		<div id="addPage">
			<a  title="新增单本软件注册码" >添加软件注册码</a>
		</div>
	</div>
</body>
</html>