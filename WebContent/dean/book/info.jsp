<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bookInfo.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript">
			function show(){
				var bid=document.getElementById("bid").value;
				var btype=document.getElementById("type").value;
				alert("显示出框架："+bid)
				window.location.href="${pageContext.request.contextPath}/bookDean_show?bid="+bid+"&btype="+btype;
			}
			function load(){
				var img=document.getElementById("fengmian");
				var name=document.getElementById("book_name").value;
				img.src="../book/images/"+name+"/fengmian.jpg";
			}
		</script>
</HEAD>

<body onload="load()">
	<div class="book">
		<a
			href="${ pageContext.request.contextPath }/bookDean_show?bid=<s:property value="model.bid"/>&btype=<s:property value="model.type"/>">
			<img id="fengmian" alt="绘本封面" title="点击查看详细信息" id="book"
			src=""
			style="margin-top: 8px; margin-left: 8px; width: 480px; height: 580px;">
		</a>
	</div>
	<div class="book_context">
		<form id="bookSuperManager_save_do" name="Form1">
			<input type="hidden" id="bid" value="<s:property value="model.bid"/>" />
			<input type="hidden" id="book_name" value="<s:property value="model.name"/>"/>
			<input type="hidden" id="type"
				value="<s:property value="model.type"/>" /> &nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center"
				bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26"><strong><STRONG>绘本信息</STRONG> </strong></td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">绘本名：</td>
					<td bgColor="#ffffff"><s:property value="model.name" /></td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">绘本类型：</td>
					<td bgColor="#ffffff"><s:property value="model.book_type" /></td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">绘本所属班级类型：</td>
					<td bgColor="#ffffff"><s:property value="model.book_class" />
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">绘本路径：</td>
					<td bgColor="#ffffff"><s:property value="model.book_path" /></td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">绘本使用时长：</td>
					<td bgColor="#ffffff"><s:property value="model.book_used_time" />
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">绘本主题：</td>
					<td bgColor="#ffffff"><s:property value="model.book_theme" />
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">绘本使用次数：</td>
					<td bgColor="#ffffff"><s:property
							value="model.book_used_count" /></td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">绘本添加时间：</td>
					<td bgColor="#ffffff"><s:property value="model.addtime" /></td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe">绘本描述：</td>
					<td bgColor="#ffffff" style="align: left;"><textarea rows="5"
							cols="60" name="book_type" readonly="readonly"><s:property
								value="model.book_abstract" /></textarea></td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4"><input type="button" class="button_ok"
						onclick="show()" value="预览" /> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT style="position: center;" type="hidden"
						class="button_cancel" /> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" /> <span
						id="Label1"></span></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</HTML>