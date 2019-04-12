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
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
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
	
	<script src="js/UploadW.js"></script>
	<link rel="stylesheet" href="css/uploadW.css">
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
.star {
	position:left;
	width:15px;
	height:15px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('li').click(function(){
		var self = $(this),
			classType = self.attr('data-id');
		var btype = document.getElementById("btype").value;
	if(classType==0){
		window.location.href="${pageContext.request.contextPath}/teachingPlan_find?page=1&bclass=0&btype="+btype;		
	}else if(classType==1){
		window.location.href="${pageContext.request.contextPath}/teachingPlan_find?page=1&bclass=1&btype="+btype;
	}
	else if(classType==2){
		window.location.href="${pageContext.request.contextPath}/teachingPlan_find?page=1&bclass=2&btype="+btype;
	}
	});
	$('#downloadModel').click(function(){
		var booktype = '';
		var type=$('input#btype').val();
		switch(type){
		case '1':
			booktype='society';
			break;
		case '2':
			booktype='math';
			break;
		case '3':
			booktype='exploration';
			break;
		case '4':
			booktype='art';
			break;
		case '5':
			booktype='music';
			break;
		case '6':
			booktype='health';
			break;
		case '7':
			booktype='language';
			break;
		}
		window.location.href = "${pageContext.request.contextPath}/modelDownload?templateId="+booktype;
	});
	$('#downloadData').click(function(){
		var booktype = '';
		var type=$('input#btype').val();
		switch(type){
		case '1':
			booktype='society';
			break;
		case '2':
			booktype='math';
			break;
		case '3':
			booktype='exploration';
			break;
		case '4':
			booktype='art';
			break;
		case '5':
			booktype='music';
			break;
		case '6':
			booktype='health';
			break;
		case '7':
			booktype='language';
			break;
		}
		console.log("绘本类型："+booktype+"  id："+type);
		window.location.href = "${pageContext.request.contextPath}/teachingPlan?templateDownId="+booktype+"&btype="+type;
	});
	
	$('input#selectBtn').on('click',function(){
		var select=$('input#select').val(),
			type=$('input#btype').val();
		var reg=/[`~!@#$%^&*()_+<>?:"{},.\/;'[\]]/im;
		if(reg.test(select)){
			$.messager.alert('提示信息','关键字中存在非法字符');
			return;
		}
		if(select==null||select=="书名/类型/班级类型/主题"){
			$.messager.alert('提示信息','请输入关键字');
			return;
		}
		window.location.href="${pageContext.request.contextPath}/teachingPlan_select?page=1&select="+select+"&btype="+type;
	});
});

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
						<strong>教案列表</strong>
						<input type="hidden" id="btype" value="<s:property value="type"/>">
					</TD>
				</tr>
				<tr>
					<td class="ta_01"><span>关键词：</span><input type="text" id="select" name="select"
						value="书名/主题"
						onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
						onBlur="if(!value){value=defaultValue;this.style.color='#999'}"
						style="color: #999999"></input> <input type="button" class="button_search"
						id="selectBtn" title="搜索"  />
						<div>
							<ul class="classType">
								<li data-id="0">大班</li>
								<li data-id="1">中班</li>
								<li data-id="2">小班</li>
							</ul>
						</div>
						<p style="left:20px;color: red;">提示：点击教案的名字可查看详细信息。</p>
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
								<td align="center" width="17%">教案名称</td>
								<td align="center" width="8%">所属类型</td>
								<td align="center" width="8%">所属班级</td>
								<td width="8%" align="center">对应绘本</td>
							</tr>
							<c:if test="${pageBean.list.size()>0 }">
							
								<c:forEach var="b" items="${pageBean.list}">
									<tr onmouseover="this.style.backgroundColor = 'white'"
										onmouseout="this.style.backgroundColor = '#F5FAFE';">
	
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="2%">${b.idteaching_plan}</td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="17%"><a
											href="${pageContext.request.contextPath }/teachingPlan_info?idteaching_plan=${b.idteaching_plan }&btype=${b.booktype.idbooktype}">
												${b.teaching_plan_name }
										</a></td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="8%">
											${b.booktype.book_type_name }
											</td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="8%">
											${b.book_class }
											</td>	
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="8%">
											${b.teaching_plan_name}
											</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${pageBean.list.size()<=0 }">
								<p style="color: blue; font-size: 20px;">当前还没有录入该类型绘本，敬请期待。</p>
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
									href="${ pageContext.request.contextPath }/teachingPlan_findBookAll?page=1">首页</a>|
									<a
									href="${ pageContext.request.contextPath }/teachingPlan_findBookAll?page=<s:property value="pageBean.page-1"/>">上一页</a>|
								</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a
									href="${ pageContext.request.contextPath }/teachingPlan_findBookAll?page=<s:property value="pageBean.page+1"/>">下一页</a>|
									<a
									href="${ pageContext.request.contextPath }/teachingPlan_findBookAll?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
	
</body>
</html>