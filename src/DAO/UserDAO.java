package DAO;

import BEAN.Bill;
import BEAN.Sach;
import BEAN.User;
import DB.ConnectionDB;

import javax.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;

public class UserDAO {
    public static ArrayList<User> getAllUser() {
        ArrayList<User> listUser = new ArrayList<User>();
        String sql = "Select * from user";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getString("idUser"), rs.getString("email"),
                        rs.getString("password"), rs.getInt("level"), rs.getInt("active"));
                listUser.add(user);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
            ConnectionDB.pool.releaseConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
            ConnectionDB.pool.releaseConnection(con);
        }
        ConnectionDB.pool.releaseConnection(con);
        return listUser;
    }

    public static boolean removeUser(int userId) {
        String sql = "DELETE FROM user where idUser =?";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, userId);
            pr.executeUpdate();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ConnectionDB.pool.releaseConnection(con);
        return true;
    }

    public static boolean editUser(String id, String email, int level, int active) {
        String sql = "Select idUser,email,level,active FROM user where idUser =?";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pre = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            rs.last();
            if (rs != null && rs.getRow() == 1) {
                rs.updateString("idUser", id);
                rs.updateString("email", email);
                rs.updateInt("level", level);
                rs.updateInt("active", active);
                rs.updateRow();
                ConnectionDB.pool.releaseConnection(con);
                return true;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
            ConnectionDB.pool.releaseConnection(con);
        }
        ConnectionDB.pool.releaseConnection(con);
        return false;
    }

    public static User getUser(String id) {
        User result = null;
        ArrayList<User> listUser = getAllUser();
        for (User user : listUser) {
            if (user.getId().equals(id)) {
                result = user;
            }
        }
        System.out.print(result.getActive());
        return result;
    }

    public static ArrayList<Bill> getAllBill(String idUser) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM bill b JOIN billcontainsach c ON b.idBill=c.idBill JOIN sach s ON c.idSach= s.maSach  JOIN theloaisach t ON s.loaiSach = t.maTheLoai JOIN `user` u ON u.idUser = b.idUserEmail JOIN payment p on p.idPayment=b.payment WHERE idUser =?";
        ArrayList<Bill> listBill = new ArrayList<>();
        Connection con = ConnectionDB.connect();
        PreparedStatement pre = con.prepareStatement(sql);
        pre.setString(1, idUser);
        ResultSet rs = pre.executeQuery();
        Outer:
        while (rs.next()) {

            int idBill = rs.getInt("idBill");

            if (listBill.size() == 0) {
                Bill bill = new Bill(rs.getInt("idBill"), rs.getString("detail"),
                        rs.getString("email"), rs.getString("address"), rs.getString("name")
                        , rs.getDate("date"),rs.getString("name"),rs.getString("phoneNumber"),rs.getInt("total"));
                bill.setTinhTrangBill(rs.getInt("tinhTrangDonHang"));
                Sach s = new Sach(rs.getString("maSach"), rs.getString("tenSach"),
                        rs.getInt("loaiSach"), rs.getInt("gia"), rs.getInt("soLuong"),
                        rs.getString("tenTacGia"), rs.getString("hinhAnh"), rs.getString("moTa")
                        , rs.getInt("khuyenMai"));
                s.setSoLuongMua(rs.getInt("quantity"));
                bill.addSach(s);
                listBill.add(bill);
                continue Outer;
            } else {
                for (int i = 0; i < listBill.size(); i++) {

                    if (idBill == listBill.get(i).getId()) {

                        Sach s = new Sach(rs.getString("maSach"), rs.getString("tenSach"),
                                rs.getInt("loaiSach"), rs.getInt("gia"), rs.getInt("soLuong"),
                                rs.getString("tenTacGia"), rs.getString("hinhAnh"), rs.getString("moTa")
                                , rs.getInt("khuyenMai"));
                        s.setSoLuongMua(rs.getInt("quantity"));
                        listBill.get(i).addSach(s);
                        continue Outer;

                    } else if (i == listBill.size() - 1) {

                        Bill bill = new Bill(rs.getInt("idBill"), rs.getString("detail"),
                                rs.getString("email"), rs.getString("address"), rs.getString("name")
                                , rs.getDate("date"),rs.getString("name"),rs.getString("phoneNumber"),rs.getInt("total"));
                        bill.setTinhTrangBill(rs.getInt("tinhTrangDonHang"));
                        listBill.add(bill);
                        Sach s = new Sach(rs.getString("maSach"), rs.getString("tenSach"),
                                rs.getInt("loaiSach"), rs.getInt("gia"), rs.getInt("soLuong"),
                                rs.getString("tenTacGia"), rs.getString("hinhAnh"), rs.getString("moTa")
                                , rs.getInt("khuyenMai"));
                        s.setSoLuongMua(rs.getInt("quantity"));
                        bill.addSach(s);
                        continue Outer;
                    }
                }
            }
        }


        ConnectionDB.pool.releaseConnection(con);
        return listBill;
    }

    public static void changePass(String idUser, String pass) {
        String sql = "UPDATE user SET password=? WHERE idUser =?";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, MD5.convertHashToString(pass));
            pre.setString(2, idUser);
            pre.executeUpdate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        ConnectionDB.pool.releaseConnection(con);
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        getUser(5);
//        ArrayList<Bill> listBill = getAllBill(5);
//        for (int i = 0; i < listBill.size(); i++) {
//            System.out.println(listBill.get(i).toString());
//        }
        changePass("6","huhuhu");
    }
}
