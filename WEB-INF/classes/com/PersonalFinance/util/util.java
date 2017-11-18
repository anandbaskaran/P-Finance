package com.PersonalFinance.util;

public class util {
	public static double value2double(Object object) {
		if(object instanceof Double){
			return (double) (object != null ? object : 0);
		}else if(object instanceof Long){
			return value2double(((Long) object).doubleValue()) ;
		}else{
			System.out.println("Invalid type in nullableDouble. My Instance = "+object);
			return 0;
		}
	}
}
