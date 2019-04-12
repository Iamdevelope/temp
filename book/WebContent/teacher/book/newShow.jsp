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
<script type="text/javascript" src="js/PDFObject.js"></script>
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
										<input type="hidden" id="book_type" name="book_type"
										value="<s:property value="book_type"/>"> 
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
									<td height="550">
										<div id="pdf"></div>
										<!-- <a href="http://www.xdocin.com/xdoc?_func=to&_format=html&_cache=1&_xdoc=http://47.102.133.243/book/teachingplans/1.docx" target="_blank" rel="nofollow">XDOC</a> -->
										<!-- <iframe id="word" src='' width='100%' height='100%' frameborder='1'>
										</iframe> -->
										<!-- <iframe id="word" src='https://view.officeapps.live.com/op/view.aspx?src=http://47.102.133.243/book/teachingplans/后台.xls' width='100%' height='100%' frameborder='1'>
										</iframe> -->
									</td>
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
	var iframe = document.getElementById("word");
	var name=document.getElementById("book_name").value;
	var book_type = $("input#book_type").val();
	console.log("------"+book_type);
	img.src="../book/bookImages/"+name+"/01.jpg";
	//iframe.src = "http://47.102.133.243/book/teachingplans/"+name+".html";
	//iframe.src = "https://view.officeapps.live.com/op/view.aspx?src=https://github.com/Iamdevelope/myword/blob/master/"+name+".docx";
	var url = "http://47.102.133.243/book/teachingplans/"+book_type+"/"+name+".pdf";
	var options = {
            height: "550px",
            pdfOpenParams: {view: 'FitV', page: '0' },
            name:"mans",
            fallbackLink: "<p>您的浏览器暂不支持此pdf，请下载最新的浏览器</p>"
        };
	PDFObject.embed(url, "#pdf",options);
}
</script>
</body>
</html>