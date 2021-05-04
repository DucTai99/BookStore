package DAO;

import DB.ConnectionDB;

import javax.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class LayLaiPassDAO {
    static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    static Random rnd = new Random();

    public static String stringRandom() {
        StringBuilder sb = new StringBuilder(10);
        for (int i = 0; i < 10; i++)
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        return sb.toString();
    }

    //nếu code trên url bằng với code trong database thì trả về true, còn không trả về false
    public static boolean soSanhCode(String username, String code) {
        String sql = "SELECT * FROM `user` WHERE email=?";
        PreparedStatement pre = null;
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            pre = con.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            rs.last();
            if (rs != null & rs.getRow() == 1) {

                if (rs.getString("code").equals(MD5.convertHashToString(code))) {
                    ConnectionDB.pool.releaseConnection(con);
                    return true;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        ConnectionDB.pool.releaseConnection(con);
        return false;
    }

    public static boolean thayDoiMatKhau(String username, String pass) {
        String sql = "SELECT * FROM `user` WHERE email=?";
        PreparedStatement pre = null;
        Connection con = null;
        try {
            con = ConnectionDB.connect(  );
            pre = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            rs.last();
            if (rs != null & rs.getRow() == 1) {
                rs.updateString("password", MD5.convertHashToString(pass));
                rs.updateString("code", MD5.convertHashToString(LayLaiPassDAO.stringRandom()));
                rs.updateRow();
                ConnectionDB.pool.releaseConnection(con);
return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        ConnectionDB.pool.releaseConnection(con);
        return false;
    }

    public static void main(String[] args) {
        System.out.print(stringRandom());
    }
}
