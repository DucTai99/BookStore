package Controller;

import DAO.GioHangDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/XoaKhoiGioHangController")
public class XoaKhoiGioHangController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maSach = request.getParameter("maSach");
        HttpSession session = request.getSession();
        GioHangDAO cart = (GioHangDAO) session.getAttribute("cart");
        try {
            cart.xoaKhoiGiohang(maSach);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        response.sendRedirect("bookhome/cart.jsp");
    }
}
