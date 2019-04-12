package com.gl.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeHelper {
	private static Date date=new Date();
	private static SimpleDateFormat dateFormat;
	public static String getCurrentTime() {
		Date date=new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(date);
	}
	public static String getCurrentYear(Integer num) {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DATE);
		int hour = calendar.get(Calendar.HOUR);
		int minute = calendar.get(Calendar.MINUTE);
		int second = calendar.get(Calendar.SECOND);
		System.out.println("当前时间："+(year+num)+"-"+month+"-"+day+" "+hour+":"+minute+":"+second);
		return (year+num)+"-"+(month+1)+"-"+day+" "+hour+":"+minute+":"+second;
	}
}