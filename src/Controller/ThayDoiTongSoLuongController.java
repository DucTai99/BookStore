package Controller;

import DAO.GioHangDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ThayDoiTongSoLuongController")
public class ThayDoiTongSoLuongController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        GioHangDAO cart = (GioHangDAO) session.getAttribute("cart");
        int tongSoLuong = cart.tongSoLuongMua();
        request.setAttribute("tongSoLuong",tongSoLuong);
        request.getRequestDispatcher("bookhome/ThayDoiTongSoLuong.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
