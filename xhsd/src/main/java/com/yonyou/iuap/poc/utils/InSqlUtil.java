package com.yonyou.iuap.poc.utils;

public class InSqlUtil {
	
	public static String getInSubSql(String[] values) {
		String subSql = "";
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < values.length; i++) {
			sb.append("'").append(values[i]).append("',");
		}
		subSql = sb.toString();
		subSql = " (" + subSql.substring(0, subSql.length() - 1) + ") ";
		return subSql;
	}

}
