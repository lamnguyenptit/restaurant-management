package com.lam.restaurantmanagement.nhanvien.model;

public class ComboDat {
    private int id;
    private int soLuong;
    private long donGia;
    private Combo combo;

    public ComboDat() {
    }

    public ComboDat(int id, int soLuong, long donGia, Combo combo) {
        this.id = id;
        this.soLuong = soLuong;
        this.donGia = donGia;
        this.combo = combo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public long getDonGia() {
        return donGia;
    }

    public void setDonGia(long donGia) {
        this.donGia = donGia;
    }

    public Combo getCombo() {
        return combo;
    }

    public void setCombo(Combo combo) {
        this.combo = combo;
    }
}
