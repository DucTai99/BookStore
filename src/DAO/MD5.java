package DAO;

import java.nio.charset.StandardCharsets;
import java.security.*;


public class MD5 {
    public static String convertHashToString(String text) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] hashInBytes = md.digest(text.getBytes(StandardCharsets.UTF_8));
        StringBuilder sb = new StringBuilder();
        for (byte b : hashInBytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    public static void main(String[] args) throws NoSuchAlgorithmException {
        System.out.print(convertHashToString("hihihi"));
    }
}
