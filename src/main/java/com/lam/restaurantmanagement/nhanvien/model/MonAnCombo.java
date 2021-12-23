package com.lam.restaurantmanagement.nhanvien.model;

public class MonAnCombo {
    private int id;
    private MonAn monAn;
    private Combo combo;

    public MonAnCombo() {
    }

    public MonAnCombo(int id, MonAn monAn, Combo combo) {
        this.id = id;
        this.monAn = monAn;
        this.combo = combo;
    }
}
