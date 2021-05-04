package Controller;

import BEAN.Sach;
import BEAN.TheLoaiSach;
import DAO.GioHangDAO;
import DAO.ShopDAO;
import DB.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/shop")
public class shop extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        ArrayList<Sach> listSach = null;
        ArrayList<TheLoaiSach> listTheLoai = null;
        int page = 1;
        int soTrang = 0;

        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        GioHangDAO gioHang = null;
        try {
            HttpSession session = request.getSession();
            gioHang = (GioHangDAO) session.getAttribute("cart");
            if (gioHang == null) {
                gioHang = new GioHangDAO();
                GioHangDAO.capNhatDSSach();
            }
            listSach = ShopDAO.getSachTheoTheLoai(type, page);
            session.setAttribute("cart", gioHang);
            soTrang = ShopDAO.numOfPage(type);
            listTheLoai = ShopDAO.getAllProductType();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } catch (RuntimeException e) {
            System.out.println("het connection");
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }
        request.setAttribute("listTheLoai", listTheLoai);
        request.setAttribute("soTrang", soTrang);
        request.setAttribute("listSach", listSach);
        request.setAttribute("type", type);
        request.getRequestDispatcher("bookhome/shop.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
