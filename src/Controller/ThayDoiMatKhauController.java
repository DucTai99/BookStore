package Controller;

import DAO.LayLaiPassDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ThayDoiMatKhauController")
public class ThayDoiMatKhauController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String cfpassword = request.getParameter("password");
        try {
            if (password.equals(cfpassword)) {
                LayLaiPassDAO.thayDoiMatKhau(username, password);
            } else {
                response.getWriter().println("mat khau khong giong nhau");
            }
        } catch (RuntimeException e) {
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
