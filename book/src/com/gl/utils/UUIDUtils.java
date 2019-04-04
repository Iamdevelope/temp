package com.gl.utils;

import java.util.UUID;

/**
 * 生成随机字符串的工具类
 */
public class UUIDUtils {
	/**
	 * 获得随机的字符串
	 */
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	public static String getUUIDStan() {
		return UUID.randomUUID().toString();
	}
	public static String getUUIDNoFormat() {
		return UUID.randomUUID().toString();
	}
	/*
	 * 获取指定范围内的随机数
	 * */
	public static Integer getRandomNum(int min,int max) {
		return (int)(min+Math.random()*(max-min+1));
	}
}
