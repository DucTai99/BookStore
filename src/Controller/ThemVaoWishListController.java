package Controller;

import BEAN.Sach;
import BEAN.User;
import DAO.WishListDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ThemVaoWishListController")
public class ThemVaoWishListController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maSach = request.getParameter("maSach");
        System.out.println("ma sach :" + maSach);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user!=null){
            String idUser = user.getId();
            WishListDAO.addWishList(maSach,idUser);
            response.sendRedirect("WishListController");
        }
        else {
            response.sendRedirect("bookhome/login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
