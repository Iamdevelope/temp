import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

public class createCdk {
	
	private static final int mask = 23;//大数异或的标
	private static Map<Integer, Integer> base = new HashMap<Integer, Integer>();//参数

	private static Random random = new Random();//随机数
	private static final int MAX_NUM = 10;//生成个数

	private static String prefix = "00";//前缀 可以扩展
	private static Set<String> cdks = new HashSet<>();//用于存储cdks

	public static void main(String[] args) {
	    //测试
	    generateCdks(prefix);
	    for (int i = 0; i < 50; i++) {
	        System.out.println(takeOneCdk());
	    }
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
	        System.out.println("生成的Index为："+indexs.get(i));
	        int random = random(312356055, 2094271335);//给出随机数的范围 这个随便
	        base.put(key, random);
	    }

	    for (int i = 0; i < MAX_NUM; i++) {
	        String string = Long.toString(arithmetics(i), 36);// 10进制转36进制,缩短位数(6位36进制数字即可表示:0-2176782335)
	        System.out.println("生成的字符："+string);
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
	    System.out.println("得到与运算的结果："+idx);
	    int xor = base.get(idx) ^ n;
	    System.out.println("做亦或运算得到的值："+xor);
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
