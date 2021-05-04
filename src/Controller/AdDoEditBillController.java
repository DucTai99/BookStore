//package Controller;
//
//import BEAN.User;
//import DAO.BillDAO;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.sql.Date;
//
//@WebServlet("/AdDoEditBillController")
//public class AdDoEditBillController extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        //phân quyền
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//        if(user==null || user.getLevel()<2){
//            response.getWriter().println("Ban khong co quyen truy cap");
//            return;
//        }
//
//        int idBill = Integer.parseInt(request.getParameter("edit_id"));
//        String detail = request.getParameter("edit_detail");
//        int idUserEmail = Integer.parseInt(request.getParameter("selectIdUserEmail"));
//
//        int total = Integer.parseInt(request.getParameter("edit_total"));
//        String address = request.getParameter("edit_address");
//        int payment = Integer.parseInt(request.getParameter("edit_payment"));
//        Date date = Date.valueOf(request.getParameter("edit_date"));
//        int quantity = Integer.parseInt(request.getParameter("edit_quantity"));
//        response.sendRedirect("AdBillController");
//
//    }
//}
