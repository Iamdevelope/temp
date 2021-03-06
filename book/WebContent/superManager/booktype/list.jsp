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

<script type="text/javascript">
$(document).ready(function(){
	$('#addPage').on('click',function(){
		$('#addModel').dialog('open');
	});
	$('#md').menubutton({
		menu:'#mm'
	});
	$('#importBtn').on('click',function(){
		$('#importModel').dialog('open');
	});
	$('#edit').on('click',function(){
		$('#editPanel').dialog('open');	
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
function check_book_data(){
	var book_name=document.getElementById("add_book_name").value;
	if(book_name==null||book_name==""){
		alert("绘本类型名不能为空！");
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
							<a class="exportId icon-add" id="md" style="padding-left:20px;" href="javascript:void(0)" title="新增绘本信息" iconCls="icon-add" >新增数据</a>
						</div>
						<strong>绘本类型列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01">
						<p align="center" style="left:20px;color: red;">提示：点击绘本类型的名称可查看绘本详细信息。</p>
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
								<td align="center" width="10%">绘本类型名称</td>
								<td align="center" width="80%">描述</td>
								<td width="8%" align="center">编辑</td>
							</tr>

							<c:forEach var="b" items="${pageBean.list}">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">

									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="2%">${b.idbooktype}</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="10%">
										<a
										<%-- href="${pageContext.request.contextPath }/bookTypeSuperManager_infoBookTypePage?idbooktype=${b.idbooktype }" --%> >
											${b.book_type_name }
									</a>
									</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="80%">
										${b.description }
										</td>
									
									<td align="center" style="HEIGHT: 30px">
									<div id="edit"><a
										href="${ pageContext.request.contextPath }/bookTypeSuperManager_editBookTypePage?idbooktype=${b.idbooktype}">
											<img
											src="${pageContext.request.contextPath}/images/i_edit.gif"
											border="0" style="CURSOR: hand" title="编辑">
									</a></div>
									</td>
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
									href="${ pageContext.request.contextPath }/bookTypeSuperManager_booktype?page=1">首页</a>|
									<a
									href="${ pageContext.request.contextPath }/bookTypeSuperManager_booktype?page=<s:property value="pageBean.page-1"/>">上一页</a>|
								</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a
									href="${ pageContext.request.contextPath }/bookTypeSuperManager_booktype?page=<s:property value="pageBean.page+1"/>">下一页</a>|
									<a
									href="${ pageContext.request.contextPath }/bookTypeSuperManager_booktype?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
	
	
	<div class="easyui-dialog" title="新增绘本类型数据" id="addModel" draggable=true modal=true closed=true style="display:black;width:630px;height:222px" >
		<form id="teacher_save_do" name="Form1"
		action="${pageContext.request.contextPath}/bookTypeSuperManager_save"
		method="post" enctype="multipart/form-data">
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本类型名：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="book_type_name" value="" id="add_book_name"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					绘本描述：</td>
				<td class="ta_01" bgColor="#ffffff"><textarea
						id="book_abstract" rows="5" cols="60" name="description"
						onKeyDown="keypress()" onblur="keypress()"><s:property
							value="model.book_abstract" /></textarea> <font color="gray"><label
						id="abstract">你还可以输入300个汉字</td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="bookSuperManager_save_do_submit"
						value="确定" onclick="return check_book_data()" class="button_ok">&#30830;&#23450;</button> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_ok">&#37325;&#32622;</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	
	<div class="easyui-dialog" title="编辑绘本类型数据" id="editPanel" draggable=true modal=true closed=true style="display:black;width:630px;height:222px" >
		<form id="teacher_save_do" name="Form1"
		action="${pageContext.request.contextPath}/bookTypeSuperManager_update"
		method="post" enctype="multipart/form-data">
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本类型名：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="book_type_name" value="" id="bookSuperManager_save_do_book_name"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					绘本描述：</td>
				<td class="ta_01" bgColor="#ffffff"><textarea
						id="book_abstract" rows="5" cols="60" name="description"
						onKeyDown="keypress()" onblur="keypress()"><s:property
							value="model.book_abstract" /></textarea> <font color="gray"><label
						id="abstract">你还可以输入300个汉字</td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="bookSuperManager_save_do_submit"
						value="确定" class="button_ok">&#30830;&#23450;</button> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_ok">&#37325;&#32622;</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	
	<div id="mm" style="width:12%;">
		<div id="addPage">
			<a  title="新增绘本类型信息" >新增绘本类型</a>
		</div>
	</div>
	
</body>
</html>