package Controller;

import DAO.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/AdAddOneProductController")
public class AdAddOneProductController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String img = request.getParameter("image");
        String author = request.getParameter("author");
        int type = Integer.parseInt(request.getParameter("type"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));
        int sale = Integer.parseInt(request.getParameter("sale"));
        Date date = Date.valueOf(request.getParameter("date"));
        ProductDAO.addProduct(id,name,type,img,author,quantity,description,price,sale,date);
        response.sendRedirect("AdProductController");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
