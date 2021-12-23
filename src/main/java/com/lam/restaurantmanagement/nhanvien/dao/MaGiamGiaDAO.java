package com.lam.restaurantmanagement.nhanvien.dao;

import com.lam.restaurantmanagement.nhanvien.model.MaGiamGia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MaGiamGiaDAO extends DAO{
    public MaGiamGia getMaGiamGia(String name){
        String sql = "SELECT * FROM tblmagiamgia WHERE Ten = (?);";
        MaGiamGia maGiamGia = new MaGiamGia();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                maGiamGia.setId(rs.getInt("Id"));
                maGiamGia.setTen(rs.getString("Ten"));
                maGiamGia.setPhanTram(rs.getInt("PhanTram"));
                maGiamGia.setTrangThai(rs.getInt("TrangThai") == 1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return maGiamGia;
    }
}
