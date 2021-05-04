package DAO;

import BEAN.Sach;
import DB.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchDAO {
    public static ArrayList<Sach> searchProductByName(String name){
        String sql = "SELECT * FROM sach WHERE tenSach LIKE ?";
        ArrayList<Sach> listSach = new ArrayList<>();
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1,"%"+name+"%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                Sach sach = ProductDAO.getSach(rs.getString("maSach"));
                System.out.println(rs.getString("tenSach"));
                listSach.add(sach);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.pool.releaseConnection(con);
        }
        return listSach;
    }

    public static void main(String[] args) {
        searchProductByName("");
    }
}
