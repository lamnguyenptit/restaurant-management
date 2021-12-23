package com.lam.restaurantmanagement.nhanvien.model;

public class Combo {
    private int id;
    private String ten, moTa;
    private long gia;

    public Combo() {
    }

    public Combo(int id, String ten, String moTa, long gia) {
        this.id = id;
        this.ten = ten;
        this.moTa = moTa;
        this.gia = gia;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public long getGia() {
        return gia;
    }

    public void setGia(long gia) {
        this.gia = gia;
    }
}
