package Controller;

import BEAN.User;
import DAO.InsertByExcelDAO;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AdAddProductController")
public class AdAddProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
//            InsertByExcelDAO.importExcel();
//            InsertByExcelDAO.uploadSingleFile(request);
        }
        catch (RuntimeException e){
//            e.printStackTrace();
            System.out.println(e.getMessage());
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }
        response.sendRedirect("AdProductController");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);
    }
}
