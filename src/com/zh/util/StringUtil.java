package com.zh.util;

public class StringUtil {
	//验证输入的参数是否为空
	public static boolean validateNull(String args){
		if(args == null || args.length() ==0){
			return true;
		}
		else{
			return false;
		}
	}
	//判断source参数的值是否为空 或者内容为空
	public static String chanageNull(String source, String target){
		if(source == null || source.length() ==0 || source.equalsIgnoreCase("null")){
			return target;
		}
		else{
			return source;
		}
	}
	//对输入的参数中敏感字符进行过滤替换
	public static String filterHtml(String input) {
		if(input == null){
			return null;
		}
		if(input.length() == 0){
			return input;	
		}
		input = input.replaceAll("&", "&amp;");
		input = input.replaceAll("<", "&lt;");
		input = input.replaceAll(">", "&gt;");
		input = input.replaceAll(" ", "&nbsp;");
		input = input.replaceAll("'", "&#39;");
		input = input.replaceAll("\"", "&quot;");
		
		return input.replaceAll("\n", "<br>");
	}
}
