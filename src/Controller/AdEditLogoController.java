package Controller;

import BEAN.Logo;
import DAO.LogoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AdEditLogoController")
public class AdEditLogoController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idLogo = Integer.parseInt(request.getParameter("idLogo"));
        Logo logo = LogoDAO.getLogo(idLogo);
        request.setAttribute("logo",logo);
        request.getRequestDispatcher("admin/logo.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
