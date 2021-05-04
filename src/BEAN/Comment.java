package BEAN;

public class Comment {
    private String idComment;
    private String idUser;
    private String userName;
    private String commentText;

    public Comment() {
    }

    public Comment(String idComment, String idUser, String userName, String commentText) {
        this.idComment = idComment;
        this.idUser = idUser;
        this.userName = userName;
        this.commentText = commentText;
    }

    public String getIdComment() {
        return idComment;
    }

    public void setIdComment(String idComment) {
        this.idComment = idComment;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }
}
