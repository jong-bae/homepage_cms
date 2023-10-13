package com.cms.common.util;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

/**
 * 
 * @ClassName Encryptor.java
 * @description Jasypt Encryptor
 * @author JB
 * @since 2017. 2. 28.
 */
public class Encryptor {
	
	public static void main(String[] args) {
		StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
		encryptor.setPassword("cms");
		
		String url = encryptor.encrypt("jdbc:log4jdbc:sqlserver://localhost:1433;DatabaseName=localhost");
		String username = encryptor.encrypt("localhost");
		String password = encryptor.encrypt("");

		System.out.println("url=" + url);
		System.out.println("username=" + username);
		System.out.println("password=" + password);
	}
}
