package BEAN;

public class Logo {
    private int idLogo;
    private String img;

    public Logo(int idLogo, String img) {
        this.idLogo = idLogo;
        this.img = img;
    }

    public int getIdLogo() {
        return idLogo;
    }

    public void setIdLogo(int idLogo) {
        this.idLogo = idLogo;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
