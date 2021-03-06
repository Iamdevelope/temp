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
	$('#addPage').on('click',function(){
		$('#addModel').dialog('open');
	});
	$('#md1').menubutton({
		menu:'#mm1'
	});
	$('#md2').menubutton({
		menu:'#mm2'
	});
	$('#importBtn').on('click',function(){
		$('#importModel').dialog('open');
	});
	$('#info').on('click',function(){
		$('#infoPanel').dialog('open');
	});
	$('#edit').on('click',function(){
		$('#editPanel').dialog('open');	
	});
	$('#downloadModel').click(function(){
		var booktype = '';
		var type='${class_type}';
		console.log("type is "+type);
		switch(type){
		case '大班':
			booktype='theme_big_class';
			break;
		case '中班':
			booktype='theme_middle_class';
			break;
		case '小班':
			booktype='theme_small_class';
			break;
		}
		window.location.href = "${pageContext.request.contextPath}/modelDownload?templateId="+booktype;
	});
	$('#downloadData').click(function(){
		var booktype = '';
		var type='${class_type}';
		switch(type){
		case '大班':
			booktype='theme_big_class';
			break;
		case '中班':
			booktype='theme_middle_class';
			break;
		case '小班':
			booktype='theme_small_class';
			break;
		}
		console.log("绘本类型："+booktype+"  id："+type);
		window.location.href = "${pageContext.request.contextPath}/bookThemeSuperManager?templateDownId="+booktype+"&classType="+type;
	});
	$('input#selectBtn').on('click',function(){
		var select=$('input#select').val(),
			type='${class_type}';
		var reg=/[`~!@#$%^&*()_+<>?:"{},.\/;'[\]]/im;
		if(reg.test(select)){
			$.messager.alert('提示信息','关键字中存在非法字符');
			return;
		}
		if(select==null||select=="主题名称"){
			$.messager.alert('提示信息','请输入关键字');
			return;
		}
		window.location.href="${pageContext.request.contextPath}/bookThemeSuperManager_select?page=1&select="+select+"&classType="+type;
	});
});

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
function check_theme_data(){
	var theme_name=document.getElementById("add_theme_name").value;
	if(theme_name==""||theme_name==null){
		alert("绘本主题不能为空！");
		return false;
	}
}
</script>
<title>绘本列表</title>
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
							<a class="exportId" style="padding-left:20px;" id="md1" href="javascript:void(0)" iconCls="icon-save" title="下载Excel模板" >导出数据</a>
							<a class="importId icon-add" id="md2" style="padding-left:20px;" href="javascript:void(0)" title="导入绘本信息" iconCls="icon-add" >导入数据</a>
						</div>
						<strong>绘本主题列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01"><span>关键词：</span><input type="text" id="select" name="select"
						value="主题名称"
						onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
						onBlur="if(!value){value=defaultValue;this.style.color='#999'}"
						style="color: #999999"></input> <input type="button" class="button_search"
						id="selectBtn" title="搜索"  />
						<p style="left:20px;color: red;">提示：点击主题的名字可查看绘本详细信息。</p>
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
								<td align="center" width="10%">主题名称</td>
								<td align="center" width="10%">所属班级类型</td>
								<td align="center" width="10%">上/下学期</td>
								<td align="center" width="50%">描述</td>
								<td width="10%" align="center">编辑</td>
								<c:if test="${existAdmin.isadmin==0 }">
									<td width="7%" align="center">删除</td>
								</c:if>
							</tr>

							<c:forEach var="b" items="${pageBean.list}">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">

									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="2%">${b.idbooktheme}</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="10%"><a
										href="${pageContext.request.contextPath }/bookThemeSuperManager_infoBookThemePage?idbooktheme=${b.idbooktheme }">
											
											${b.theme_name }
									</a></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="10%">
										<font id="class_type">${b.class_type }</font>
										</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="10%">
										${b.term }
										</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="30%">
										${b.theme_description }
										</td>
									
									<td align="center" style="HEIGHT: 30px" width="10%"><a
										href="${ pageContext.request.contextPath }/bookThemeSuperManager_editBookThemePage?idbooktheme=${b.idbooktheme}">
											<img
											src="${pageContext.request.contextPath}/images/i_edit.gif"
											border="0" style="CURSOR: hand" title="编辑">
									</a></td>
									<c:if test="${existAdmin.isadmin==0 }">
										<td align="center" style="HEIGHT: 30px"><a
											href="${pageContext.request.contextPath}/bookThemeSuperManager_delete?idbooktheme=${b.idbooktheme}&classType=${class_type}">
												<img
												src="${pageContext.request.contextPath}/images/i_del.gif"
												width="16" height="16" border="0" style="CURSOR: hand">
										</a></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr align="center">
					<td colspan="7"><s:if test="pageBean.totalCount>0">
								第<s:property value="pageBean.page" />/<s:property
								value="pageBean.totalPage" />页 
								<s:if test="pageBean.page != 1">
								<a
									href="${ pageContext.request.contextPath }/bookThemeSuperManager_booktheme?page=1">首页</a>|
									<a
									href="${ pageContext.request.contextPath }/bookThemeSuperManager_booktheme?page=<s:property value="pageBean.page-1"/>">上一页</a>|
								</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a
									href="${ pageContext.request.contextPath }/bookThemeSuperManager_booktheme?page=<s:property value="pageBean.page+1"/>">下一页</a>|
									<a
									href="${ pageContext.request.contextPath }/bookThemeSuperManager_booktheme?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
	
	<div class="easyui-dialog" title="导入Excel数据" id="importModel" draggable=true modal=true closed=true style="display:black;width:350px;height:200px" >
		<form id="importForm" action="${pageContext.request.contextPath }/bookThemeSuperManager_importData" enctype="multipart/form-data" method="post">
    		<table>
    			<tr>
    				<td>浏览:</td>
    				<td>
    					<input id="fileInput" name="fileInput" type="file" />
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2">
    					<input type="submit" onclick="return importData()" id="uploadBtn" class="easyui-linkbutton" value="导入"/>
    				</td>
    			</tr>
    		</table>
    	</form>
	</div>
	
	<div class="easyui-dialog" title="新增绘本主题数据" id="addModel" draggable=true modal=true closed=true style="display:black;width:630px;height:284px" >
		<form id="teacher_save_do" name="Form1"
		action="${pageContext.request.contextPath}/bookThemeSuperManager_save"
		method="post" enctype="multipart/form-data">
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本主题名：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="theme_name" value="" id="add_theme_name"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>所属班级类型：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<select name="class_type">
						<option value="大班">大班</option>
						<option value="中班">中班</option>
						<option value="小班">小班</option>
					</select></td>
			</tr>
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>学期：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<select name="term">
						<option value="上学期">上学期</option>
						<option value="下学期">下学期</option>
				</select></td>
				</td>
			</tr>
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					描述：</td>
				<td class="ta_01" bgColor="#ffffff"><textarea
						id="book_abstract" rows="5" cols="60" name="theme_description"
						onKeyDown="keypress()" onblur="keypress()"><s:property
							value="" /></textarea> <font color="gray"><label
						id="abstract">你还可以输入300个汉字</td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="bookSuperManager_save_do_submit"
						value="确定" onclick="return check_theme_data()" class="button_ok">&#30830;&#23450;</button> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_ok">&#37325;&#32622;</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<div id="mm1" style="width:12%;">
		<div id="downloadModel">
			<a  title="下载主题Excel模板" >导出模板</a>
		</div>
		<div id="downloadData">
			<a  title="导出绘本主题表信息" >导出数据</a>
		</div>
	</div>
	<div id="mm2" style="width:12%;">
		<div id="addPage">
			<a  title="新增绘本主题信息" >新增绘本主题</a>
		</div>
		<div id="importBtn">
			<a  title="导入绘本主题表信息" >导入主题Excel表</a>
		</div>
	</div>
</body>
</html>