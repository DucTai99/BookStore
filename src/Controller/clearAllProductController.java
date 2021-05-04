package Controller;

import DAO.GioHangDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/clearAllProductController")
public class clearAllProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        GioHangDAO gioHangDAO = (GioHangDAO) session.getAttribute("cart");
        gioHangDAO.clearGioHang();
        response.sendRedirect("bookhome/cart.jsp");
    }
}
