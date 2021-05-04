package Controller;

import Util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LogOut")

public class LogOut extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        session.invalidate();
        response.sendRedirect( Util.fullPath("bookhome/login.jsp"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);
    }
}
