package com.keymao.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class TimeUtils {
	public static String getTimestamp(){
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar calendar = Calendar.getInstance();
		String dateName = df.format(calendar.getTime());
		return dateName;
	}
	
	public static void main(String[] args) {
		System.out.println(TimeUtils.getTimestamp());
	}
}
