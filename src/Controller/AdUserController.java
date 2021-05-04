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

@WebServlet("/AdUserController")
public class AdUserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        ArrayList<User> listUser = new ArrayList<>();
        try {
            listUser = UserDAO.getAllUser();
        } catch (RuntimeException e) {
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("admin/user.jsp").forward(request, response);
    }
}
