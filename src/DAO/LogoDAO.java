package DAO;

import BEAN.Logo;
import DB.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LogoDAO {
    public static ArrayList<Logo> getAllLogo() {
        ArrayList<Logo> listLogo = new ArrayList<Logo>();
        String sql ="Select * from logo";
        Connection con = null;
        try {
            con=ConnectionDB.connect();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int idLogo = rs.getInt("idLogo");
                String img = rs.getString("img");
                Logo logo = new Logo(idLogo,img);
                listLogo.add(logo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        ConnectionDB.pool.releaseConnection(con);
        return  listLogo;
    }
    public static Logo getLogo(int id) {
        Logo logo = null;
        String sql ="Select * from logo where idLogo=?";
        Connection con = null;
        try {
            con=ConnectionDB.connect();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int idLogo = rs.getInt("idLogo");
                String img = rs.getString("img");
                logo = new Logo(idLogo,img);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        ConnectionDB.pool.releaseConnection(con);
        return  logo;
    }
    public static boolean editLogo(int id, String img) {
        String sql = "Select idLogo,img FROM logo where idLogo =?";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pre = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            rs.last();
            if (rs != null && rs.getRow() == 1) {

                rs.updateInt("idLogo", id);
                rs.updateString("img",img);
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
    public static void main(String[] args) {
        System.out.println(getLogo(1).getImg());
    }
}


