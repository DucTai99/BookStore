package Controller;

import BEAN.Sach;
import BEAN.TheLoaiSach;
import BEAN.User;
import DAO.ProductDAO;
import DAO.TheLoaiDAO;
import org.apache.tomcat.util.buf.Utf8Decoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AdEditProduct")
public class AdEditProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String maSach = request.getParameter("maSach");
        ArrayList<TheLoaiSach> listBookType = new ArrayList<>();
        Sach sach = null;
        try {

            listBookType = TheLoaiDAO.getAllBookType();
            sach = ProductDAO.getSach(maSach);
        } catch (RuntimeException e) {
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }
//        System.out.print(maSach+1);
        request.setAttribute("listBookType", listBookType);
        request.setAttribute("sach", sach);
        request.getRequestDispatcher("admin/editProduct.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
