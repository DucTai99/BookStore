package Controller;

import BEAN.Sach;
import BEAN.User;
import DAO.DatMuaDAO;
import DAO.GioHangDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/DatMuaController")
public class DatMuaController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        GioHangDAO gioHangDAO = (GioHangDAO) session.getAttribute("cart");
        int payment = Integer.parseInt(request.getParameter("payment[method]"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");

        if (DatMuaDAO.datMua(user, gioHangDAO.gioHang, payment,firstName+" "+ lastName,address,phoneNumber)) {
            gioHangDAO.clearGioHang();
            response.sendRedirect("MyAccountController");
            return;
        }
        response.getWriter().println("dat hang khong  thanh cong");
    }
}
