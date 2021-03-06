<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<style type="text/css">
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
		console.log("当前点击的按钮编号为："+classType+"当前绘本类型为："+btype);
		if(classType==0){
			window.location.href="${pageContext.request.contextPath}/bookTeacher_find?page=1&bclass=0&btype="+btype;		
		}else if(classType==1){
			window.location.href="${pageContext.request.contextPath}/bookTeacher_find?page=1&bclass=1&btype="+btype;
		}
		else if(classType==2){
			window.location.href="${pageContext.request.contextPath}/bookTeacher_find?page=1&bclass=2&btype="+btype;
		}
		})
	});
	
	function selectFun(){
		var select=document.getElementById("select").value;
		var btype=document.getElementById("btype").value;
		console.log("**********绘本类型："+btype);
		if(select==null||select=="书名/类型/班级类型/主题"){
			alert("请输入关键字");
			return;
		}
		window.location.href="${pageContext.request.contextPath}/bookTeacher_select?page=1&select="+select+"&btype="+btype;
	}
</script>
<title>绘本列表</title>
</head>
<body>
	<span style="color: red;"><s:actionerror /></span>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/teacher/book/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>绘本列表</strong>
					<input type="hidden" id="btype" value="<s:property value="type"/>">
					</TD>
				</tr>
				<tr>
					<td class="ta_01"><span>关键词：</span><input type="text" id="select" name="select"
						value="书名/类型/班级类型/主题"
						onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
						onBlur="if(!value){value=defaultValue;this.style.color='#999'}"
						style="color: #999999"></input> <input type="button" class="button_search"
						id="selectBtn" title="搜索" onclick="selectFun()"></input>&nbsp;&nbsp;&nbsp;&nbsp;
						
						<div>
							<ul class="classType">
								<li data-id="0">大班</li>
								<li data-id="1">中班</li>
								<li data-id="2">小班</li>
							</ul>
							<p style="left:20px;color: red;">提示：点击绘本的名字可查看绘本详细信息。</p>
						</div>
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
								<td width="8%" align="center">被使用次数</td>
								<td width="8%" align="center">评价星级</td>
								<td width="8%" align="center">操作</td>
							</tr>

							<c:forEach var="b" items="${pageBean.list}">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="2%">${b.bid }</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="17%"><a
										href="${pageContext.request.contextPath }/bookTeacher_show?bid=${b.bid }&btype=${b.type}">
											${b.name }
									</a></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%">${b.book_type }</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%">${b.book_class }</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%">${b.book_theme }</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%">${b.book_used_count }</td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="10%">
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
									<td align="center" style="HEIGHT: 30px"><c:if
											test="${b.isadd==0}">
													已添加
												</c:if> <c:if test="${b.isadd==1 }">
											<a
												href="${ pageContext.request.contextPath }/bookTeacher_add?bid=${b.bid}">
												<img src="${pageContext.request.contextPath}/images/add.gif"
												border="0" style="CURSOR: hand" title="添加">
											</a>
										</c:if></td>
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
									href="${ pageContext.request.contextPath }/bookTeacher_findBookAll?page=1">首页</a>|
									<a
									href="${ pageContext.request.contextPath }/bookTeacher_findBookAll?page=<s:property value="pageBean.page-1"/>">上一页</a>|
								</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a
									href="${ pageContext.request.contextPath }/bookTeacher_findBookAll?page=<s:property value="pageBean.page+1"/>">下一页</a>|
									<a
									href="${ pageContext.request.contextPath }/bookTeacher_findBookAll?page=<s:property value="pageBean.totalPage"/>">尾页</a>
								</s:if>
						</s:if> <s:else>
							<p style="color: blue; font-size: 20px;">当前还没有绘本导入，敬请期待。</p>
						</s:else></td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</html>