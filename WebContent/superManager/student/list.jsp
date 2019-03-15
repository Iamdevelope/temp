<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	$('#exportButton').click(function(){
		window.location.href = "${pageContext.request.contextPath}/modelDownload?templateId=student";
	});
	$('importButton').click(function(){
		$('#importModel').dialog('open');
	});
});
			function addDean(){
				window.location.href="${pageContext.request.contextPath}/studentSuperManager_addPage";
			}
			function selectFun(){
				var select=document.getElementById("select").value;
				if(select==null||select=="姓名/父母电话/父母姓名"){
					alert("请输入关键字");
					return;
				}
				window.location.href="${pageContext.request.contextPath}/studentSuperManager_select?page=1&select="+select;
			}
		</script>
</HEAD>
<body>
	<span style="color: red;"><s:actionerror /></span>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/superManager/student/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						 <div class="excelBtn">
							<a class="exportId icon-save" style="padding-left:20px;" id="exportButton" title="下载Excel模板" >下载模板</a>
							<a class="importId icon-add" style="padding-left:20px;" id="importButton" title="导入学生信息" >导入数据</a>
						</div>
						 
						 <strong>学生列表</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01"><input type="text" id="select" name="select"
						value="姓名/父母电话/父母姓名"
						onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
						onBlur="if(!value){value=defaultValue;this.style.color='#999'}"
						style="color: #999999"></input> <input type="button" class="button_ok"
						id="selectBtn" value="搜索" onclick="selectFun()"></input>&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- <input type="file" value="导入文件" id="import" name="import" class="button_import" onclick="">&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" id="import" name="import" value="导入" class="button_import" onclick="">导入</button>&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" id="add" name="add" value="新增" class="button_add" onclick="addDean()">新增</button> -->
					</td>
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
								<td align="center" width="8%">姓名</td>
								<td align="center" width="4%">性别</td>
								<td align="center" width="17%">学校</td>
								<td align="center" width="10%">出生年月</td>
								<td align="center" width="8%">父亲姓名</td>
								<td align="center" width="10%">父亲电话</td>
								<td align="center" width="8%">母亲姓名</td>
								<td align="center" width="10%">母亲电话</td>
								<td align="center" width="6%">学生状态</td>
								<td width="7%" align="center">编辑</td>
							</tr>
							<s:if test="pageBean.list.size()>0">
								<p style="color: red;">提示：点击用户的名字可查看用户详细信息。</p>
							</s:if>
							<s:iterator var="s" value="pageBean.list" status="status">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="2%"><s:property value="#status.count" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><a
										href="${pageContext.request.contextPath }/studentSuperManager_info?sid=<s:property value="#s.sid"/>">
											<s:property value="#s.name" />
									</a></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="4%"><s:if test="#s.sex==0">男</s:if> <s:else>女</s:else>
									</td>

									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="17%"><s:property value="#s.school" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="10%"><s:property value="#s.birthday" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#s.father_name" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="10%"><s:property value="#s.father_number" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#s.mother_name" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="10%"><s:property value="#s.mother_number" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="6%"><s:if test="#s.state==0">
													在读
												</s:if> <s:else>
													离校
												</s:else></td>
									<td align="center" style="HEIGHT: 30px"><a
										href="${ pageContext.request.contextPath }/studentSuperManager_edit?sid=<s:property value="#s.sid"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_edit.gif"
											border="0" style="CURSOR: hand">
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
									href="${ pageContext.request.contextPath }/studentSuperManager_findStudentAll?page=1">首页</a>|
									<a
									href="${ pageContext.request.contextPath }/studentSuperManager_findStudentAll?page=<s:property value="pageBean.page-1"/>">上一页</a>|
								</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a
									href="${ pageContext.request.contextPath }/studentSuperManager_findStudentAll?page=<s:property value="pageBean.page+1"/>">下一页</a>|
									<a
									href="${ pageContext.request.contextPath }/studentSuperManager_findStudentAll?page=<s:property value="pageBean.totalPage"/>">尾页</a>|
								</s:if>
						</s:if> <s:else>
							<p style="color: blue; font-size: 20px;">当前还没有录入学生信息。</p>
						</s:else></td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>

