package DAO;

import BEAN.Sach;
import DB.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class WishListDAO {
    public static ArrayList<Sach> getAllWishList(String idUser){
        ArrayList<Sach> wishList = new ArrayList<Sach>();
        PreparedStatement pre = null;
        Connection con = null;
        String sql = "SELECT * FROM wishlist w JOIN sach s ON w.idSach = s.maSach  WHERE idUser =  ?";
        try {
            con = ConnectionDB.connect();
            pre = con.prepareStatement(sql);
            pre.setString(1,idUser);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                Sach sach = new Sach(rs.getString("maSach"), rs.getString("tenSach"), rs.getInt("loaiSach"),
                        rs.getInt("gia"), rs.getInt("soLuong"), rs.getString("tenTacGia"),
                        rs.getString("hinhAnh"), rs.getString("moTa"), rs.getInt("khuyenMai"));
                wishList.add(sach);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        }
        ConnectionDB.pool.releaseConnection(con);
        return  wishList;
    }

    public static void addWishList(String idSach,String idUser){
        PreparedStatement pre = null;
        Connection con = null;
        ArrayList<Sach> listSach = getAllWishList(idUser);
        int count = 0;
        try {
            con = ConnectionDB.connect();
            String sql = "INSERT INTO wishlist (idSach,idUser) VALUES (?,?)";
            pre = con.prepareStatement(sql);
            pre.setString(1,idSach);
            pre.setString(2,idUser);
            for (Sach sach: listSach) {
                if(sach.getMaSach().equals(idSach)){
                    count++;
                }
            }
            if(count == 0){
                pre.executeUpdate();
                System.out.println("Thêm " + idSach + " vào wishList của " + idUser);
            }
            else {
                System.out.println("Đã có " + idSach + " trong wishList");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        }
        ConnectionDB.pool.releaseConnection(con);
    }

    public static void deleteWishList(String idSach,String idUser){
        String sql = "DELETE FROM wishlist where idSach = ? AND idUser = ?";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, idSach);
            pr.setString(2,idUser);
            pr.executeUpdate();
            System.out.println("Xóa " + idSach + " trong wishList của " + idUser);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        }
        ConnectionDB.pool.releaseConnection(con);
    }

    public static void deleteAllWishList(String idUser){
        String sql = "DELETE FROM wishlist WHERE idUser = ?";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1,idUser);
            pr.executeUpdate();
            System.out.println("Xóa tất cả wishList của " + idUser);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        }
        ConnectionDB.pool.releaseConnection(con);
    }

    public static void main(String[] args) {
//        ArrayList<Sach> list = getAllWishList("19");
//        for (Sach sach: list
//             ) {
//            System.out.println(sach.getMaSach());
//
//        }
//    addWishList("50","19");
//        deleteWishList("50","19");
//        deleteAllWishList("21");
    }
}
