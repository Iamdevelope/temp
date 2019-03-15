<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
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
			
			$('li').click(function(){
				var self = $(this),
					classType = self.attr('data-id');
				var btype = document.getElementById("btype").value;
			console.log("当前点击的按钮编号为："+classType+"当前绘本类型为："+btype);
			if(classType==0){
				window.location.href="${pageContext.request.contextPath}/bookSuperManager_find?page=1&bclass=0&btype="+btype;		
			}else if(classType==1){
				window.location.href="${pageContext.request.contextPath}/bookSuperManager_find?page=1&bclass=1&btype="+btype;
			}
			else if(classType==2){
				window.location.href="${pageContext.request.contextPath}/bookSuperManager_find?page=1&bclass=2&btype="+btype;
			}
			});
			$('#md1').click(function(){
				var booktype = '';
				var type=$('input#btype').val();
				console.log("当前的绘本类型："+type);
				switch(type){
				case '0':
					booktype='society';
					break;
				case '1':
					booktype='math';
					break;
				case '2':
					booktype='exploration';
					break;
				case '3':
					booktype='art';
					break;
				case '4':
					booktype='music';
					break;
				case '5':
					booktype='health';
					break;
				case '6':
					booktype='language';
					break;
				}
				console.log("需要下载的绘本模板类型为："+booktype);
				window.location.href = "${pageContext.request.contextPath}/modelDownload?templateId="+booktype;
			});
			
			$('#importBtn').on('click',function(){
				console.log("_______________");
				$('#importModel').dialog('open');
			});
			$('#md2').menubutton({
				menu:'#mm2'
			});
			$('#md1').menubutton({
				
			});
			$('#uploadBtn').on('click',function(){
				var importPath=$('input#fileInput').val();
				console.log("当前选中的Excel路径为："+importPath);
				if(importPath==""){
					$.messager.alert('提示信息','请选中好需要上传的文件再点击上传按钮！');
					return;
				}else if(importPath.lastIndexOf(".xls")<0){//判断上传的文件是否为excel文件
					$.messager.alert('提示信息','只能上传Excel文件！');
					return;
				}
				console.log("导入按钮被点击了");
				window.location.href="${pageContext.request.contextPath}/bookSuperManager_importExcel?excelPath="+importPath;
			});
			$('#addPage').on('click',function(){
				window.location.href = "${pageContext.request.contextPath}/bookSuperManager_addPage";
			});
			$('input#selectBtn').on('click',function(){
				var select=$('input#select').val();
				console.log("输入的关键字："+select);
				if(select==null||select=="用户名/电话/姓名"){
					$.messager.alert('提示信息','请输入关键字');
					return;
				}
				window.location.href="${pageContext.request.contextPath}/bookSuperManager_select?page=1&select="+select;
			});
			
		});

		function addDean(){
			var type=document.getElementById("btype").value;
			console.log(type);
			window.location.href="${pageContext.request.contextPath}/bookSuperManager_addPage?btype="+parseInt(type);			
		}
		function selectFun(){
			var select=document.getElementById("select").value;
			var type=document.getElementById("btype").value;
			if(select==null||select=="书名/类型/班级类型/主题"){
				alert("请输入关键字");
				return;
			}
			window.location.href="${pageContext.request.contextPath}/bookSuperManager_select?page=1&select="+select+"&btype="+type;
		}
		
	</script>
<title>绘本列表</title>
</head>
<body>
<div>
	<span style="color: red;"><s:actionerror /></span>
	<form id="Form1" name="Form1">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<div class="excelBtn">
							<!-- <a class="exportId icon-save" style="padding-left:20px;" id="exportButton" title="下载Excel模板" >下载模板</a>
							<a class="importId icon-add" style="padding-left:20px;" id="importButton" title="导入绘本信息" >导入数据</a> -->
							<a class="exportId" style="padding-left:20px;" id="md1" href="javascript:void(0)" iconCls="icon-save" title="下载Excel模板" >下载模板</a>
							<a class="importId icon-add" id="md2" style="padding-left:20px;" href="javascript:void(0)" title="导入绘本信息" iconCls="icon-add" >导入数据</a>
						</div>
						<strong>绘本列表</strong>
						<input type="hidden" id="btype" value="<s:property value="type"/>">
					</TD>
				</tr>
				<tr>
					<td class="ta_01"><input type="text" id="select" name="select"
						value="书名/类型/班级类型/主题"
						onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
						onBlur="if(!value){value=defaultValue;this.style.color='#999'}"
						style="color: #999999"></input> <input type="button" class="button_search"
						id="selectBtn" title="搜索"  />&nbsp;&nbsp;&nbsp;&nbsp;
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

								<td align="center" width="2%">序号</td>
								<td align="center" width="17%">绘本名称</td>
								<td align="center" width="8%">绘本类型</td>
								<td width="8%" align="center">所属班级类型</td>
								<td width="8%" align="center">绘本主题</td>
								<td width="8%" align="center">是否可以使用</td>
								<td width="8%" align="center">星级评分</td>
								<td width="7%" align="center">编辑</td>
								<!-- <td width="7%" align="center">删除</td> -->
							</tr>

							<s:iterator var="b" value="pageBean.list" status="status">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">

									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="2%"><s:property value="#status.count" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="17%"><a
										href="${pageContext.request.contextPath }/bookSuperManager_info?bid=<s:property value="#b.bid"/>&btype=<s:property value="#b.type"/>">
											<s:property value="#b.name" />

									</a></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#b.book_type" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#b.book_class" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#b.book_theme" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:if test="#b.isdelete==0">
													可以
												</s:if> <s:else>
													不可以
												</s:else></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#b.score" /></td>
									<td align="center" style="HEIGHT: 30px"><a
										href="${ pageContext.request.contextPath }/bookSuperManager_edit?bid=<s:property value="#b.bid"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_edit.gif"
											border="0" style="CURSOR: hand" title="编辑">
									</a></td>

									<%-- <td align="center" style="HEIGHT: 30px"><a
										href="${ pageContext.request.contextPath }/bookSuperManager_delete?bid=<s:property value="#b.bid"/>&btype=<s:property value="type"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand"
											title="删除">
									</a></td> --%>
								</tr>
							</s:iterator>
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
						</s:if> <s:else>
							<p style="color: blue; font-size: 20px;">当前还没有录入绘本。</p>
						</s:else>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
	</div>
	
	
	<div class="easyui-dialog" title="导入Excel数据" id="importModel" draggable=true modal=true closed=true style="display:black;width:350px;height:200px" >
		<form id="importForm" action="${pageContext.request.contextPath }/bookSuperManager_importExcel" method="post">
    		<table>
    			<tr>
    				<td>浏览:</td>
    				<td>
    					<input id="fileInput" name="fileInput" type="file" />
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2">
    					<div id="fileQueue"></div><a type="submit" id="uploadBtn" class="easyui-linkbutton" >导入</a>
    				</td>
    			</tr>
    		</table>
    	</form>
	</div>
	<div id="mm2" style="width:12%;">
		<div>
			<a id="addPage" title="新增单本绘本信息" >新增绘本</a>
		</div>
		<div id="importBtn">
			<a title="导入绘本信息">导入数据</a>
		</div>
	</div>
</body>
</html>