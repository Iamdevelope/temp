<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<link href="${pageContext.request.contextPath }/images/favicon.ico"
	rel="shortcut icon">
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
	<script type="text/javascript" src="js/excel.js"></script>
<script type="text/javascript">
	$(function(){
		$('#downloadModel').click(function(){
			window.location.href = "${pageContext.request.contextPath}/modelDownload?templateId=dean";
		});
		$('#downloadData').on('click',function(){
			window.location.href = "${pageContext.request.contextPath}/deanSuperManager";
		});
		$('#importBtn').on('click',function(){
			$('#importModel').dialog('open');
		});
		$('#md2').menubutton({
			menu:'#mm2'
		});
		$('#md1').menubutton({
			menu:'#mm1'
		});
		$('#addPage').on('click',function(){
			$('#addModel').dialog('open');
		});
		$('input#selectBtn').on('click',function(){
			var select=$('input#select').val();
			var reg=/[`~!@#$%^&*()_+<>?:"{},.\/;'[\]]/im;
			if(reg.test(select)){
				$.messager.alert('提示信息','关键字中存在非法字符');
				return;
			}
			if(select==null||select=="用户名/电话/姓名"){
				$.messager.alert('提示信息','请输入关键字');
				return;
			}
			window.location.href="${pageContext.request.contextPath}/deanSuperManager_select?page=1&select="+select;
		});
	});
	function check_dean_data(){
		var dean_name=document.getElementById("dean_save_do_name").value;
		var dean_num=document.getElementById("dean_save_do_phone_number").value;
		var dean_school=document.getElementById("dean_save_do_school").value;
		var dean_email=document.getElementById("dean_save_do_email").value;
		if(dean_name==""||dean_name==null){
			alert("新增的园长姓名不能为空！");
			return false;
		}
		else if(!(/^[1][3,4,5,7,8][0-9]{9}$/.test(manager_num))){
			alert("输入的电话号码格式不正确，请重新输入！");
			return false;
		}
		else if(dean_school==""||dean_school==null){
			alert("新增的园长的学校不能为空！");
			return false;
		}
		if(dean_email!=null){
			if(!(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(dean_email))){
				alert("输入的邮箱格式不正确，请重新输入！");
				return false;
			}
		}
		return true;
	}
	</script>
</HEAD>
<body>
	<div>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/superManager/dean/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						 <div class="excelBtn">
							<a class="exportId" style="padding-left:20px;" id="md1" iconCls="icon-save" title="下载Excel模板" >下载数据</a>
							<a class="importId icon-add" style="padding-left:20px;" id="md2" iconCls="icon-add" title="导入园长信息" >导入数据</a>
						</div> 
						 <strong>园长列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01"><span>关键词：</span><input type="text" id="select" name="select"
						value="用户名/电话/姓名"
						onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
						onBlur="if(!value){value=defaultValue;this.style.color='#999'}"
						style="color: #999999"></input> <input class="button_search" id="selectBtn" type="button" title="搜索" />
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
								<td align="center" width="17%">学校</td>
								<td align="center" width="10%">邮箱</td>
								<td align="center" width="8%">已添加教师</td>
								<td align="center" width="6%">是否有效</td>
								<td width="7%" align="center">编辑</td>
								<td width="7%" align="center">删除</td>
							</tr>
							<s:if test="pageBean.list.size()>0">
								<p style="color: red;">提示：点击用户的名字可查看用户详细信息。</p>
							</s:if>
							<s:iterator var="d" value="pageBean.list" status="status">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="2%"><s:property value="#status.count" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><a
										href="${pageContext.request.contextPath }/deanSuperManager_info?did=<s:property value="#d.did"/>">
											<s:property value="#d.name" />
									</a></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#d.phone_number" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="8%"><s:property value="#d.shop_username" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="17%"><s:property value="#d.school" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="10%"><s:property value="#d.email" /></td>
									<td style="CURSOR: hand; HEIGHT: 30px" align="center"
										width="7%"><s:property value="#d.registed_count" />/<s:property
											value="#d.can_regist_count" /></td>
									<td style="CURSOR: hand; height: 30px" align="center"
										width="6%"><s:if test="#d.isdelete==0">是</s:if> <s:else>否</s:else>
									</td>
									<td align="center" style="HEIGHT: 30px"><a
										href="${ pageContext.request.contextPath }/deanSuperManager_editPage?did=<s:property value="#d.did"/>">
											<img
											src="${pageContext.request.contextPath}/images/i_edit.gif"
											border="0" style="CURSOR: hand">
									</a></td>

									<td align="center" style="HEIGHT: 30px"><a
										href="${ pageContext.request.contextPath }/deanSuperManager_delete?did=<s:property value="#d.did"/>">
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
									href="${ pageContext.request.contextPath }/deanSuperManager_findDeanAll?page=1">首页</a>|
									<a
									href="${ pageContext.request.contextPath }/deanSuperManager_findDeanAll?page=<s:property value="pageBean.page-1"/>">上一页</a>|
								</s:if>
							<s:if test="pageBean.page != pageBean.totalPage">
								<a
									href="${ pageContext.request.contextPath }/deanSuperManager_findDeanAll?page=<s:property value="pageBean.page+1"/>">下一页</a>|
									<a
									href="${ pageContext.request.contextPath }/deanSuperManager_findDeanAll?page=<s:property value="pageBean.totalPage"/>">尾页</a>
								</s:if>
						</s:if> 
						<div>
							<span style="color: red;font-size:20px;"><s:actionerror /></span>
						</div>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
	</div>
	
	<div class="easyui-dialog" title="导入Excel数据" id="importModel" draggable=true modal=true closed=true style="display:black;width:350px;height:200px" >
		<form id="importForm" action="${pageContext.request.contextPath }/deanSuperManager_importData" enctype="multipart/form-data" method="post">
    		<table>
    			<tr>
    				<td>浏览:</td>
    				<td>
    					<input id="fileInput" name="fileInput" type="file" />
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2">
    					<input type="submit" onclick="return importData()" id="uploadBtn" class="easyui-linkbutton" value="导入"/>
    				</td>
    			</tr>
    		</table>
    	</form>
	</div>
	
	<div class="easyui-dialog" title="新增园长信息" id="addModel" draggable=true modal=true closed=true style="display:black;width:630px;height:260px" >
		<form id="dean_save_do" name="Form1"
		action="${pageContext.request.contextPath}/dean_regist"
		method="post" enctype="multipart/form-data">
		<table cellSpacing="1" cellPadding="5" height="100%" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>姓名：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="name" value="" id="dean_save_do_name" class="bg" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>密码：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="password" value="000000" id="dean_save_do_password"
					class="bg" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>手机号码：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="phone_number" value="" id="dean_save_do_phone_number" class="bg" />
				</td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>学校：
				</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="school" value="" id="dean_save_do_school" class="bg" /></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					<span style="color: red;">*</span>性别：
				</td>
				<td class="ta_01" bgColor="#ffffff"><select name="sex">
						<option value="0">男</option>
						<option value="1">女</option>
				</select></td>
			</tr>
			<tr>
				<td width="50%" align="center" bgColor="#f5fafe" class="ta_01">
					邮箱：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="email" value="" id="dean_save_do_email" class="bg" /></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<button type="submit" id="dean_save_do_submit" value="确定" onclick="return check_dean_data()"
						class="button_ok">&#30830;&#23450;</button> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	
	<div id="mm1" style="width:8%;">
		<div id="downloadModel">
			<a  title="下载园长Excel表模板" >下载Excel模板</a>
		</div>
		<div id="downloadData">
			<a title="下载园长信息">导出数据</a>
		</div>
	</div>
	<div id="mm2" style="width:12%;">
		<div id="addPage">
			<a title="新增一个院长信息" >新增院长</a>
		</div>
		<div id="importBtn">
			<a title="导入院长信息">导入数据</a>
		</div>
	</div>
</body>
</HTML>

