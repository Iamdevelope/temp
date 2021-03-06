<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/css/Style1.css"
	type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.2.6/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.2.6/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="css/bookInfo.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#book_theme').menubutton({
		menu:'#mm2'
	})
	
});
	function keypress(){
		var text1=document.getElementById("book_abstract").value;
		var len;
		if(text1.length>=300){
			document.getElementById("book_abstract").value=text1.substr(0,300);
			len=0;
		}
		else{
			len=300-text1.length;
		}
		var show="你还可以输入"+len+"个汉字";
		document.getElementById("abstract").innerText=show;
	}
	function check_book_data(){
		console.log("点击了确定按钮");
		var book_name=document.getElementById("bookSuperManager_save_do_logonName").value;
		var book_theme=document.getElementById("bookSuperManager_save_do_logonName").value;
		if(book_name==null||book_name==""){
			alert("绘本名不能为空！");
			return false;
		}
		else if(book_theme==null||book_theme==""){
			alert("必须需要给当前需要添加的绘本指定一个主题！");
			return false;
		}
	}
</script>
</HEAD>

<body>
	<!--  -->
	<form id="teacher_save_do" name="Form1"
		action="${pageContext.request.contextPath}/bookSuperManager_save?btype=<s:property value="type"/>"
		method="post" enctype="multipart/form-data">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="50%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>添加绘本</STRONG> </strong></td>
			</tr>
			<p align="center" style="height: 4px; padding-left: 10px;">
				注：标有<span style="color: red;">*</span>号的内容为必填项
			</p>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本名：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="name" value="" id="bookSuperManager_save_do_logonName"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本类型：
				</td>
				<td class="ta_01" bgColor="#ffffff"><select name="book_type">
						<option value="社会" <s:if test="book_type=='社会'">selected</s:if>
							<s:else>disabled</s:else>>社会</option>
						<option value="语言" <s:if test="book_type=='语言'">selected</s:if>
							<s:else>disabled</s:else>>语言</option>
						<option value="美术" <s:if test="book_type=='美术'">selected</s:if>
							<s:else>disabled</s:else>>美术</option>
						<option value="音乐" <s:if test="book_type=='音乐'">selected</s:if>
							<s:else>disabled</s:else>>音乐</option>
						<option value="健康" <s:if test="book_type=='健康'">selected</s:if>
							<s:else>disabled</s:else>>健康</option>
						<option value="数学" <s:if test="book_type=='数学'">selected</s:if>
							<s:else>disabled</s:else>>数学</option>
						<option value="探究" <s:if test="book_type=='探究'">selected</s:if>
							<s:else>disabled</s:else>>探究</option>
				</select></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本所属班级类型：
				</td>
				<td class="ta_01" bgColor="#ffffff"><select name="book_class">
						<option value="大班">大班</option>
						<option value="中班">中班</option>
						<option value="小班">小班</option>
				</select></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>绘本主题：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input href="javascript:void(0)"
					id="book_theme" iconCls="icon-save" value="大班/中班/小班"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					绘本描述：</td>
				<td class="ta_01" bgColor="#ffffff"><textarea
						id="book_abstract" rows="5" cols="30" name="book_abstract"
						onKeyDown="keypress()" onblur="keypress()"><s:property
							value="model.book_abstract" /></textarea> <font color="gray"><label
						id="abstract"></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="bookSuperManager_save_do_submit" onclick="return check_book_data()"
						value="确定" class="button_ok">&#30830;&#23450;</button> <FONT
					face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <INPUT
					class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"></span>
				</td>
			</tr>
		</table>
	</form>
	
	<div id="mm2" class="gl_tab_panel">
		<div class="gl_service_panel">
			<h5><a href="javascript:void(0)">大班</a></h5>
			<p>
				<a href="javascript:void(0)">我真棒!</a>
				<a href="javascript:void(0)">好玩的过家家</a>
				<a href="javascript:void(0)">听到了什么</a>
				<a href="javascript:void(0)">小兔不要怕</a>
			</p>
		</div>
		<div class="gl_service_panel">
			<h5><a href="javascript:void(0)">中班</a></h5>
			<p>
				<a href="javascript:void(0)">我真棒!</a>
				<a href="javascript:void(0)">好玩的过家家</a>
				<a href="javascript:void(0)">听到了什么</a>
				<a href="javascript:void(0)">小兔不要怕</a>
			</p>
		</div>
		<div class="gl_service_panel">
			<h5><a href="javascript:void(0)">小班</a></h5>
			<p>
				<a href="javascript:void(0)">我真棒!</a>
				<a href="javascript:void(0)">好玩的过家家</a>
				<a href="javascript:void(0)">听到了什么</a>
				<a href="javascript:void(0)">小兔不要怕</a>
			</p>
		</div>
		<div id="addPage">
			<a  title="新增单本绘本信息" >新增绘本</a>
		</div>
		<div id="importBtn">
			<a title="导入绘本信息">导入绘本信息</a>
		</div>
	</div>
</body>
</HTML>