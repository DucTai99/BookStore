package Controller;

import BEAN.Sach;
import DAO.BillDAO;
import DAO.GioHangDAO;
import DAO.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/IndexController")
public class IndexController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            GioHangDAO gioHang = null;
            HttpSession session = request.getSession();
            gioHang = (GioHangDAO) session.getAttribute("cart");
            if (gioHang == null) {
                gioHang = new GioHangDAO();
                GioHangDAO.capNhatDSSach();
            }
            session.setAttribute("cart", gioHang);
            ArrayList<Sach> listSachBanChay = ProductDAO.getListTopSell();
            ArrayList<Sach> listSachMoiNhat = ProductDAO.getListNewestProduct();
            request.setAttribute("listSachBanChay",listSachBanChay);
            request.setAttribute("listSachMoiNhat",listSachMoiNhat);
        }
        catch (RuntimeException e){
            System.out.println("het connection");
            response.sendRedirect("bookhome/Error.jsp");
            return;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("bookhome/index.jsp").forward(request,response);
    }
}
