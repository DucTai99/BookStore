package Controller;

import BEAN.Bill;
import BEAN.User;
import DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/MyAccountController")
public class MyAccountController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user!=null){
            try {
                ArrayList<Bill> listBill = UserDAO.getAllBill(user.getId());
                user.setListBill(listBill);

              session.setAttribute("user",user);
                request.setAttribute("listBill",listBill);
                request.getRequestDispatcher("bookhome/my-account.jsp").forward(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (RuntimeException e){
                response.sendRedirect("bookhome/Error.jsp");
                return;
            }
        }

    }
}
