package com.website.lt.util;

import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.sql.Clob;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class WebTools {
	private static final byte[] DES_KEY = { 21, 5, -110, 82, -32, -85, -128, -65 };

	//密码加密规则根据字符串生成数据库内密码
	public static String encryptBasedDes(String data) {
		String encryptedData = null;
		try {
			SecureRandom sr = new SecureRandom();
			DESKeySpec deskey = new DESKeySpec(DES_KEY);
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			SecretKey key = keyFactory.generateSecret(deskey);
			Cipher cipher = Cipher.getInstance("DES");
			cipher.init(Cipher.ENCRYPT_MODE, key, sr);
			encryptedData = new BASE64Encoder().encode(cipher.doFinal(data.getBytes()));
		} catch (Exception e) {
			System.out.println("出现异常："+e);
			throw new RuntimeException("出现异常：", e);
		}
		return encryptedData;
	}


	//解决文件名乱码问题
	  public static String toUtf8String(String s){ 
		     StringBuffer sb = new StringBuffer(); 
		       for (int i=0;i<s.length();i++){ 
		          char c = s.charAt(i); 
		          if (c >= 0 && c <= 255){sb.append(c);} 
		        else{ 
		        byte[] b; 
		         try { b = Character.toString(c).getBytes("utf-8");} 
		         catch (Exception ex) { 
		             System.out.println(ex); 
		                  b = new byte[0]; 
		         } 
		            for (int j = 0; j < b.length; j++) { 
		             int k = b[j]; 
		              if (k < 0) k += 256; 
		              sb.append("%" + Integer.toHexString(k).toUpperCase()); 
		              } 
		     } 
		  } 
		  return sb.toString(); 
		}
	  
	  
	   // 加密  
   public static String getBase64(String str) {  
       byte[] b = null;  
       String s = null;  
       try {  
           b = str.getBytes("utf-8");  
       } catch (UnsupportedEncodingException e) {  
           e.printStackTrace();  
       }  
       if (b != null) {  
           s = new BASE64Encoder().encode(b);  
       }  
       return s;  
   }  
 
   // 解密  
   public static String getFromBase64(String s) {  
       byte[] b = null;  
       String result = null;  
       if (s != null) {  
           BASE64Decoder decoder = new BASE64Decoder();  
           try {  
               b = decoder.decodeBuffer(s);  
               result = new String(b, "utf-8");  
           } catch (Exception e) {  
               e.printStackTrace();  
           }  
       }  
       return result;  
   }
   
	/**
	 * 基于MD5算法的单向加密
	 * 
	 * @param strSrc
	 *            明文
	 * @return 返回密文
	 */
	public static String encryptBasedMd5(String strSrc) {
		String outString = null;
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] outByte = md5.digest(strSrc.getBytes("UTF-8"));
			outString = outByte.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return outString;
	}
	
	   /** 
     * 将Clob转成String ,静态方法 
     *  
     * @param clob 
     *            字段 
     * @return 内容字串，如果出现错误，返回 null 
     */  
    public static String clobToString(Clob clob) {  
        if (clob == null)  
            return null;  
        StringBuffer sb = new StringBuffer();  
        Reader clobStream = null;  
        try {  
            clobStream = clob.getCharacterStream();  
            char[] b = new char[60000];// 每次获取60K  
            int i = 0;  
            while ((i = clobStream.read(b)) != -1) {  
                sb.append(b, 0, i);  
            }  
        } catch (Exception ex) {  
            sb = null;  
        } finally {  
            try {  
                if (clobStream != null) {  
                    clobStream.close();  
                }  
            } catch (Exception e) {  
            }  
        }  
        if (sb == null)  
            return "";  
        else  
            return sb.toString();  
    }    
    

}  

