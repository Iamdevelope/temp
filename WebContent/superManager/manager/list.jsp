<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
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
<script type="text/javascript">
	$(function(){
		$('#md1').click(function(){
			window.location.href = "${pageContext.request.contextPath}/modelDownload?templateId=manager";
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
			window.location.href="${pageContext.request.contextPath}/managerSuperManager_importExcel?excelPath="+importPath;
			
		});
		$('#addPage').on('click',function(){
			window.location.href = "${pageContext.request.contextPath}/managerSuperManager_addPage";
		});
		$('input#selectBtn').on('click',function(){
			var select=$('input#select').val();
			console.log("输入的关键字："+select);
			if(select==null||select=="用户名/电话/姓名"){
				$.messager.alert('提示信息','请输入关键字');
				return;
			}
			window.location.href="${pageContext.request.contextPath}/managerSuperManager_select?page=1&select="+select;
		});
	});
	function importData(){
		
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
		//window.location.href="${pageContext.request.contextPath}/managerSuperManager_importExcel?excelPath="+importPath;
		
		$.ajax({
			type:'post',
			url:'',
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			data:FormDatas,
			success: function(data){
				if(data == "error"){
					layer.msg("文件导入失败，请重新上传！", {
						icon: OPER_SB,
						shade: [0.3, '#393D49'], // 透明度  颜色
						time:5000
						});
					return false;
				}else{
					layer.msg("文件导入成功！", {
						icon: OPER_CG,
						shade: [0.3, '#393D49'], // 透明度  颜色
						time:5000
						});
					window.location.reload();
					return false;
				}
			},
			error : function(data){
				console.log(data.msg);
			}
		});
	}
</script>
</HEAD>
<body>
	<div>
		
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/superManager/manager/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<!-- <button type="button" id="exportBtn" onclick="exportModel()" style="position:absolute;left:6px;background-color: #DAE6FF;">下载模板</button> --> 
						<div class="excelBtn">
							<!-- <a class="exportId icon-save" style="padding-left:20px;" id="exportButton" title="下载Excel模板" >下载模板</a> -->
							<a class="exportId" style="padding-left:20px;" id="md1" href="javascript:void(0)" iconCls="icon-save" title="下载Excel模板" >下载模板</a>
							<a class="importId icon-add" id="md2" style="padding-left:20px;" href="javascript:void(0)" title="导入管理员信息" iconCls="icon-add" >新增用户</a>
						</div>
						
						<strong>管理员列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01"><input type="text" id="select" name="select"
						value="用户名/电话/姓名"
						onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
						onBlur="if(!value){value=defaultValue;this.style.color='#999'}"
						style="color: #999999"></input> <input type="button" class="button_search"
						id="selectBtn" title="搜索" ></input>&nbsp;&nbsp;&nbsp;&nbsp;
						
				</tr>

				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<!-- <p style="color:red;">提示：点击用户的名字可查看用户详细信息。</p> -->
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="2%">序号</td>
								<td align="center" width="8%">名字</td>
								<td align="center" width="8%">电话号码</td>
								<td align="center" width="8%">用户名</td>
								<td align="center" width="10%">邮箱</td>
								<td align="center" width="10%">是否有效</td>
								<td width="7%" align="center">编辑</td>
								<td width="7%" align="center">删除</td>
							</tr>
							<s:if test="pageBean.list.size()>0">
								<p align="center" style="color: red;">提示：点击用户的名字可查看用户详细信息。</p>
							</s:if>
							<s:iterator var="m" value="pageBean.list" status="status">

								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">

									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="2%"><s:property value="#status.count" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><a
										href="${pageContext.request.contextPath }/managerSuperManager_info?mid=<s:property value="#m.mid"/>">
											<s:property value="#m.name" />
									</a></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#m.phone_number" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#m.username" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="10%"><s:property value="#m.email" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:if test="#m.isdelete==0">
													是
												</s:if> <s:else>
													否
												</s:else></td>
									<td align="center" style="HEIGHT: 30px"><a
										href="${ pageContext.request.contextPath }/managerSuperManager_editPage?mid=<s:property value="#m.mid"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_edit.gif"
											border="0" style="CURSOR: hand">
									</a></td>

									<td align="center" style="HEIGHT: 30px"><a
										href="${ pageContext.request.contextPath }/managerSuperManager_delete?mid=<s:property value="#m.mid"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a></td>
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
									href="${ pageContext.request.contextPath }/managerSuperManager_findManagerAll?page=1">首页</a>|
									<a
									href="${ pageContext.request.contextPath }/managerSuperManager_findManagerAll?page=<s:property value="pageBean.page-1"/>">上一页</a>|
								</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a
									href="${ pageContext.request.contextPath }/managerSuperManager_findManagerAll?page=<s:property value="pageBean.page+1"/>">下一页</a>|
									<a
									href="${ pageContext.request.contextPath }/managerSuperManager_findManagerAll?page=<s:property value="pageBean.totalPage"/>">尾页</a>|
								</s:if>
						</s:if> <s:else>
							<p style="color: blue; font-size: 20px;">当前还没有录入用户信息。</p>
						</s:else></td>
				</tr>
			</TBODY>
		</table>
	</form>
	</div>
	
	<div class="easyui-dialog" title="导入Excel数据" id="importModel" draggable=true modal=true closed=true style="display:black;width:350px;height:200px" >
		<form id="importForm" action="${pageContext.request.contextPath }/managerSuperManager_importData" enctype="multipart/form-data" method="post">
    		<table>
    			<tr>
    				<td>浏览:</td>
    				<td>
    					<input id="fileInput" name="fileInput" type="file" />
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2">
    					<!-- <div id="fileQueue"></div><a type="submit" id="uploadBtn" class="easyui-linkbutton" >导入</a> -->
    					<button type="submit" id="uploadBtn" class="easyui-linkbutton">导入</button>
    				</td>
    			</tr>
    		</table>
    	</form>
	</div>
	<div id="mm2" style="width:12%;">
		<div>
			<a id="addPage" title="新增单个管理员信息" >新增管理员</a>
		</div>
		<div id="importBtn">
			<a title="导入管理员信息">导入数据</a>
		</div>
	</div>
</body>
</HTML>