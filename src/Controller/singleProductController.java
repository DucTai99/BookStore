package Controller;

import BEAN.Comment;
import BEAN.Sach;
import DAO.CommentDAO;
import DAO.ProductDAO;
import DAO.ShopDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/singleProductController")
public class singleProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduct = request.getParameter("idProduct");
        Sach sach = ProductDAO.getSach(idProduct);
        ArrayList<Sach> listSach= null;
        ArrayList<Comment> listComment = new ArrayList<>();
        try {
             listSach = ShopDAO.getSachTheoTheLoai(sach.getLoaiSach()+"",1);
             listComment = CommentDAO.getListComment(idProduct);
        } catch (SQLException e) {
            e.printStackTrace();
        }catch (RuntimeException e){
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }
        request.setAttribute("sach", sach);
        request.setAttribute("listComment",listComment);
        request.setAttribute("listSach",listSach);
        request.getRequestDispatcher("bookhome/single-product.jsp").forward(request, response);
    }
}
