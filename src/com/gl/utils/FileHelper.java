package com.gl.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileHelper {
	
	public static List<String> traverseFolder(String path){
		File file = new File(path);
		List<String> list = new ArrayList();
		if(!file.exists()) {
			//判断该路径是否存在
			return null;
		}
		File[] files = file.listFiles();
		if(files==null||files.length==0) {
			return null;
		}
		for(File f : files) {
			if(f.isDirectory()) {
				//如果该文件为文件夹，则继续递归遍历
				list = traverseFolder(f.getAbsolutePath());
			}else if((f.getName().endsWith(".png")||f.getName().endsWith(".jpg"))&&!f.getName().endsWith("fengmian.jpg")) {
				list.add(f.getName());
			}
		}
		return list;
	}
}
