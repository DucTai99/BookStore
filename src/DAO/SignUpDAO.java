package DAO;

import BEAN.User;
import DB.ConnectionDB;

import javax.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SignUpDAO {
    public static boolean insertUser(User user) {
        String sql = "INSERT into `user`(email,password,level,active) VALUES(?,?,?,?)";
        boolean result = false;
        PreparedStatement pre = null;
        Connection con = null;
        try {
            con = ConnectionDB.connect( );
            pre = con.prepareStatement(sql);
            String email = user.getEmail();
            String pass = MD5.convertHashToString(user.getPassword());
            int level = user.getLevel();
            int active = user.getActive();
            pre.setString(1, email);
            pre.setString(2, pass);
            pre.setInt(3, level);
            pre.setInt(4, active);

            int add = pre.executeUpdate();
            pre.close();

            if (add == 1)
                ConnectionDB.pool.releaseConnection(con);
                result = true;
        } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        }
ConnectionDB.pool.releaseConnection(con);
        return result;
    }
    public static boolean isMailExist(String email) {
        String sql = "SELECT * from `user` where email=?";
        Connection con = null;
        PreparedStatement pre = null;
        try {
            con = ConnectionDB.connect( );
            pre = con.prepareStatement(sql);
pre.setString(1,email);


            ResultSet rs = pre.executeQuery();
           rs.last();
           if(rs.getRow()>0){
               ConnectionDB.pool.releaseConnection(con);
               return true;
           }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        ConnectionDB.pool.releaseConnection(con);
        return false;
    }
public static boolean validateEmail(String email){
    String regex = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
    Pattern pattern = Pattern.compile(regex);
    Matcher matcher = pattern.matcher(email);
    return  matcher.matches();
}
    public static boolean validatePass(String pass){
        String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(pass);
        return  matcher.matches();
    }
    public static void main(String[] args) throws SQLException, ClassNotFoundException {

//        System.out.println(isMailExist("emailtest1@gmail.com"));
//        System.out.print(validateEmail(".username@yahoo.com"));
//        System.out.println(validatePass("Dkia$0dB4548bljklE"));
    }
}
