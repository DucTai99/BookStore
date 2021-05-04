package DAO;

import BEAN.Comment;
import DB.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDAO {
    public static void insertComment(String maSach, Comment comment) {
        String sql = "INSERT INTO `comment`(commentText,idUser,maSach) VALUES(?,?,?)";
        Connection con = null;

        try {
            con = ConnectionDB.connect();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, comment.getCommentText());
            pre.setString(2, comment.getIdUser());
            pre.setString(3, maSach);
            pre.executeUpdate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.pool.releaseConnection(con);
        }
    }

    public static ArrayList<Comment> getListComment(String maSach) {
        ArrayList<Comment> listComment = new ArrayList<>();
        String sql = "SELECT idComment,c.idUser,email,commentText  FROM `comment` c JOIN `user` u ON c.idUser = u.idUser WHERE maSach=?";
        Connection con = null;
        try {
            con = ConnectionDB.connect();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, maSach);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment(rs.getString("idComment"), rs.getString("c.idUser"),
                        rs.getString("email"), rs.getString("commentText"));
                listComment.add(comment);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionDB.pool.releaseConnection(con);
        }
        return listComment;
    }

    public static void main(String[] args) {

    }
}
