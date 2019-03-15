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
<script type="text/javascript">
		function addDean(){
			window.location.href="${pageContext.request.contextPath}/bookTeacher_addPage";			
		}
		function selectFun(){
			var select=document.getElementById("select").value;
			if(select==null||select=="书名/类型/班级类型/主题"){
				alert("请输入关键字");
				return;
			}
			window.location.href="${pageContext.request.contextPath}/bookTeacher_select?page=1&select="+select;
		}
	</script>
<title>我的绘本列表</title>
</head>
<body>
	<span style="color: red;"><s:actionerror /></span>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/teacher/book/mylist.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>我的绘本列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01"><input type="text" id="select" name="select"
						value="书名/类型/班级类型/主题"
						onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
						onBlur="if(!value){value=defaultValue;this.style.color='#999'}"
						style="color: #999999"></input> <input type="button" class="button_search"
						id="selectBtn" title="搜索" onclick="selectFun()"></input>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<!-- <p style="color:red;">提示：点击绘本的名字可查看绘本详细信息。</p> -->
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
								<td width="8%" align="center">被使用次数</td>
								<td width="8%" align="center">评价星级</td>
								<td width="8%" align="center">移除</td>
							</tr>
							<s:if test="pageBean.list.size()>0">
								<p style="color: red;">提示：点击绘本的名字可查看绘本详细信息。</p>
							</s:if>
							<s:iterator var="b" value="pageBean.list" status="status">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="2%"><s:property value="#status.count" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="17%"><a
										href="${pageContext.request.contextPath }/bookTeacher_info?bid=<s:property value="#b.bid"/>">
											<s:property value="#b.name" />
									</a></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#b.book_type" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#b.book_class" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#b.book_theme" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#b.book_used_count" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#b.score" /></td>
									<td align="center" style="HEIGHT: 30px"><a
										href="${ pageContext.request.contextPath }/bookTeacher_delete?bid=<s:property value="#b.bid"/>">
											<img
											src="${pageContext.request.contextPath}/images/report2_(delete).gif"
											width="18" height="18" border="0" style="CURSOR: hand"
											title="移除">
									</a></td>
								</tr>
							</s:iterator>
						</table>
					</td>
				</tr>
				<tr align="center">
					<td colspan="7"><s:if test="pageBean.page!=0">
								第<s:property value="pageBean.page" />/<s:property
								value="pageBean.totalPage" />页 
								<s:if test="pageBean.page != 1">
								<a
									href="${ pageContext.request.contextPath }/bookTeacher_findSelfAllBook?page=1">首页</a>|
									<a
									href="${ pageContext.request.contextPath }/bookTeacher_findSelfAllBook?page=<s:property value="pageBean.page-1"/>">上一页</a>|
								</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a
									href="${ pageContext.request.contextPath }/bookTeacher_findSelfAllBook?page=<s:property value="pageBean.page+1"/>">下一页</a>|
									<a
									href="${ pageContext.request.contextPath }/bookTeacher_findSelfAllBook?page=<s:property value="pageBean.totalPage"/>">尾页</a>|
								</s:if>
						</s:if> <s:else>
							<p style="color: blue; font-size: 20px;">您还没有选择所需要使用的绘本，请到绘本列表添加。</p>
						</s:else></td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</html>