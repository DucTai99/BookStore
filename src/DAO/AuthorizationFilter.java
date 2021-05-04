package DAO;

import BEAN.User;
import Util.Util;
import org.apache.poi.util.SystemOutLogger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthorizationFilter implements Filter {
    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();
        System.out.println("xin chao cac ban, tui la filter");
        if (url.contains("admin") || url.contains("Ad")) {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user != null) {
                if (user.getLevel() >= 2) {
                    //Cho vô trang admin
                    filterChain.doFilter(servletRequest, servletResponse);
                } else {
                    //không cho vô trang admin
                    response.sendRedirect(Util.fullPath("bookhome/authenticateError.jsp"));
                }
            } else {
                response.sendRedirect(Util.fullPath("bookhome/login.jsp"));
            }

        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }

    public static void main(String[] args) {

    }
}