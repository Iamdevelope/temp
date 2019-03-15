/**
 * Excel导入导出
 */
$(function(){
		$('#exportButton').click(function(){
			window.location.href = "${pageContext.request.contextPath}/modelDownload?templateId=manager";
		});
		$('importButton').click(function(){
			$('#importModel').dialog('open');
		});
	});