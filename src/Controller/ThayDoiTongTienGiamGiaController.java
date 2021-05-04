package Controller;

import DAO.GioHangDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ThayDoiTongTienGiamGiaController")
public class ThayDoiTongTienGiamGiaController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        GioHangDAO cart = (GioHangDAO) session.getAttribute("cart");
        int khuyenMai = Integer.parseInt(request.getParameter("khuyenMai"));
        int tongTienGiamGia = cart.tongTienKhuyenMai(khuyenMai);
        String tongTienGiamGiaFull = tongTienGiamGia + ".000đ";
        request.setAttribute("tongTienGiamGia",tongTienGiamGiaFull);
        request.getRequestDispatcher("bookhome/ThayDoiTongTienGiamGia.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
