package BEAN;

public class MaGiamGia {
    private int id;
    private String codeSale;
    private int khuyenMai;
    public MaGiamGia(){

    }
    public MaGiamGia(int id, String codeSale, int khuyenMai) {
        this.id = id;
        this.codeSale = codeSale;
        this.khuyenMai = khuyenMai;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodeSale() {
        return codeSale;
    }

    public void setCodeSale(String codeSale) {
        this.codeSale = codeSale;
    }

    public int getKhuyenMai() {
        return khuyenMai;
    }

    public void setKhuyenMai(int khuyenMai) {
        this.khuyenMai = khuyenMai;
    }
}
