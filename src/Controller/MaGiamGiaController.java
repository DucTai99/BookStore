package Controller;

import DAO.GioHangDAO;
import DAO.MaGiamGiaDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MaGiamGiaController")
public class MaGiamGiaController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codeSale = request.getParameter("codeSale");
        int khuyenMai = MaGiamGiaDAO.getKhuyenMaiForCodeSale(codeSale);
        request.setAttribute("khuyenMai",khuyenMai);
        request.getRequestDispatcher("bookhome/cart.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
