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
		window.location.href="${pageContext.request.contextPath}/bookSuperManager_find?page=1&bclass=0&btype="+btype;		
	}else if(classType==1){
		window.location.href="${pageContext.request.contextPath}/bookSuperManager_find?page=1&bclass=1&btype="+btype;
	}
	else if(classType==2){
		window.location.href="${pageContext.request.contextPath}/bookSuperManager_find?page=1&bclass=2&btype="+btype;
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
		window.location.href = "${pageContext.request.contextPath}/bookSuperManager?templateDownId="+booktype+"&btype="+type;
	});
	
	$('#importBtn').on('click',function(){
		$('#importModel').dialog('open');
	});
	$('#md2').menubutton({
		menu:'#mm2'
	});
	$('#md1').menubutton({
		menu:'#mm1'
	});
	$('#addPage').on('click',function(){
		var type=$('input#btype').val();
		//$('#addModel').dialog('open');
		window.location.href = "${pageContext.request.contextPath}/bookSuperManager_addPage?btype="+type;
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
		window.location.href="${pageContext.request.contextPath}/bookSuperManager_select?page=1&select="+select+"&btype="+type;
	});
});


function check_book_data(){
	console.log("点击了确定按钮");
	var book_name=document.getElementById("bookSuperManager_save_do_book_name").value;
	var book_theme=document.getElementById("bookSuperManager_save_do_book_theme").value;
	if(book_name==null||book_name==""){
		alert("绘本名不能为空！");
		return false;
	}
	else if(book_theme==null||book_theme==""){
		alert("必须需要给当前需要添加的绘本指定一个主题！");
		return false;
	}
}
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
							<a class="exportId" style="padding-left:20px;" id="md1" href="javascript:void(0)" iconCls="icon-save" title="下载Excel模板" >下载模板</a>
							<a class="importId icon-add" id="md2" style="padding-left:20px;" href="javascript:void(0)" title="导入绘本信息" iconCls="icon-add" >导入数据</a>
						</div>
						<strong>绘本列表</strong>
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
						<p style="left:20px;color: red;">提示：点击绘本的名字可查看绘本详细信息。</p>
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
								<td align="center" width="17%">绘本名称</td>
								<td align="center" width="8%">绘本类型</td>
								<td width="8%" align="center">所属班级类型</td>
								<td width="8%" align="center">绘本主题</td>
								<td width="8%" align="center">是否可以使用</td>
								<td width="8%" align="center">星级评分</td>
								<td width="7%" align="center">编辑</td>
								<c:if test="${existAdmin.isadmin==0 }">
									<td width="7%" align="center">删除</td>
								</c:if>
							</tr>
							<c:if test="${pageBean.list.size()>0 }">
							
								<c:forEach var="b" items="${pageBean.list}">
									<tr onmouseover="this.style.backgroundColor = 'white'"
										onmouseout="this.style.backgroundColor = '#F5FAFE';">
	
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="2%">${b.bid}</td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="17%"><a
											href="${pageContext.request.contextPath }/bookSuperManager_info?bid=${b.bid }&btype=${b.type}">
												${b.name }
										</a></td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="8%"><%-- <s:property value="#b.book_type" /> --%>
											${b.booktype.book_type_name }
											</td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="8%"><%-- <s:property value="#b.book_class" /> --%>
											${b.book_class}
											</td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="8%"><%-- <s:property value="#b.book_theme" /> --%>
											${b.book_theme }
											</td>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="8%">
											<c:if test="${b.isdelete ==0 }">
												可以
											</c:if><c:if test="${b.isdelete ==1 }">
												不可以
											</c:if>
										<td style="CURSOR: hand; HEIGHT: 30px" align="center"
											width="8%"><s:property value="#b.score" />
											<c:forEach var="i" begin="1" end="${b.score }" >
											<c:if test="${b.score==1 }">
												<img class="star" title="失望" alt="星星" src="${pageContext.request.contextPath }/images/xing.png">											
											</c:if>
											<c:if test="${b.score==2 }">
												<img class="star" title="一般" alt="星星" src="${pageContext.request.contextPath }/images/xing.png">											
											</c:if>
											<c:if test="${b.score==3 }">
												<img class="star" title="好" alt="星星" src="${pageContext.request.contextPath }/images/xing.png">											
											</c:if>
											<c:if test="${b.score==4 }">
												<img class="star" title="很好" alt="星星" src="${pageContext.request.contextPath }/images/xing.png">											
											</c:if>
											<c:if test="${b.score==5 }">
												<img class="star" title="非常好" alt="星星" src="${pageContext.request.contextPath }/images/xing.png">											
											</c:if>
										</c:forEach>
										</td>
										<td align="center" style="HEIGHT: 30px"><a
											href="${pageContext.request.contextPath }/bookSuperManager_edit?bid=${b.bid }">
												<img
												src="${pageContext.request.contextPath}/images/i_edit.gif"
												border="0" style="CURSOR: hand" title="编辑">
										</a></td>
										<c:if test="${existAdmin.isadmin==0 }">
											<td align="center" style="HEIGHT: 30px"><a
											href="${ pageContext.request.contextPath }/bookSuperManager_delete?bid=${b.bid }&btype=${type}">
												<img
												src="${pageContext.request.contextPath}/images/i_del.gif"
												width="16" height="16" border="0" style="CURSOR: hand" title="删除">
											</a></td>
										</c:if>
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
									href="${ pageContext.request.contextPath }/bookSuperManager_findBookAll?page=1">首页</a>|
									<a
									href="${ pageContext.request.contextPath }/bookSuperManager_findBookAll?page=<s:property value="pageBean.page-1"/>">上一页</a>|
								</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a
									href="${ pageContext.request.contextPath }/bookSuperManager_findBookAll?page=<s:property value="pageBean.page+1"/>">下一页</a>|
									<a
									href="${ pageContext.request.contextPath }/bookSuperManager_findBookAll?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
		<form id="importForm" action="${pageContext.request.contextPath }/bookSuperManager_importData" enctype="multipart/form-data" method="post">
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
	
	<div class="easyui-dialog" title="新增绘本数据" id="addModel" draggable=true modal=true closed=true style="display:black;width:630px;height:315px" >
		<form id="teacher_save_do" name="Form1"
		action="${pageContext.request.contextPath}/bookSuperManager_save?btype=<s:property value="type"/>"
		method="post" enctype="multipart/form-data">
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本名：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="name" value="" id="bookSuperManager_save_do_book_name"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本类型：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text"
					name="book_type" value="<s:property value="currentType"/>" id="bookSuperManager_save_do_book_name"
					class="bg" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本所属班级类型：
				</td>
				<td class="ta_01" bgColor="#ffffff"><select name="book_class">
						<option value="大班">大班</option>
						<option value="中班">中班</option>
						<option value="小班">小班</option>
				</select></td>
			</tr>
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本主题：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="book_theme" value="" id="bookSuperManager_save_do_book_theme"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="25%" align="center" bgColor="#f5fafe" class="ta_01">
					绘本描述：</td>
				<td class="ta_01" bgColor="#ffffff"><textarea
						id="book_abstract" rows="5" cols="60" name="book_abstract"
						onKeyDown="keypress()" onblur="keypress()"><s:property
							value="" /></textarea> <font color="gray"><label
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
	
	<div id="mm1" style="width:8%;">
		<div id="downloadModel">
			<a  title="下载绘本Excel表模板" >下载Excel模板</a>
		</div>
		<div id="downloadData">
			<a title="下载绘本信息">导出数据</a>
		</div>
	</div>
	<div id="mm2" style="width:12%;">
		<div id="addPage">
			<a  title="新增单本绘本信息" >新增绘本</a>
		</div>
		<div id="importBtn">
			<a title="导入绘本信息">导入绘本信息</a>
		</div>
	</div>
</body>
</html>