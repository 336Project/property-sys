package com.property.sys.utils;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Properties;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import com.sun.org.apache.xml.internal.security.utils.Base64;

public class SysUtils {
	
	/**
	 * 
	 * 2015-1-16 上午10:07:15
	 * @param d
	 * @return 
	 * TODO 格式化金额，保留两位小数
	 */
	public static String getMoneyFormat(double d){
		DecimalFormat df=new DecimalFormat("#.##");
		return df.format(d);
	}
	/**
	 * 
	 * 2015-1-8 下午1:22:44
	 * @param date
	 * @return 
	 * TODO 获取格式化后的时间字符串
	 */
	public static String getDateFormat(Date date){
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
		return format.format(date);
	}
	/**
	 * 判断是否是数�?
	 * @param isNumber
	 * @return
	 */
	public static Boolean isInt(String isNumber){
		try {
			Integer.parseInt(isNumber);
		} catch (NumberFormatException e) {
			// TODO: handle exception
			return false;
		}
		return true;
	}
	
	/***
	 * base64加密
	 * 
	 * @param password
	 *            �?��加密的密�?
	 * @return 加密后的结果
	 */
	public static String encrypt(String password) {
		if(password==null){
			return password;
		}
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			int size = password.length() / 2;
			md.update((password + (size != 0 ? password.substring(size - 1, size) : "")).getBytes());
			return Base64.encode(md.digest());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return password;
	}
	/**
	 * 
	 * @author Helen
	 * 2014-12-23 下午5:28:25
	 * @param key
	 * @param path
	 * @return 
	 * TODO 从配置文件Properties读取key的�?
	 */
	public static String readFromProperties(String key,String path){
		Resource resource = new ClassPathResource(path);
		Properties p;
		try {
			p = PropertiesLoaderUtils.loadProperties(resource);
			return p.getProperty(key,"");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
}
