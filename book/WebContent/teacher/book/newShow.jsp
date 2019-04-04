<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>翻书效果</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mybase.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bookInfo.css">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
</head>
<body onload="loadPage()">
	<div>
		<form>
			<table align="center" >
				<tr>
					<td>
						<div class="gl_book_show">
							
							<div class="book_box" style="z-index: 0">
								<div class="book_name">
									<input type="hidden" id="bid" name="bid"
										value="<s:property value="model.bid"/>" /> <input type="hidden"
										id="bookImg_path" name="bookImg_path"
										value="<s:property value="model.bookImg_path"/>"> <input
										type="hidden" id="book_path" name="book_path"
										value="<s:property value="model.book_path"/>"> 
										<input type="hidden" id="book_name" value="<s:property value="model.name" />"/>
									<p>
										<s:property value="model.name" />
									</p>
								</div>
								<div class="book_content flipbook"></div>
								<div class="gl_flipbook">
									
								</div>
								<div class="gl_skip_page"></div>
								<div id="cover" class="cover">
									<img id="firstPage" style="height: 340px; width: 568px;"
										src="" />
								</div>
								<ul class="bookmark">
									<s:if test="model.isadd==0">
										<li class="mark_03" data-id="3">已添加</li>
									</s:if>
									<s:else>
										<li class="mark_01" data-id="1">添加</li>
									</s:else>
									<li class="mark_02"><a onclick="history.go(-1)">返回</a></li>
								</ul>
							</div>
						</div>
					</td>
					<td>
						<div class="gl_book_content">
							<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border:1px solid #8ba7e3" border="0">
								<tr>
									<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4" height="26">
										<strong>教案信息</strong>
									</td>
								</tr>
								<tr>
									
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div class="gl_book_assess">
		<form>
			<table>
				<tr>
					<td>
						<p>备注：</p>						
					</td>
					<td>
						<textarea style="resize:none; margin-bottom:10px;" rows="5" cols="60" autofocus="autofocus"></textarea><br/>						
					</td>
				</tr>
				<tr>
					<td></td>
					<td align="center">						
						<span id="submit" >提交</span>
					</td>
				</tr>
			</table>
		</form>
		
	</div>

	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/turn.js"></script>
	<script type="text/javascript" src="js/mybase.js"></script>
	<script type="text/javascript">
$('.bookmark').on('click','li',function(){
    var self = $(this),
        id = self.attr('data-id'),
        bid = $("input#bid").val();
    if(id==1){
    	window.location.href="${pageContext.request.contextPath}/bookTeacher_add?bid="+bid;
    }
});

function loadPage(){
	var img=document.getElementById("firstPage");
	var name=document.getElementById("book_name").value;
	img.src="../book/images/"+name+"/01.jpg";
}
</script>
</body>
</html>