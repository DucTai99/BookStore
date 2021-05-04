package Controller;

import BEAN.User;
import DAO.SignInDAO;
import DB.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/SigninController")
public class SigninController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = null;
        User user = null;
        try {

            session = request.getSession();
            user = (User) session.getAttribute("user");
            if (user == null) {
                if (SignInDAO.checkSignIn(username, password)) {
                    user = SignInDAO.getUser(username, password);
                    session = request.getSession(true);
                    session.setAttribute("user", user);
                    System.out.println("Dang nhap thanh cong tai khoan " + user.getEmail());
                    response.sendRedirect("shop");

                } else {
                    System.out.println("loi dang nhap");
                    request.setAttribute("msgLogin","Sai mat khau hoac tai khoan");
                    request.getRequestDispatcher("bookhome/login.jsp").forward(request,response);
                }
            }
            else response.sendRedirect("shop");
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (RuntimeException e){
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
