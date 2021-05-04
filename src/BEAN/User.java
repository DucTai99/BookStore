package BEAN;

import java.util.ArrayList;

public class User {
    private String id;
    private String email;
    private String password;
    private int level;
    private int active;
    private ArrayList<Bill> listBill = new ArrayList<>();

    public User() {

    }

    public User(String id, String email, String password, int level, int active) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.level = level;
        this.active = active;
    }

    public String getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public int getLevel() {
        return level;
    }

    public int getActive() {
        return active;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public ArrayList<Bill> getListBill() {
        return listBill;
    }

    public void setListBill(ArrayList<Bill> listBill) {
        this.listBill = listBill;
    }

    public void addBill(Bill bill) {
        listBill.add(bill);
    }
}
