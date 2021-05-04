package Controller;

import DAO.LayLaiPassDAO;
import Util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LayMatKhauController")
public class LayMatKhauController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String code = request.getParameter("code");
        String username = request.getParameter("username");
        try {

            if (LayLaiPassDAO.soSanhCode(username, code)) {
//            request.getRequestDispatcher(Util.fullPath("bookhome/LayLaiMatKhau.jsp")).forward(request,response);
                String newpass = LayLaiPassDAO.stringRandom();
                LayLaiPassDAO.thayDoiMatKhau(username, newpass);
                response.getWriter().println("Mat khau moi cua ban la: " + newpass);
            } else {
                response.getWriter().println("Duong dan khong dung");
            }
        } catch (RuntimeException e) {
            response.sendRedirect("bookhome/Error.jsp");
            return;
        }
    }
}
