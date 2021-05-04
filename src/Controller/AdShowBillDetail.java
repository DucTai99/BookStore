package Controller;

import BEAN.Bill;
import DAO.BillDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AdShowBillDetail")
public class AdShowBillDetail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int idBill = Integer.parseInt(request.getParameter("idBill"));
        Bill bill = null;
        try {
            bill = BillDAO.getBill(idBill);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("bill",bill);
        request.getRequestDispatcher("admin/billDetail.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
