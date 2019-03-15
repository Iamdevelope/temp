<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<%-- <script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script> --%>
<script type="text/javascript">
			function addDean(){
				window.location.href="${pageContext.request.contextPath}/teacherDean_addPage";
			}
			function selectFun(){
				var select = document.getElementById("select").value;
				if(select==null||select=="用户名/电话/姓名"){
					alert("请输入关键字");
					return;
				}
				window.location.href="${pageContext.request.contextPath}/teacherDean_select?page=1&select="+select;
			}
			function importFun(){
				var excel=document.getElementById("import").value;
				if(excel==""){
					alert("请选择Excel文件再进行上传！");
				}
				else if(excel.lastIndexOf(".xls")<0){
					alert("只能上传Excel文件！");
				}
				else{
					alert(excel);
					//window.location.href="${pageContext.request.contextPath}/managerSuperManager_importExcel?excelPath="+excel;
				}
			}
			
		</script>
</HEAD>
<body>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/dean/teacher/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<span style="color: red;"><s:actionerror /></span>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<button style="position:absolute;left:6px;background-color: #DAE6FF;">下载模板</button> <strong>教师列表</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01"><input type="text" id="select" name="select"
						value="用户名/电话/姓名"
						onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
						onBlur="if(!value){value=defaultValue;this.style.color='#999'}"
						style="color: #999999"></input> <input type="button" class="button_ok"
						id="selectBtn" name="selectBtn" value="搜索" onclick="selectFun()"></input>&nbsp;&nbsp;&nbsp;&nbsp;
						
						<button type="button" id="import" name="import" value="导入"
							class="button_ok" onclick="importFun()">导入</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" id="add" name="add" value="新增"
							class="button_ok" onclick="addDean()">新增</button></td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<!-- <p style="color:red;">提示：点击用户的名字可查看用户详细信息。</p> -->
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="3%">序号</td>
								<td align="center" width="8%">姓名</td>
								<td align="center" width="8%">电话号码</td>
								<td align="center" width="8%">用户名</td>
								<td align="center" width="17%">学校</td>
								<td align="center" width="10%">邮箱</td>
								<td align="center" width="8%">上课时长</td>
								<td align="center" width="11%">注册时间</td>
								<td align="center" width="8%">上级</td>
								<td align="center" width="8%">是否有效</td>
								<td width="7%" align="center">编辑</td>
								<td width="7%" align="center">删除</td>
							</tr>
							<s:if test="pageBean.list.size()>0">
								<p style="color: red;">提示：点击用户的名字可查看用户详细信息。</p>
							</s:if>
							<s:iterator var="t" value="pageBean.list" status="status">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="3%"><s:property value="#status.count" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><a
										href="${pageContext.request.contextPath }/teacherDean_info?tid=<s:property value="#t.tid"/>">
											<s:property value="#t.name" />
									</a></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#t.phone_number" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#t.username" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="17%"><s:property value="#t.school" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="10%"><s:property value="#t.email" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#t.class_time" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="11%"><s:property value="#t.create_time" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#t.dean.getName()" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:if test="#t.isdelete==0">是</s:if> <s:else>否</s:else>
									</td>
									<td align="center" style="HEIGHT: 30px"><a
										href="${ pageContext.request.contextPath }/teacherDean_editPage?tid=<s:property value="#t.tid"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_edit.gif"
											border="0" style="CURSOR: hand">
									</a></td>

									<td align="center" style="HEIGHT: 30px"><a
										href="${ pageContext.request.contextPath }/teacherDean_delete?tid=<s:property value="#t.tid"/>">
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
									href="${ pageContext.request.contextPath }/teacherDean_findTeacherAll?page=1">首页</a>|
									<a
									href="${ pageContext.request.contextPath }/teacherDean_findTeacherAll?page=<s:property value="pageBean.page-1"/>">上一页</a>|
								</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a
									href="${ pageContext.request.contextPath }/teacherDean_findTeacherAll?page=<s:property value="pageBean.page+1"/>">下一页</a>|
									<a
									href="${ pageContext.request.contextPath }/teacherDean_findTeacherAll?page=<s:property value="pageBean.totalPage"/>">尾页</a>|
								</s:if>
						</s:if> <s:else>
							<p style="color: blue; fond-size: 20px;">您还没有录入教师信息。</p>
						</s:else></td>
				</tr>

			</TBODY>
		</table>
	</form>
</body>
</HTML>

