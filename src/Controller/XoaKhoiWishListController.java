package Controller;

import BEAN.User;
import DAO.GioHangDAO;
import DAO.WishListDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/XoaKhoiWishListController")
public class XoaKhoiWishListController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maSach = request.getParameter("maSach");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String idUser = user.getId();
        if(maSach.equalsIgnoreCase("0")){
            WishListDAO.deleteAllWishList(idUser);
        }
        else {
            WishListDAO.deleteWishList(maSach,idUser);
        }
        response.sendRedirect("WishListController");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
