package Controller;

import DAO.LogoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AdDoEditLogoController")
public class AdDoEditLogoController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idLogo = Integer.parseInt(request.getParameter("idLogo"));
        String defautImg = request.getParameter("imgDefaut");
        String imgEdit = request.getParameter("imgEdit");
        String img ="admin/assets/img/"+ imgEdit;
        if(imgEdit=="") {
            img = defautImg;
        }
        LogoDAO.editLogo(idLogo,img);
        response.sendRedirect("AdLogoController");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
