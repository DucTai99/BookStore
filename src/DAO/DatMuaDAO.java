package DAO;

import BEAN.Sach;
import BEAN.User;
import DB.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

public class DatMuaDAO {

    public static boolean datMua(User user, ArrayList<Sach> listSach, int payment, String name, String address, String phoneNumber) {
        if (listSach.size() == 0) return false;
        int rd = 0;
        String idBill = "";
        double tongCong = 0;
        PreparedStatement pre = null;
        for (int i = 0; i < listSach.size(); i++) {
            tongCong += listSach.get(i).tongTien();
        }
        String sql = "";
        sql = "SELECT * FROM bill WHERE idBill=?";
        Connection con = null;
        try {

            con = ConnectionDB.connect();
            while (true) {
                rd = new Random().nextInt(9999);
                idBill = rd + "";
                pre = con.prepareStatement(sql);
                pre.setString(1, idBill);
                ResultSet rs = pre.executeQuery();
                if (rs.next() == false) break;
            }

            sql = "INSERT INTO bill(detail,idUserEmail,total,address,payment,date,name,phoneNumber,idBill) VALUES(?,?,?,?,?,?,?,?,?)";
            pre = con.prepareStatement(sql);
            pre.setString(1, "Detail");
            pre.setString(2, user.getId());
            pre.setDouble(3, tongCong);
            pre.setString(4, address);
            pre.setInt(5, payment);
            pre.setDate(6, (java.sql.Date) getCurrentDate());
            pre.setString(7, name);
            pre.setString(8, phoneNumber);
            pre.setInt(9, Integer.parseInt(idBill));
            pre.executeUpdate();

            sql = "INSERT INTO billcontainsach VALUES(?,?,?)";
            pre = con.prepareStatement(sql);
            for (int i = 0; i < listSach.size(); i++) {
                pre.setString(1, idBill);
                pre.setString(2, listSach.get(i).getMaSach());
                pre.setInt(3, listSach.get(i).getSoLuongMua());
                pre.executeUpdate();

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ConnectionDB.pool.releaseConnection(con);
        return true;
    }

    public static Date getCurrentDate() {
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        System.out.println(date);
        return date;
    }


    public static void main(String[] args) {
      getCurrentDate();

    }
}
