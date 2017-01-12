package com.my.app.api;

/**
 * 
 * @author luoyh
 * @date Nov 1, 2016
 */
public class E {
	
	public static void main(String[] args) {
		System.out.println(fen2yuan(100));
	}

	
	private static String fen2yuan(int val) {
		String v = val + "";
		int len = v.length();
		if(len == 0) {
			return "0.00";
		}
		if(len == 1) {
			return "0.0"+v;
		}
		if(len == 2) {
			return "0."+v;
		}
		return v.substring(0, len - 2) + "." + v.substring(len - 2);
	}
}
