package Controller;

import BEAN.User;
import DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AdEditUserController")
public class AdEditUserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("userId");
        User user = null;
        try {
            user = UserDAO.getUser(id);


        } catch (RuntimeException e) {
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }
        request.setAttribute("user", user);
        request.getRequestDispatcher("admin/editUser.jsp").forward(request, response);
    }
}
