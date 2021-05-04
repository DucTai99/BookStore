package DAO;

import BEAN.TheLoaiSach;
import DB.ConnectionDB;

import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TheLoaiDAO {

    public static  ArrayList<TheLoaiSach> getAllBookType( ) {
        ArrayList<TheLoaiSach> listBookType = new ArrayList<>();
        Connection con = null;
        String sql ="Select * from theLoaiSach";
        try {
           con = ConnectionDB.connect(  );
           PreparedStatement pr = con.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while(rs.next()) {
                int maTheLoai = rs.getInt("maTheLoai");
                String tenTheLoai = rs.getString("tenTheLoai");
                TheLoaiSach t = new TheLoaiSach(maTheLoai,tenTheLoai);
                listBookType.add(t);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        }

ConnectionDB.pool.releaseConnection(con);
        return listBookType;
    }

    public static void main(String[] args) {
//        System.out.print(getAllBookType().size());
    }
}
