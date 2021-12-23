package com.lam.restaurantmanagement.nhanvien.model;

import java.util.ArrayList;
import java.util.List;

public class ThongTinDatBan {
    private int id;
    private long tongTien;
    private String ghiChu;
    private boolean thanhToan;
    private MaGiamGia maGiamGia;
    private NhanVien nhanVien;
    private KhachHang khachHang;
    private List<BanDat> banDats;

    public ThongTinDatBan() {
        this.banDats = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getTongTien() {
        return tongTien;
    }

    public void setTongTien(long tongTien) {
        this.tongTien = tongTien;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public boolean getThanhToan() {
        return thanhToan;
    }

    public void setThanhToan(boolean thanhToan) {
        this.thanhToan = thanhToan;
    }

    public MaGiamGia getMaGiamGia() {
        return maGiamGia;
    }

    public void setMaGiamGia(MaGiamGia maGiamGia) {
        this.maGiamGia = maGiamGia;
    }

    public NhanVien getNhanVien() {
        return nhanVien;
    }

    public void setNhanVien(NhanVien nhanVien) {
        this.nhanVien = nhanVien;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }

    public List<BanDat> getBanDats() {
        return banDats;
    }

    public void setBanDats(List<BanDat> banDats) {
        this.banDats = banDats;
    }

    @Override
    public String toString() {
        return "ThongTinDatBan{" +
                "id=" + id +
                ", tongTien=" + tongTien +
                ", ghiChu='" + ghiChu + '\'' +
                ", thanhToan=" + thanhToan +
                ", maGiamGia=" + maGiamGia +
                ", nhanVien=" + nhanVien +
                ", khachHang=" + khachHang +
                ", banDats=" + banDats +
                '}';
    }
}
