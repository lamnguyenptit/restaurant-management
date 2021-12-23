package com.lam.restaurantmanagement.nhanvien.model;

public class NhaHang {
    private int id;
    private String ten, diaChi, moTa;

    public NhaHang() {
    }

    public NhaHang(int id, String ten, String diaChi, String moTa) {
        this.id = id;
        this.ten = ten;
        this.diaChi = diaChi;
        this.moTa = moTa;
    }
}
