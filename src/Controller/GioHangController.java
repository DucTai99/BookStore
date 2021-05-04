package Controller;

import BEAN.User;
import DAO.GioHangDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/GioHangController")
public class GioHangController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maSach = request.getParameter("maSach");
        System.out.println("ma sach :" + maSach);
        String soluongmua = request.getParameter("soLuongMua");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        GioHangDAO cart = (GioHangDAO) session.getAttribute("cart");
        if (cart == null) {
            cart = new GioHangDAO();
            session.setAttribute("cart", cart);
        }
        if (user != null) {
            try {
                if (soluongmua != null) {
                    System.out.println(cart.themVaoGioHang(maSach, Integer.parseInt(soluongmua)));
                } else {
                    System.out.println(cart.themVaoGioHang(maSach, 1));
                }

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            System.out.println("Có " + cart.gioHang.size() + " sách trong giỏ hàng");
            response.sendRedirect("bookhome/cart.jsp");

        } else {
            response.sendRedirect("bookhome/login.jsp");
        }
    }
}
