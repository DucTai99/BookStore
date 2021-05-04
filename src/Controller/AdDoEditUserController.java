package Controller;

import BEAN.User;
import DAO.UserDAO;
import Util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AdDoEditUserController")
public class AdDoEditUserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("edit_id");
        String email = request.getParameter("edit_email");
        int level = Integer.parseInt(request.getParameter("edit_level"));
        int active = Integer.parseInt(request.getParameter("edit_active"));
        try {
            if (UserDAO.editUser(id, email, level, active)) {
                response.sendRedirect(Util.fullPath("AdUserController"));
            } else {
                response.getWriter().println("edit khong thanh cong");
            }

        } catch (RuntimeException e) {
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
