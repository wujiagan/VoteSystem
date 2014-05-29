package com.util;

import java.io.UnsupportedEncodingException;

public class TransCodeTool {
	public static String toUTF(String str){
		if(null == str)
			str = "";
		try {
			str = new String(str.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			str = "";
		}
		return str;
	}
}
