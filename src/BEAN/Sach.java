package BEAN;

import java.util.ArrayList;

public class Sach {
    private String maSach;
    private String tenSach;
    private int loaiSach;
    private int gia;
    private int soLuong;
    private String tenTacGia;
    private String hinhAnh;
    private String moTa;
    private int khuyenMai;
    private int soLuongMua;
    private String tenLoaiSach;
    public Sach() {
    }

    public Sach(String maSach, String tenSach, int loaiSach, int gia, int soLuong, String tenTacGia, String hinhAnh, String moTa,int khuyenMai) {
        this.maSach = maSach;
        this.tenSach = tenSach;
        this.loaiSach = loaiSach;
        this.gia = gia;
        this.soLuong = soLuong;
        this.tenTacGia = tenTacGia;
        this.hinhAnh = hinhAnh;
        this.moTa = moTa;
        this.khuyenMai = khuyenMai;
    }

    public int getKhuyenMai() {
        return khuyenMai;
    }

    public void setKhuyenMai(int khuyenMai) {
        this.khuyenMai = khuyenMai;
    }

    public String getMaSach() {
        return maSach;
    }

    public void setMaSach(String maSach) {
        this.maSach = maSach;
    }

    public String getTenSach() {
        return tenSach;
    }

    public void setTenSach(String tenSach) {
        this.tenSach = tenSach;
    }

    public int getLoaiSach() {
        return loaiSach;
    }

    public void setLoaiSach(int loaiSach) {
        this.loaiSach = loaiSach;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getTenTacGia() {
        return tenTacGia;
    }

    public void setTenTacGia(String tenTacGia) {
        this.tenTacGia = tenTacGia;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public int getSoLuongMua() {
        return soLuongMua;
    }

    public void setSoLuongMua(int soLuongMua) {
        this.soLuongMua = soLuongMua;
    }


    public String getTenLoaiSach() {
        return tenLoaiSach;
    }

    public void setTenLoaiSach(String tenLoaiSach) {
        this.tenLoaiSach = tenLoaiSach;
    }

    public double tongTien(){
        return this.gia*this.soLuongMua;
}

public int tienKhuyenMai(){
        double khuyenMaiPhanTram = (100.0 - khuyenMai) / 100.0;
        int tienKhuyenMai = (int) Math.ceil(gia * khuyenMaiPhanTram) ;
        return tienKhuyenMai;
}

    @Override
    public String toString() {
        return "Sach{" +
                "maSach=" + maSach + "quantity: "+soLuongMua+
                ", tenSach='" + tenSach + '\'' +
                ", loaiSach='" + loaiSach + '\'' +
                ", gia=" + gia +
                ", soLuong=" + soLuong +
                ", tenTacGia='" + tenTacGia + '\'' +
                ", hinhAnh='" + hinhAnh + '\'' +
                ", moTa='" + moTa + '\'' +
                '}';
    }
}
