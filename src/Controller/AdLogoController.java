package Controller;

import BEAN.Logo;
import DAO.LogoDAO;
import org.apache.tomcat.util.compat.JrePlatform;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AdLogoController")
public class AdLogoController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Logo> listLogo = LogoDAO.getAllLogo();
        request.setAttribute("listLogo",listLogo);
        request.getRequestDispatcher("admin/homePageManagement.jsp").forward(request,response);
    }
}
