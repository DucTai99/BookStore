package DAO;

import BEAN.Bill;
import BEAN.Sach;
import DB.ConnectionDB;

import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;

public class BillDAO {
    public static ArrayList<Bill> getAllBill() {
        ArrayList<Bill> listBill = new ArrayList<Bill>();
        Connection con = null;
        String sql = "SELECT * FROM bill b JOIN payment pm JOIN `user` u ON b.payment = pm.idPayment AND u.idUser = b.idUserEmail";
        try {
            con = ConnectionDB.connect();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idBill");
                String detail = rs.getString("detail");
                String useremail = rs.getString("email");
                String address = rs.getString("address");
                String payment = rs.getString("pm.name");
                Date date = rs.getDate("date");
                String name = rs.getString("b.name");
                String phoneNumber = rs.getString("phoneNumber");
                int total = rs.getInt("total");
                Bill bill = new Bill(id, detail, useremail, address, payment, date,name,phoneNumber,total);
                listBill.add(bill);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        ConnectionDB.pool.releaseConnection(con);
        return listBill;
    }

    public static ArrayList<Bill> getAllBill1() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM bill b JOIN billcontainsach c ON b.idBill=c.idBill JOIN sach s ON c.idSach= s.maSach  JOIN theloaisach t ON s.loaiSach = t.maTheLoai JOIN `user` u ON u.idUser = b.idUserEmail JOIN payment p on p.idPayment=b.payment";
        ArrayList<Bill> listBill = new ArrayList<>();
        Connection con = ConnectionDB.connect();
        PreparedStatement pre = con.prepareStatement(sql);
        ResultSet rs = pre.executeQuery();
        Outer:
        while (rs.next()) {

            int idBill = rs.getInt("idBill");

            if (listBill.size() == 0) {

                Bill bill = new Bill(rs.getInt("idBill"), rs.getString("detail"),
                        rs.getString("email"), rs.getString("address"), rs.getString("p.name")
                        , rs.getDate("date"),rs.getString("b.name"),rs.getString("phoneNumber"),rs.getInt("total"));
                Sach s = new Sach(rs.getString("maSach"), rs.getString("tenSach"),
                        rs.getInt("loaiSach"), rs.getInt("gia"), rs.getInt("soLuong"),
                        rs.getString("tenTacGia"), rs.getString("hinhAnh"), rs.getString("moTa")
                        , rs.getInt("khuyenMai"));
                s.setSoLuongMua(rs.getInt("quantity"));
                bill.addSach(s);
                listBill.add(bill);
                continue Outer;
            } else  if (listBill.size() != 0){
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
                                rs.getString("email"), rs.getString("address"), rs.getString("p.name")
                                , rs.getDate("date"),rs.getString("b.name"),rs.getString("phoneNumber"),rs.getInt("total"));
                        Sach s = new Sach(rs.getString("maSach"), rs.getString("tenSach"),
                                rs.getInt("loaiSach"), rs.getInt("gia"), rs.getInt("soLuong"),
                                rs.getString("tenTacGia"), rs.getString("hinhAnh"), rs.getString("moTa")
                                , rs.getInt("khuyenMai"));
                        s.setSoLuongMua(rs.getInt("quantity"));
                        bill.addSach(s);
                        listBill.add(bill);
                        continue Outer;
                    }
                }
            }
        }


        ConnectionDB.pool.releaseConnection(con);
        return listBill;
    }

    public static boolean remove(int id) {
        String sql = "DELETE FROM bill where idBill =?";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            ConnectionDB.pool.releaseConnection(con);
            return true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ConnectionDB.pool.releaseConnection(con);
        return false;
    }



    public static Bill getBill(int idBill) throws SQLException, ClassNotFoundException {
        Bill result = null;
        ArrayList<Bill> listBill = getAllBill1();
        for (Bill bill : listBill) {
            if (idBill == bill.getId()) {
                result = bill;
            }
        }
        return result;
    }



    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        ArrayList<Bill> list = getAllBill1();
        System.out.println(list.size());
        for (Bill bill : list){
            System.out.println(bill.toString());
        }
        Bill bill = getBill(2154);
        System.out.println(bill.toString());
    }
}
