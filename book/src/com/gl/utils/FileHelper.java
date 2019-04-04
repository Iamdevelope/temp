package com.gl.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.gl.model.TeacherBook;

public class FileHelper {
	
	public static List<String> traverseFolder(String path){
		System.out.println("选中的绘本路径："+path);
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
			}else if((f.getName().endsWith(".png")||f.getName().endsWith(".jpg"))&&!f.getName().equals("fengmian.jpg")) {
				list.add(f.getName());
			}
		}
		Collections.sort(list, new Comparator<String>() {
			@Override
			public int compare(String s1,String s2) {
				String n1 = s1.substring(0, s1.length()-4);
				String n2 = s2.substring(0, s2.length()-4);
				
				return Integer.parseInt(n1)-Integer.parseInt(n2);
			}
		});
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
		return list;
	}
	
	public static void generateTeacherBookFile(String teacherName,List<TeacherBook> datas) {
		
	}
}
