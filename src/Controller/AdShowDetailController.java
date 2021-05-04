package Controller;

import BEAN.Sach;
import BEAN.TheLoaiSach;
import DAO.ProductDAO;
import DAO.TheLoaiDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AdShowDetailController")
public class AdShowDetailController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idSach = request.getParameter("maSach");
        Sach sach = ProductDAO.getSach(idSach);
        ArrayList<TheLoaiSach> theloai = TheLoaiDAO.getAllBookType();
        String theloaiSach="";
        for( int i = 0; i < theloai.size();i++) {
            if(theloai.get(i).getMaTheLoai() == sach.getLoaiSach()) {
                theloaiSach = theloai.get(i).getTenTheLoai();
            }
        }

        request.setAttribute("sach",sach);
        request.setAttribute("theLoaiSach",theloaiSach);
        request.getRequestDispatcher("admin/detailProduct.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
