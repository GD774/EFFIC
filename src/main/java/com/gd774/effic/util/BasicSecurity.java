package com.gd774.effic.util;

import java.security.MessageDigest;

public class BasicSecurity {
	public static final String SHA256 = "SHA-256";

	public static String getHash(String str, String method) {
		StringBuilder sb = new StringBuilder();
		try {
			MessageDigest digest = MessageDigest.getInstance(method);
			digest.update(str.getBytes());
			byte[] bytes = digest.digest();
			for (int i = 0; i < bytes.length; i++)
				sb.append(String.format("%02X", bytes[i]));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
}
