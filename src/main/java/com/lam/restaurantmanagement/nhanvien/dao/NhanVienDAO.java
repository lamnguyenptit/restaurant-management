package com.lam.restaurantmanagement.nhanvien.dao;

import com.lam.restaurantmanagement.nhanvien.model.NhanVien;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class NhanVienDAO extends DAO{
    public boolean kiemTraDangNhap(NhanVien nhanVien){
        if(nhanVien.getTaiKhoan().contains("true") || nhanVien.getTaiKhoan().contains("=")||
                nhanVien.getMatKhau().contains("true") || nhanVien.getMatKhau().contains("="))
            return false;
        String sql = "{call kiemtraDN(?,?)}";
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, nhanVien.getTaiKhoan());
            cs.setString(2, nhanVien.getMatKhau());
            ResultSet rs = cs.executeQuery();
            if (rs.next()){
                nhanVien.setId(rs.getInt("Id"));
                nhanVien.setTen(rs.getString("Ten"));
                nhanVien.setDiaChi(rs.getString("DiaChi"));
                nhanVien.setSdt(rs.getString("Sdt"));
                nhanVien.setEmail(rs.getString("Email"));
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
        return false;
    }
}
