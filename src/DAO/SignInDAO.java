package DAO;

import BEAN.User;
import DB.ConnectionDB;

import javax.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignInDAO {
    public static boolean checkSignIn(String username, String password) {
        String sql = "Select * from `user` where email=? and password=? and active = 1";
        boolean result = false;
        PreparedStatement pre = null;
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            pre = con.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, MD5.convertHashToString(password));
            ResultSet rs = pre.executeQuery();
            rs.last();
            int row = rs.getRow();
            if (rs != null && row == 1) {
                result = true;
            }


        } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            ConnectionDB.pool.releaseConnection(con);
            return false;
        }

        ConnectionDB.pool.releaseConnection(con);
        return result;
    }

    public static User getUser(String username, String password) {
        String sql = "Select * from `user` where email=? and password=?";
        Connection con = null;
        PreparedStatement pre = null;
        User user = new User();
        try {
            con = ConnectionDB.connect();
            pre = con.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, MD5.convertHashToString(password));
            ResultSet rs = pre.executeQuery();
            rs.last();
            int row = rs.getRow();
            if (rs != null && row == 1) {
                user.setId(rs.getString("idUser"));
                user.setActive(rs.getInt("active"));
                user.setEmail(rs.getString("email"));
                user.setLevel(rs.getInt("level"));
                user.setPassword(rs.getString("password"));

            }


        } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            ConnectionDB.pool.releaseConnection(con);
        }
        ConnectionDB.pool.releaseConnection(con);
        return user;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {


//      System.out.print(checkSignIn("haha@gmail.com","hihihi"));
    }
}
