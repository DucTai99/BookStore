package Controller;

import BEAN.Bill;
import BEAN.Payment;
import BEAN.User;
import DAO.BillDAO;
import DAO.PaymentDAO;
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

@WebServlet("/AdEditBillController")
public class AdEditBillController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //phân quyền
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user==null || user.getLevel()<2){
            response.getWriter().println("Ban khong co quyen truy cap");
            return;
        }

        int idBill = Integer.parseInt(request.getParameter("idBill"));
        Bill bill = null;
        ArrayList<User> listUser = new ArrayList<>();
        ArrayList<Payment> listPayment = new ArrayList<>();
        try {
            bill = BillDAO.getBill(idBill);
            listUser = UserDAO.getAllUser();
            listPayment = PaymentDAO.getAllPaymentType();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (RuntimeException e){
            response.sendRedirect("bookhome/Error.jsp");

        }

        request.setAttribute("listPayment", listPayment);
        request.setAttribute("listUser", listUser);
        request.setAttribute("bill", bill);
        request.getRequestDispatcher("admin/editBill.jsp").forward(request, response);


    }
}
