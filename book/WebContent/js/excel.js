/**
 * Excel导入导出
 */
function importData(){
		
		var importPath=$('input#fileInput').val();
		console.log("当前选中的Excel路径为："+importPath);
		if(importPath==""){
			$.messager.alert('提示信息','请选中好需要上传的文件再点击上传按钮！');
			return false;
		}else if(importPath.lastIndexOf(".xls")<0){//判断上传的文件是否为excel文件
			$.messager.alert('提示信息','只能上传Excel文件！');
			return false;
		}
		console.log("导入按钮被点击了");
	}
function importWordData(){
	var word=$('input#wordInput').val();
	if(word==""){
		$.messager.alert('提示信息','请选择好需要上传的文件再进行上传。');
		return false;
	}else if(word.lastIndexOf(".doc")<0){
		$.messager.alert('提示信息','只能上传Word文档！');
		return false;
	}
	console.log("正在上传绘本教案Word文档信息");
	
}
