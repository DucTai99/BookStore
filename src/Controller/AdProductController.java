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

@WebServlet("/AdProductController")
public class AdProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //chuyển trang product
        ArrayList<Sach> listProduct = new ArrayList<>();
        ArrayList<TheLoaiSach> listType = TheLoaiDAO.getAllBookType();
        int page = 1;
        if(request.getParameter("page")!= null ){
            page = Integer.parseInt(request.getParameter("page"));
        }

        int numberOfPage = ProductDAO.numOfPage();
        try {
            listProduct = ProductDAO.getListPage(page);
        } catch (RuntimeException e) {
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }
        request.setAttribute("listType",listType);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("numberOfPage", numberOfPage);
        request.getRequestDispatcher("admin/product.jsp").forward(request,response);


    }
}
