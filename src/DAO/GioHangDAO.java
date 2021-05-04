package DAO;

import BEAN.Sach;
import DB.ConnectionDB;

import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;

public class GioHangDAO {
    public static ArrayList<Sach> dsSach = new ArrayList<Sach>();
    public ArrayList<Sach> gioHang = new ArrayList<Sach>();


    public static boolean capNhatDSSach() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM sach join theloaisach";
        Connection con = null;
        con = ConnectionDB.connect(  );
        PreparedStatement pre = con.prepareStatement(sql);
        ResultSet rs = pre.executeQuery();
        while (rs.next()) {
            Sach sach = new Sach(rs.getString("maSach"), rs.getString("tenSach"),
                    rs.getInt("loaiSach"), rs.getInt("gia"), rs.getInt("soLuong"),
                    rs.getString("tenTacGia"), rs.getString("hinhAnh"), rs.getString("moTa"), rs.getInt("khuyenMai"));
            dsSach.add(sach);
        }
        ConnectionDB.pool.releaseConnection(con);
        return true;
    }

    public boolean themVaoGioHang(String maSach, int soluong) throws SQLException, ClassNotFoundException {
        for (int i = 0; i < dsSach.size(); i++) {
            if (dsSach.get(i).getMaSach().equals(maSach)) {
                for (int j = 0; j < gioHang.size(); j++) {
                    if (gioHang.get(j).getMaSach().equals(maSach)) {
                        gioHang.get(j).setSoLuongMua(gioHang.get(j).getSoLuongMua() + soluong);
                        return true;
                    }
                }
                Sach sach = new Sach();
                sach.setMaSach(dsSach.get(i).getMaSach());
                sach.setTenSach(dsSach.get(i).getTenSach());
                sach.setLoaiSach(dsSach.get(i).getLoaiSach());
                sach.setGia(dsSach.get(i).getGia());
                sach.setSoLuongMua(soluong);
                sach.setTenTacGia(dsSach.get(i).getTenTacGia());
                sach.setHinhAnh(dsSach.get(i).getHinhAnh());
                sach.setMoTa(dsSach.get(i).getMoTa());
                sach.setKhuyenMai(dsSach.get(i).getKhuyenMai());
                gioHang.add(sach);
                System.out.println("So luong" + dsSach.get(i).getSoLuong());
                return true;
            }

        }
        return false;
    }

    public boolean xoaKhoiGiohang(String maSach) throws SQLException, ClassNotFoundException {
        for (int i = 0; i < gioHang.size(); i++) {
            if (gioHang.get(i).getMaSach().equals(maSach)) {
                gioHang.remove(i);
                return true;
            }
        }
        return false;
    }

    public int thayDoiSoLuong(String maSach, int soLuong) {
        for (int i = 0; i < gioHang.size(); i++) {
            if (gioHang.get(i).getMaSach().equals(maSach)) {
                gioHang.get(i).setSoLuongMua(soLuong);
                System.out.println("so luong cua sach co ma sach " + maSach + " la " + gioHang.get(i).getSoLuongMua());
            }
        }
        return tongTien();
    }
public int tongSoLuongMua(){
    int result = 0;
    for (int i = 0; i < gioHang.size(); i++) {
            result += gioHang.get(i).getSoLuongMua();
    }
    return result;
}

    public int tongTien() {
        int result = 0;
        for (int i = 0; i < gioHang.size(); i++) {
            if(gioHang.get(i).getKhuyenMai() > 0){
                result += gioHang.get(i).tienKhuyenMai() * gioHang.get(i).getSoLuongMua();
            }
            else {
                result += gioHang.get(i).getGia() * gioHang.get(i).getSoLuongMua();
            }
        }
        return result;
    }
    public int tongTienKhuyenMai(int khuyenMai){
        int result = 0;
        double khuyenMaiPhanTram = (100.0 - khuyenMai) / 100.0;
        result = (int) Math.ceil(tongTien() * khuyenMaiPhanTram) ;
        return result;
    }
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        GioHangDAO.capNhatDSSach();

    }

    //tang thi true, giam thi false, thay đổi trong database
    public static void tangGiamSoLuong(boolean tang, int maSach, int soLuong) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM sach WHERE maSach=?";
        Connection con = null;
        con = ConnectionDB.connect(  );
        PreparedStatement pre = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        pre.setInt(1, maSach);
        ResultSet rs = pre.executeQuery();
        while (rs.next()) {
            int soLuongHienTai = rs.getInt("soLuong");
            if (tang) {
                rs.updateInt("soLuong", soLuongHienTai + soLuong);
                rs.updateRow();
            } else {
                rs.updateInt("soLuong", soLuongHienTai - soLuong);
                rs.updateRow();
            }
        }
        ConnectionDB.pool.releaseConnection(con);
    }
    public void clearGioHang(){
        while (gioHang.size()!=0){
            gioHang.remove(0);
        }
    }
}
