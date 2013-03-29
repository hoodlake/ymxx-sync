package com.ymxx.jweb.util;

public class StringUtil {

	private StringUtil(){}
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 */
	public static Boolean isBlank(String str){
		
		return str == null || "".equals(str.trim())?true:false;
	}
}
