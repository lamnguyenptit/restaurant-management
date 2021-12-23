package com.lam.restaurantmanagement.nhanvien.model;

public class MonAnDat {
    private int id;
    private int soLuong;
    private long donGia;
    private MonAn monAn;

    public MonAnDat() {
    }

    public MonAnDat(int id, int soLuong, long donGia, MonAn monAn) {
        this.id = id;
        this.soLuong = soLuong;
        this.donGia = donGia;
        this.monAn = monAn;
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

    public MonAn getMonAn() {
        return monAn;
    }

    public void setMonAn(MonAn monAn) {
        this.monAn = monAn;
    }

    @Override
    public String toString() {
        return "MonAnDat{" +
                "id=" + id +
                ", soLuong=" + soLuong +
                ", donGia=" + donGia +
                ", monAn=" + monAn +
                '}';
    }
}
