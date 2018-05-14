package com.keymao.utils;

public class RandomUtils {
	public static String generate4Random(){
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<4;i++){
			sb.append((int)(Math.random()*10));
		}
		return sb.toString();
	}
	
	public static void main(String[] args) {
		System.out.println(generate4Random());
	}
}
