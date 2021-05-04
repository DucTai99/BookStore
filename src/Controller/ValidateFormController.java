package Controller;

import DAO.SignUpDAO;
import DB.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/ValidateFormController")
public class ValidateFormController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        if (!SignUpDAO.validateEmail(email)) {
            request.setAttribute("msg1", "Tài khoản không đúng định dạng");
            request.getRequestDispatcher("bookhome/ValidateSignUp.jsp").forward(request, response);
        }
        try {
            if (SignUpDAO.isMailExist(email)) {
                request.setAttribute("msg1", "Tài khoản đã tồn tại");
                request.getRequestDispatcher("bookhome/ValidateSignUp.jsp").forward(request, response);
            } else {
                request.setAttribute("msg1", "Tài khoản có thể sử dụng");
                request.getRequestDispatcher("bookhome/ValidateSignUp.jsp").forward(request, response);
            }
        } catch (RuntimeException e) {
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
