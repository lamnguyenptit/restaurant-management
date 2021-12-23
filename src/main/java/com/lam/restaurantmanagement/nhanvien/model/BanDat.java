package com.lam.restaurantmanagement.nhanvien.model;

import java.util.ArrayList;
import java.util.List;

public class BanDat {
    private int id;
    private String ghiChu;
    private Ban ban;
    private ThongTinDatBan thongTinDatBan;
    private List<MonAnDat> monAnDats;
    private List<ComboDat> comboDats;

    public BanDat() {
        monAnDats = new ArrayList<>();
        comboDats = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public Ban getBan() {
        return ban;
    }

    public void setBan(Ban ban) {
        this.ban = ban;
    }

    public ThongTinDatBan getThongTinDatBan() {
        return thongTinDatBan;
    }

    public void setThongTinDatBan(ThongTinDatBan thongTinDatBan) {
        this.thongTinDatBan = thongTinDatBan;
    }

    public List<MonAnDat> getMonAnDats() {
        return monAnDats;
    }

    public void setMonAnDats(List<MonAnDat> monAnDats) {
        this.monAnDats = monAnDats;
    }

    public List<ComboDat> getComboDats() {
        return comboDats;
    }

    public void setComboDats(List<ComboDat> comboDats) {
        this.comboDats = comboDats;
    }
}
