package com.lam.restaurantmanagement.nhanvien.model;

public class MaGiamGia {
    private int id;
    private String ten;
    private int phanTram;
    private boolean trangThai;

    public MaGiamGia() {
    }

    public MaGiamGia(int id, String ten, int phanTram, boolean trangThai) {
        this.id = id;
        this.ten = ten;
        this.phanTram = phanTram;
        this.trangThai = trangThai;
    }

    public MaGiamGia(int id) {
        this.id = id;
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

    public int getPhanTram() {
        return phanTram;
    }

    public void setPhanTram(int phanTram) {
        this.phanTram = phanTram;
    }

    public boolean getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }

    @Override
    public String toString() {
        return "MaGiamGia{" +
                "id=" + id +
                ", ten='" + ten + '\'' +
                ", phanTram=" + phanTram +
                ", trangThai=" + trangThai +
                '}';
    }
}
