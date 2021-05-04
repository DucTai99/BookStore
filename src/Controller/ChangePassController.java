package Controller;

import BEAN.User;
import DAO.MD5;
import DAO.SignInDAO;
import DAO.SignUpDAO;
import DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet("/ChangePassController")
public class ChangePassController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getEmail();
        String current_password =  request.getParameter("current-pass");
        String newPass = request.getParameter("newPass");
        String cfPass = request.getParameter("cfPass");

        try {

            System.out.println(SignInDAO.checkSignIn(username, current_password));
            if (SignInDAO.checkSignIn(username, current_password)) {

                if (newPass.equals(cfPass)) {
                    UserDAO.changePass(user.getId(),newPass);
                    response.getWriter().println("doi mat khau thanh cong");
                    return;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        response.getWriter().println("khong thanh cong");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
