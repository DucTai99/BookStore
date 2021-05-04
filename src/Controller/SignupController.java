package Controller;

import BEAN.User;
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
import java.util.ArrayList;

@WebServlet("/SignupController")
public class SignupController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String cfpass = request.getParameter("cfpassword");
        ArrayList<String> listMsg = new ArrayList<>();


        try {
            if (SignUpDAO.validateEmail(email) && SignUpDAO.validatePass(pass) && !SignUpDAO.isMailExist(email) && pass.equals(cfpass)) {
                User user = new User();
                user.setEmail(email);
                user.setPassword(pass);
                user.setActive(1);
                user.setLevel(1);
                SignUpDAO.insertUser(user);


                    listMsg.add("Dang ky thanh cong");
                    request.setAttribute("listMsg", listMsg);
            }
            if (!SignUpDAO.validateEmail(email)) listMsg.add("Email không đúng định dạng");
            if(!SignUpDAO.validatePass(pass)) listMsg.add("Mật khẩu ít nhất 8 ký tự, bao gồm chữ thường, chữ hoa, chữ số," +
                    " ký tự đặc biệt, không có khoảng trống và đầu cuối phải là chữ.");
            if (SignUpDAO.isMailExist(email)) listMsg.add("Tài khoản đã tồn tại");
            if (!pass.equals(cfpass)) listMsg.add("Mật khẩu không giống nhau");
        } catch (RuntimeException e){
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }
        request.setAttribute("listMsg", listMsg);
        request.getRequestDispatcher("bookhome/signup.jsp").forward(request, response);
    }
}
