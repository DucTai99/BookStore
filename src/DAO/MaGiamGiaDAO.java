package DAO;

import BEAN.MaGiamGia;
import DB.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MaGiamGiaDAO {
    public static ArrayList<MaGiamGia> getAllListMaGiamGia() {
        ArrayList<MaGiamGia> listGiamGia = new ArrayList<MaGiamGia>();
        PreparedStatement pre = null;
        Connection con = null;
        String sql = "SELECT * FROM salecode";
        try {
            con = ConnectionDB.connect();
            pre = con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idSale");
                String codeSale = rs.getString("codeSale");
                int khuyenMai = rs.getInt("khuyenMai");
                MaGiamGia maGiamGia = new MaGiamGia(id,codeSale,khuyenMai);
                listGiamGia.add(maGiamGia);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listGiamGia;
    }

    public static boolean checkCodeSale(String codeSale){
        ArrayList<MaGiamGia> listGiamGia = getAllListMaGiamGia();
        for (MaGiamGia maGiamGia: listGiamGia) {
            if(maGiamGia.getCodeSale().equalsIgnoreCase(codeSale)){
                return true;
            }
        }
        return false;
    }

    public static int getKhuyenMaiForCodeSale(String codeSale){
        int result = 0;
        if(checkCodeSale(codeSale)){
            ArrayList<MaGiamGia> listGiamGia = getAllListMaGiamGia();
            for (MaGiamGia maGiamGia: listGiamGia) {
                if(maGiamGia.getCodeSale().equalsIgnoreCase(codeSale)){
                    result = maGiamGia.getKhuyenMai();
                }
            }
        }
        return result;
    }

    public static void main(String[] args) {
//        ArrayList<MaGiamGia> list = getAllListMaGiamGia();
        System.out.println(getKhuyenMaiForCodeSale("HHHHH10"));
    }
}
