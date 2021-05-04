package Controller;

import BEAN.Sach;
import BEAN.TheLoaiSach;
import BEAN.User;
import DAO.ProductDAO;
import DAO.TheLoaiDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AdChartProductController")
public class AdChartProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //chuyển trang product
        ArrayList<Sach> listProduct = new ArrayList<Sach>() ;
        ArrayList<TheLoaiSach> listTheLoai  = new ArrayList<TheLoaiSach>();
        ArrayList<Integer> listQuantity = new ArrayList<>();

        try {
            listProduct = ProductDAO.getAllProduct();
            listTheLoai = TheLoaiDAO.getAllBookType();
            for(int i = 0; i < listTheLoai.size();i++) {
                int quantity = ProductDAO.getListSameType(listTheLoai.get(i).getMaTheLoai()).size();
                listQuantity.add(quantity);
            }

        } catch (RuntimeException e) {
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }
        request.setAttribute("listTheLoai",listTheLoai);
        request.setAttribute("listQuantity", listQuantity);
        request.getRequestDispatcher("admin/chart.jsp").forward(request,response);


    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     doPost(request,response);
    }
}
