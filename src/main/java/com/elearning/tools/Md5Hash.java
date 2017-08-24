package com.elearning.tools;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5Hash {

    public static String toMD5(String password) {
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(password.getBytes("UTF-8"));
            byte[] encryption = md5.digest();
            StringBuffer buffer = new StringBuffer();

            for (int i = 0; i < encryption.length; i++) {
                if (Integer.toHexString(0xff & encryption[i]).length() == 1) {
                    buffer.append("0").append(Integer.toHexString(0xff & encryption[i]));
                } else {
                    buffer.append(Integer.toHexString(0xff & encryption[i]));
                }
            }
            return buffer.toString().substring(8, 17);
        } catch (NoSuchAlgorithmException e) {
            return "NoSuchAlgorithmException";
        } catch (UnsupportedEncodingException e) {
            return "UnsupportedEncodingException";
        }
    }
}
