package DAO;

import BEAN.Sach;
import BEAN.TheLoaiSach;
import DB.ConnectionDB;

import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShopDAO {
    static int soSanPhamHienThi1Trang = 9;
    public static ArrayList<TheLoaiSach> getAllProductType(  ) {
        ArrayList<TheLoaiSach> list = new ArrayList<>();
        PreparedStatement pre = null;
        Connection con = null;
        String sql = "SELECT maTheLoai,tenTheLoai FROM theloaisach";

        try {
            con = ConnectionDB.connect();
            pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                TheLoaiSach theloai = new TheLoaiSach(rs.getInt("maTheLoai"), rs.getString("tenTheLoai"));
                list.add(theloai);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        }
        ConnectionDB.pool.releaseConnection(con);
        return list;

    }

    public static ArrayList<Sach> getSachTheoTheLoai(String type, int page  ) throws SQLException {
        ArrayList<Sach> list = new ArrayList<>();
        Connection con = null;
        if (page < 1) page = 1;
        page = (page - 1) * soSanPhamHienThi1Trang;
        String sql = "SELECT * FROM sach";

        if (type != null) {
            if(type.equalsIgnoreCase("0")){
                sql += " WHERE khuyenMai > 0";
            }
            else {
                sql += " WHERE loaiSach=?";
            }
        }

        sql += " LIMIT ?,"+soSanPhamHienThi1Trang;
        PreparedStatement pre1 = null;
        try {
            con = ConnectionDB.connect();
            pre1 = con.prepareStatement(sql);
            if (type != null) {
                if(type.equalsIgnoreCase("0")){
                    pre1.setInt(1, page);
                }
                else {
                    pre1.setString(1, type);
                    pre1.setInt(2, page);
                }
            } else {
                pre1.setInt(1, page);
            }
            ResultSet p = pre1.executeQuery();
            while (p.next()) {
                Sach sach = new Sach(p.getString("maSach"), p.getString("tenSach"), p.getInt("loaiSach"),
                        p.getInt("gia"), p.getInt("soLuong"), p.getString("tenTacGia"),
                        p.getString("hinhAnh"), p.getString("moTa"), p.getInt("khuyenMai"));
                list.add(sach);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        }

        ConnectionDB.pool.releaseConnection(con);
        return list;
    }

    public static int numOfPage(String type) throws SQLException, ClassNotFoundException {
        int result = 0;
        String sql = "SELECT COUNT('id') FROM sach";
        if(type!=null){
            if(type.equalsIgnoreCase("0")){
                sql += " WHERE khuyenMai > 0";
            }
            else {
                sql += " WHERE loaiSach=?";
            }
        }
        Connection con = null;
        con = ConnectionDB.connect(  );
        PreparedStatement pre = con.prepareStatement(sql);
        if(type!=null) {
            if(type.equalsIgnoreCase("0")){
            }
            else {
                pre.setString(1, type);
            }
        }
        ResultSet rs = pre.executeQuery();
        rs.next();
        result = rs.getInt(1);
        ConnectionDB.pool.releaseConnection(con);
        if (result % soSanPhamHienThi1Trang != 0) {
            return result / soSanPhamHienThi1Trang+1;
        }

        return result / soSanPhamHienThi1Trang;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        System.out.println(numOfPage(null));
    }
}
