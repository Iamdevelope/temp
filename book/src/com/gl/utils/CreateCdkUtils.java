package com.gl.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

public class CreateCdkUtils {
	private static final int mask = 23;//大数异或的标
	private static Map<Integer, Integer> base = new HashMap<Integer, Integer>();//参数

	private static Random random = new Random();//随机数
	private static final int MAX_NUM = 10;//生成个数

	private static String prefix = "00";//前缀 可以扩展
	private static Set<String> cdks = new HashSet<>();//用于存储cdks
	private static Long dest = 2L;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
	    //测试
	    /*generateCdks(prefix);
	    for (int i = 0; i < 50; i++) {
	        System.out.println(takeOneCdk());
	    }*/
		String temp = generateCode(27,Long.valueOf("12345678902"),10);
		
	    System.out.println(temp);
	}
	public static String generateCode(Integer pf,Long num,int index) {
		int temp = pf & 1001;
		
		String p = Long.toString(temp);
		generateCdks(p);
		String prefix = takeOneCdk();
		String time = generateCode();
		String phone = Long.toString(num,16);
		String suffix = suffixToString(index*6688);
		String result = prefix+"-"+time+"-"+phone+"-"+suffix;
		result = result.toUpperCase();
		result = result.replaceAll("O", "o");
		return result;
	}
	private static String suffixToString(int digits) {
		int temp = digits ^ 0xff;
		return Long.toString(temp*32,16);
	}
	private static int[] getTime(String time) {
		int[] results = new int[6];
		String[] s1 = time.split(" ");
		String[] s2 = s1[0].split("-");
		for(int i=0;i<s2.length;i++) {
			results[i]=Integer.parseInt(s2[i]);
		}
		String[] s3 = s1[1].split(":");
		for(int i=3;i<s3.length*2;i++) {
			results[i]=Integer.parseInt(s3[i-3]);
		}
		return results;
	}
	private static String generateCode() {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONDAY);
		int day = calendar.get(Calendar.DATE);
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		int minute = calendar.get(Calendar.MINUTE);
		int second = calendar.get(Calendar.SECOND);
		year = year % UUIDUtils.getRandomNum(20, 99);
		month = month * UUIDUtils.getRandomNum(16, 36);
		day = day * UUIDUtils.getRandomNum(16, 20);
		return toString(year,(month+1),day,hour,minute,second);
	}
	private static String toString(int ...is) {
		String temp = "";
		for(int i:is) {
			temp+=intToString(i);
		}
		return temp;
	}
	private static String intToString(int i) {
		return Long.toString(i,16);
	}

	/**
	 * 生成cdks
	 * base数组数据采用每次随机的方式,仅为了在每一组所产生的的cdk的后缀不相同
	 * @param prefix
	 */
	private static void generateCdks(String prefix) {
	    List<Integer> indexs = new ArrayList<>(Arrays.asList(0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 23, 25));
	    for (int i = 0; i < indexs.size(); i++) {
	        int key = indexs.get(i);
	        int random = random(312356055, 2094271335);//给出随机数的范围 这个随便
	        base.put(key, random);
	    }

	    for (int i = 0; i < MAX_NUM; i++) {
	        String string = Long.toString(arithmetics(i), 36);// 10进制转36进制,缩短位数(6位36进制数字即可表示:0-2176782335)
	        if (string.length() == 6) {
	            cdks.add(prefix + string);//拼接结果
	        }
	    }
	}

	/**
	 * Arithmetics 具体的原理不做赘述了
	 * @param n
	 * @return
	 */
	private static int arithmetics(int n) {
	    int idx = n & mask;
	    int xor = base.get(idx) ^ n;
	    return ((xor | mask) ^ mask) | idx;
	}

	/**
	 * 获取一个cdk
	 * @return
	 */
	private static String takeOneCdk() {
	    String str = "";
	    Iterator<String> iterator = cdks.iterator();
	    while (iterator.hasNext()) {
	        str = iterator.next();
	        break;
	    }
	    if(str == null){
	        return null;
	    }
	    cdks.remove(str);
	    //记录前缀,使用完后,前缀进1,后缀重新生成
	    String prePrefix = prefix;
	    long cdkLength = cdks.size();
	    if (cdkLength == 0) {
	        //此部分可以,启用新的线程进行处理(PS:同步处理)
	        String nextPrefix = String.format("%02d", Integer.parseInt(prePrefix) + 1);
	        generateCdks(nextPrefix);
	        prefix = nextPrefix;
	    }
	    return str;
	}


	private static int random(int i, int j) {
	    return random.nextInt(j + 1 - i) + i;
	}
}
