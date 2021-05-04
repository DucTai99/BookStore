package Controller;

import DAO.QueryDB;
import DB.ConnectionDB;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/forgotPassController")
public class forgotPassController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");


        //Gửi email ở đây
        try {
          QueryDB.sendPass(username);
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (RuntimeException e){
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }


        request.getRequestDispatcher("bookhome/login.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
