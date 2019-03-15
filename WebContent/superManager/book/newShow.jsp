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
</head>
<body onload="loadPage();">
	<div class="book_box" style="z-index: 0">
		<div class="book_content flipbook"></div>
		<div id="cover" class="cover">
			<img id="firstPage" style="height: 680px; width: 1136px;" src="" />
		</div>
		<div class="Shadow"></div>
		<ul class="bookmark">
			<li class="mark_02" data-id="2">返回</li>
		</ul>
	</div>
	<div class="book_name">
		<input type="hidden" id="bid" name="bid"
			value="<s:property value="model.bid"/>" /> <input type="hidden"
			id="bookImg_path" name="bookImg_path"
			value="<s:property value="model.bookImg_path"/>"> <input
			type="hidden" id="book_path" name="book_path"
			value="<s:property value="model.book_path"/>"> <input
			type="hidden" id="book_type" value="<s:property value="model.type"/>" />
			<input type="hidden" id="book_name" value="<s:property value="model.name" />"/>
		<p>
			<s:property value="model.name" />
		</p>
	</div>

	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/turn.js"></script>
	<script type="text/javascript" src="js/mybase.js"></script>
	<script type="text/javascript">
$('.bookmark').on('click','li',function(){
    var self = $(this),
        id = self.attr('data-id'),
        bid = $("input#bid").val(),
    	book_type = $("input#book_type").val();
    book_type=parseInt(book_type,10);
    if(id==2){
    	window.location.href="${pageContext.request.contextPath}/bookSuperManager_findBookAll?btype="+book_type+"&page=1";
    }
})
function loadPage(){
	var img=document.getElementById("firstPage");
	var name=document.getElementById("book_name").value;
	img.src="../book/images/"+name+"/01.jpg";
}
</script>
</body>
</html>