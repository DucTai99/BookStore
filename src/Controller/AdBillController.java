package Controller;

import BEAN.Bill;
import BEAN.User;
import DAO.BillDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AdBillController")
public class AdBillController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ArrayList<Bill> listBill = new ArrayList<>();
        try{
            listBill = BillDAO.getAllBill();
        } catch (RuntimeException e){
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }

        request.setAttribute("listBill", listBill);
        request.getRequestDispatcher("admin/bill.jsp").forward(request, response);
    }
}
