package DAO;

import BEAN.Payment;
import DB.ConnectionDB;

import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PaymentDAO {
    public static ArrayList<Payment> getAllPaymentType() throws SQLException, ClassNotFoundException {
        ArrayList<Payment> listPayment = new ArrayList<Payment>();
        String sql = "SELECT * FROM payment";
        Connection con = ConnectionDB.connect( );
        PreparedStatement pre = con.prepareStatement(sql);
       ResultSet rs = pre.executeQuery();
       while (rs.next()){
           Payment payment = new Payment(rs.getInt("idPayment"),rs.getString("name"));
           listPayment.add(payment);
       }
       ConnectionDB.pool.releaseConnection(con);
       return listPayment;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        System.out.println(getAllPaymentType().size());
    }
}
