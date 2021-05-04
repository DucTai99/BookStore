package BEAN;

import java.sql.Date;
import java.util.ArrayList;

public class Bill {
    private int id;
    private String detail;
    private String useremail;
    private int total;
    private String address;
    private String payment;
    private Date date;
    private ArrayList<Sach> listSach = new ArrayList<>();
    private String name;
    private String phoneNumber;
    private int tinhTrangBill;

    //    public Bill(int id, String detail, String useremail, String address, String payment, Date date) {
//        this.id = id;
//        this.detail = detail;
//        this.useremail = useremail;
//        this.address = address;
//        this.payment = payment;
//        this.date = date;
//    }
    public Bill(int id, String detail, String useremail, String address, String payment, Date date, String name, String phoneNumber,int total) {
        this.id = id;
        this.detail = detail;
        this.useremail = useremail;
        this.address = address;
        this.payment = payment;
        this.date = date;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.total = total;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getTinhTrangBill() {
        return tinhTrangBill;
    }

    public void setTinhTrangBill(int tinhTrangBill) {
        this.tinhTrangBill = tinhTrangBill;
    }
    public ArrayList<Sach> getListSach() {
        return listSach;
    }

    public void setListSach(ArrayList<Sach> listSach) {
        this.listSach = listSach;
    }
    public void addSach(Sach sach){
        listSach.add(sach);
    }
    public int total(){
        int result = 0;
        for (int i = 0; i < listSach.size(); i++) {
            result+=listSach.get(i).getGia()*listSach.get(i).getSoLuongMua();
        }
        return result;
    }
    public double tongTien(){
        double tongTien = 0;
        for (int i = 0; i < listSach.size(); i++) {
            tongTien+=listSach.get(i).tongTien();
        }
        return tongTien;
    }
    @Override
    public String toString() {
        String str = "";
        for (int i = 0; i < listSach.size(); i++) {
            str+=listSach.get(i).toString()+"\n\n";
        }
        return "Bill{" +
                "id=" + id +
                ", detail='" + detail + '\'' +
                ", useremail='" + useremail + '\'' +
                ", total=" + total +
                ", address='" + address + '\'' +
                ", payment='" + payment + '\'' +
                ", date=" + date +
                ", listSach=\n" +listSach.size()+ str +"\n"+
                '}';
    }
}
