package DAO;

import BEAN.User;
import DB.ConnectionDB;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;


public class QueryDB {

    //Gửi email đến tài khoản username
    public static boolean sendPass(String username  ) throws MessagingException {
        String sql = "SELECT * FROM `user` WHERE email=?";
        PreparedStatement pre = null;
        Connection con = null;
        try {
            con = ConnectionDB.connect( );
            pre = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            rs.last();


            String code = LayLaiPassDAO.stringRandom();
            rs.updateString("code",MD5.convertHashToString(code));
            rs.updateRow();
            String msg = "Vui long nhan vao link de lay lai mat khau: " +
                    "http://localhost:8080/BookProject/LayMatKhauController?username="+username+"&code="+code;


            SendMailDAO.sendMail(username,"Lấy lại mật khẩu",msg);
            System.out.println("Đã gửi email lấy lại mật khẩu");
            ConnectionDB.pool.releaseConnection(con);
              return true;

    } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
            return false;
        }
    }

    public static void main(String[] args) {
    }
}
