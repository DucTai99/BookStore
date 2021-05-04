package Controller;

import BEAN.Comment;
import BEAN.User;
import DAO.CommentDAO;
import Util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

@WebServlet("/CommentForwardController")
public class CommentForwardController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String commentText = request.getParameter("commentText");
        String maSach = request.getParameter("maSach");

        Comment comment = new Comment();

        ArrayList<Comment> listComment = new ArrayList<>();

        String msg ="";
        if (user == null) {
        request.setAttribute("msg","Vui lòng đăng nhập để bình luận");
        } else {
            try {
                comment.setIdUser(user.getId());
                comment.setCommentText(commentText);
                CommentDAO.insertComment(maSach, comment);

            } catch (RuntimeException e) {
                response.sendRedirect(Util.fullPath("bookhome/Error.jsp"));
                return;
            }
        }
        try {
            listComment = CommentDAO.getListComment(maSach);
        } catch (RuntimeException e) {
            response.sendRedirect(Util.fullPath("bookhome/Error.jsp"));
            return;
        }

        request.setAttribute("listComment", listComment);
        request.getRequestDispatcher("bookhome/DisplayComment.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
