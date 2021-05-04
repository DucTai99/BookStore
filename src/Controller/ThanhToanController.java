package Controller;

import BEAN.Sach;
import DAO.GioHangDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ThanhToanController")
public class ThanhToanController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        GioHangDAO cart = (GioHangDAO) session.getAttribute("cart");
        int khuyenMai = Integer.parseInt(request.getParameter("maGiamGia"));
        ArrayList<Sach> listSach = new ArrayList<>();
        for (int i = 0; i < cart.gioHang.size(); i++) {
            listSach.add(cart.gioHang.get(i));
        }
        System.out.println("size of listSach: " + listSach.size());
        request.setAttribute("listSach",listSach);
        request.setAttribute("khuyenMai",khuyenMai);
        request.getRequestDispatcher("bookhome/checkout.jsp").forward(request,response);
    }
}
