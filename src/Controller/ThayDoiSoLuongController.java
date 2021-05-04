package Controller;

import DAO.GioHangDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ThayDoiSoLuongController")
public class ThayDoiSoLuongController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maSach = request.getParameter("maSach");
        String soLuong = request.getParameter("soLuong");
        HttpSession session = request.getSession();
        GioHangDAO cart = (GioHangDAO) session.getAttribute("cart");
        System.out.print("thay doi so luong: ");
       int tongTien = cart.thayDoiSoLuong(maSach, Integer.parseInt(soLuong));
       String tongTienFull = tongTien + ".000đ";
       request.setAttribute("tongTien",tongTienFull);
       request.getRequestDispatcher("bookhome/ThayDoiSoLuong.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
