package DAO;

import BEAN.Sach;
import DB.ConnectionDB;

import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;

public class ProductDAO {
    public static int soSanPhamHienThi = 6;

    public static ArrayList<Sach> getAllProduct() {
        String sql = "SELECT * FROM sach s JOIN theloaisach t on s.loaiSach = t.maTheLoai";
        ArrayList<Sach> list = new ArrayList<Sach>();
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String maSach = rs.getString("maSach");
                String tenSach = rs.getString("tenSach");
                int loaiSach = rs.getInt("loaiSach");
                int gia = rs.getInt("gia");
                int soLuong = rs.getInt("soLuong");
                String tenTacGia = rs.getString("tenTacGia");
                String hinhAnh = rs.getString("hinhAnh");
                String moTa = rs.getString("moTa");
                int khuyenMai = rs.getInt("khuyenMai");
                Sach sach = new Sach(maSach, tenSach, loaiSach, gia, soLuong, tenTacGia, hinhAnh, moTa, khuyenMai);
                list.add(sach);
            }


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        ConnectionDB.pool.releaseConnection(con);
        return list;
    }

    public static boolean remove(int maSach) {
        String sql = "DELETE FROM sach where maSach =?";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, maSach);
            pr.executeUpdate();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ConnectionDB.pool.releaseConnection(con);
        return true;
    }

    public static boolean editProduct(int maSach, String name, int type, String img, String author, int quantity, String desc, int price, int sale) {
        String sql = "Select * FROM sach where maSach =?";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pr = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pr.setInt(1, maSach);
            ResultSet rs = pr.executeQuery();
            rs.last();
            if (rs != null && rs.getRow() == 1) {
                rs.updateString("tenSach", name);
                rs.updateString("hinhAnh", "bookhome/img/shop/" + img);
                rs.updateInt("loaiSach", type);
                rs.updateString("tenTacGia", author);
                rs.updateString("moTa", desc);
                rs.updateInt("gia", price);
                rs.updateInt("soLuong", quantity);
                rs.updateInt("khuyenMai", sale);
                rs.updateRow();
                ConnectionDB.pool.releaseConnection(con);
                return true;

            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ConnectionDB.pool.releaseConnection(con);
        return false;
    }

    public static Sach getSach(String maSach) {
        Sach s = new Sach();
        String sql = "Select * from sach s JOIN theloaisach t ON s.loaiSach = t.maTheLoai where maSach=?";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, maSach);
            ResultSet rs = pr.executeQuery();
            rs.last();
//            if (rs != null && rs.getRow() == 1) {

            s = new Sach(rs.getString("maSach"), rs.getString("tenSach"), rs.getInt("loaiSach"), rs.getInt("gia"),
                    rs.getInt("soLuong"), rs.getString("tenTacGia"), rs.getString("hinhAnh"), rs.getString("moTa"), rs.getInt("khuyenMai"));
//            }
            s.setTenLoaiSach(rs.getString("tenTheLoai"));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ConnectionDB.pool.releaseConnection(con);
        return s;
    }

    public static ArrayList<Sach> getListTopSell() {
        ArrayList<Sach> listSachBanChay = new ArrayList<Sach>();
        String sql = "SELECT idSach,SUM(quantity) sl  FROM billcontainsach GROUP BY idSach ORDER BY sl DESC LIMIT 12";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Sach sach = getSach(rs.getString("idSach"));
                listSachBanChay.add(sach);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.pool.releaseConnection(con);
        }
        return listSachBanChay;
    }

    public static ArrayList<Sach> getListNewestProduct() {
        ArrayList<Sach> listSachBanChay = new ArrayList<Sach>();
        String sql = "SELECT * from sach ORDER BY ngayXuatBan DESC LIMIT 12";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Sach sach = getSach(rs.getString("maSach"));
                listSachBanChay.add(sach);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.pool.releaseConnection(con);
        }
        return listSachBanChay;
    }

    public static ArrayList<Sach> getListSameType(int theLoai) {
        ArrayList<Sach> listSach = new ArrayList<Sach>();
        String sql = "SELECT * from sach where loaiSach=?";
        Connection con = null;
        try {
            con = ConnectionDB.connect();

            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, theLoai);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String maSach = rs.getString("maSach");
                String tenSach = rs.getString("tenSach");
                int loaiSach = rs.getInt("loaiSach");
                int gia = rs.getInt("gia");
                int soLuong = rs.getInt("soLuong");
                String tenTacGia = rs.getString("tenTacGia");
                String hinhAnh = rs.getString("hinhAnh");
                String moTa = rs.getString("moTa");
                int khuyenMai = rs.getInt("khuyenMai");
                Sach sach = new Sach(maSach, tenSach, loaiSach, gia, soLuong, tenTacGia, hinhAnh, moTa, khuyenMai);
                listSach.add(sach);
            }


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        ConnectionDB.pool.releaseConnection(con);
        return listSach;
    }

    public static ArrayList<Sach> getListPage(int indexPage) {
        int index = soSanPhamHienThi * (indexPage - 1);
        ArrayList<Sach> list = new ArrayList<>();
        Connection con = null;
        if (indexPage < 1) indexPage = 1;
        indexPage = (indexPage - 1) * soSanPhamHienThi;
        String sql = "SELECT * FROM sach";

        sql += " LIMIT ?," + soSanPhamHienThi;
        PreparedStatement pre = null;
        try {
            con = ConnectionDB.connect();
            pre = con.prepareStatement(sql);
            pre.setInt(1, indexPage);
            ResultSet p = pre.executeQuery();
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

    public static int numOfPage() {
        int result = (int) (ProductDAO.getAllProduct().size() / soSanPhamHienThi) + 1;
        return result;
    }
    public static void addProduct(int id, String name, int type, String img, String author, int quantity, String description, int price, int sale, Date date) {
        PreparedStatement pre = null;
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            String sql = "INSERT INTO sach (maSach,tenSach,loaiSach,gia,soLuong,tenTacGia,hinhAnh,moTa,khuyenMai,ngayXuatBan) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pre = con.prepareStatement(sql);
            pre.setInt(1, id);
            pre.setString(2, name);
            pre.setInt(3, type);
            pre.setInt(4, price);
            pre.setInt(5, quantity);
            pre.setString(6, author);
            pre.setString(7, img);
            pre.setString(8, description);
            pre.setInt(9, sale);
            pre.setDate(10, date);
            pre.executeUpdate();
            System.out.println("Thêm thành công");
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
//        addProduct(501,"Ngôi nhà bay", 3,"bookhome/img/shop/tt1.jpeg");

    }


}
