package com.lam.restaurantmanagement.nhanvien.model;

public class Ban {
    private int id;
    private String ten;
    private int soCho;
    private String moTa;
    private NhaHang nhaHang;

    public Ban() {
    }

    public Ban(int id, String ten, int soCho, String moTa, NhaHang nhaHang) {
        this.id = id;
        this.ten = ten;
        this.soCho = soCho;
        this.moTa = moTa;
        this.nhaHang = nhaHang;
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

    public int getSoCho() {
        return soCho;
    }

    public void setSoCho(int soCho) {
        this.soCho = soCho;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public NhaHang getNhaHang() {
        return nhaHang;
    }

    public void setNhaHang(NhaHang nhaHang) {
        this.nhaHang = nhaHang;
    }
}
