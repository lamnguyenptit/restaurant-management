package com.lam.restaurantmanagement.nhanvien.dao;

import com.lam.restaurantmanagement.nhanvien.model.*;

import java.sql.*;
import java.util.*;

public class ThongTinDatBanDAO extends DAO {
    public List<ThongTinDatBan> getDSThongTinDatBan() {
        List<ThongTinDatBan> thongTinDatBans = new ArrayList<>();
        String sqlTTDB = "{call getDSThongTinDatBan()}";
        String sqlBD = "{call getDSBanDat(?)}";
        try {
            CallableStatement cs = con.prepareCall(sqlTTDB);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                ThongTinDatBan thongTinDatBan = new ThongTinDatBan();
                thongTinDatBan.setId(rs.getInt("Id"));
                thongTinDatBan.setThanhToan(rs.getInt("ThanhToan") == 1);

                CallableStatement csBan = con.prepareCall(sqlBD);
                csBan.setInt(1, thongTinDatBan.getId());
                ResultSet rsBan = csBan.executeQuery();
                while (rsBan.next()){
                    Ban ban = new Ban();
                    ban.setId(rsBan.getInt("tblBanId"));
                    ban.setTen(rsBan.getString("Ten"));

                    BanDat banDat = new BanDat();
                    banDat.setId(rsBan.getInt("Id"));
                    banDat.setBan(ban);
                    banDat.setThongTinDatBan(thongTinDatBan);
                    thongTinDatBan.getBanDats().add(banDat);
                }
                thongTinDatBans.add(thongTinDatBan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return thongTinDatBans;
    }

    public ThongTinDatBan getThongTinDatBan(int id) {
        String sql = "{call getThongTinDatBan(?)}";
        String sqlBD = "{call getDSBanDat(?)}";
        String sqlMAD = "{call getDSMonAnDat(?)}";
        String sqlCBD = "{call getDSComboDat(?)}";
        ThongTinDatBan thongTinDatBan = null;
        KhachHang khachHang = new KhachHang();
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                khachHang.setId(rs.getInt("Id"));
                khachHang.setTen(rs.getString("ten"));

                thongTinDatBan = new ThongTinDatBan();
                thongTinDatBan.setId(id);
                thongTinDatBan.setThanhToan(rs.getInt("ThanhToan") == 1);
                thongTinDatBan.setKhachHang(khachHang);
                if (rs.getObject("tblMaGiamGiaId") != null)
                    thongTinDatBan.setMaGiamGia(new MaGiamGia(rs.getInt("tblMaGiamGiaId")));
                if (rs.getObject("tblNhanVienId") != null)
                    thongTinDatBan.setNhanVien(new NhanVien(rs.getInt("tblNhanVienId")));

                CallableStatement csBan = con.prepareCall(sqlBD);
                csBan.setInt(1, thongTinDatBan.getId());
                ResultSet rsBan = csBan.executeQuery();
                while (rsBan.next()){
                    Ban ban = new Ban();
                    ban.setId(rsBan.getInt("tblBanId"));
                    ban.setTen(rsBan.getString("Ten"));

                    BanDat banDat = new BanDat();
                    banDat.setId(rsBan.getInt("Id"));
                    banDat.setBan(ban);
                    banDat.setThongTinDatBan(thongTinDatBan);

                    CallableStatement csMAD = con.prepareCall(sqlMAD);
                    csMAD.setInt(1, banDat.getId());
                    ResultSet rsMAD = csMAD.executeQuery();
                    while (rsMAD.next()){
                        MonAn monAn = new MonAn();
                        monAn.setId(rsMAD.getInt("tblMonAnId"));
                        monAn.setTen(rsMAD.getString("ten"));
                        monAn.setGia(rsMAD.getLong("gia"));

                        MonAnDat monAnDat = new MonAnDat();
                        monAnDat.setId(rsMAD.getInt("Id"));
                        monAnDat.setSoLuong(rsMAD.getInt("SoLuong"));
                        monAnDat.setMonAn(monAn);

                        banDat.getMonAnDats().add(monAnDat);
                    }

                    CallableStatement csCBD = con.prepareCall(sqlCBD);
                    csCBD.setInt(1, banDat.getId());
                    ResultSet rsCBD = csCBD.executeQuery();
                    while (rsCBD.next()){
                        Combo combo = new Combo();
                        combo.setId(rsCBD.getInt("tblComboId"));
                        combo.setTen(rsCBD.getString("ten"));
                        combo.setGia(rsCBD.getLong("gia"));

                        ComboDat comboDat = new ComboDat();
                        comboDat.setId(rsCBD.getInt("Id"));
                        comboDat.setSoLuong(rsCBD.getInt("SoLuong"));
                        comboDat.setCombo(combo);

                        banDat.getComboDats().add(comboDat);
                    }
                    thongTinDatBan.getBanDats().add(banDat);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return thongTinDatBan;
    }

    public boolean thanhToan(ThongTinDatBan thongTinDatBan, List<MonAnDat> xoaMonAnDat, List<ComboDat> xoaComboDat) {
        if (thongTinDatBan == null)
            return false;
        boolean kq = false;
        String sqlTTDB = "UPDATE tblthongtindatban SET ThanhToan = 1, tblNhanVienId = ? WHERE Id = ?;";
        String sqlMaGiamGia = "{call luuMGG(?, ?)}";
        String sqlXoaMonAn = "DELETE FROM tblmonandat WHERE Id = ?;";
        String sqlXoaCombo = "DELETE FROM tblcombodat WHERE Id = ?;";
        String sqlUpdateMonAn = "UPDATE tblmonandat SET SoLuong = ? WHERE Id = ?;";
        String sqlUpdateCombo = "UPDATE tblcombodat SET SoLuong = ? WHERE Id = ?;";
        try {
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareCall(sqlTTDB);
            ps.setInt(1, thongTinDatBan.getNhanVien().getId());
            ps.setInt(2, thongTinDatBan.getId());
            ps.executeUpdate();

            if (thongTinDatBan.getMaGiamGia() != null && thongTinDatBan.getMaGiamGia().getId() != 0){
                CallableStatement csMGG = con.prepareCall(sqlMaGiamGia);
                csMGG.setInt(1, thongTinDatBan.getMaGiamGia().getId());
                csMGG.setInt(2, thongTinDatBan.getId());
                csMGG.executeUpdate();
            }

            for (MonAnDat monAnDat : xoaMonAnDat){
                PreparedStatement deleteMAD = con.prepareStatement(sqlXoaMonAn);
                deleteMAD.setInt(1, monAnDat.getId());
                deleteMAD.executeUpdate();
            }

            for (ComboDat comboDat : xoaComboDat){
                PreparedStatement deleteCBD = con.prepareStatement(sqlXoaCombo);
                deleteCBD.setInt(1, comboDat.getId());
                deleteCBD.executeUpdate();
            }

            for (BanDat banDat : thongTinDatBan.getBanDats()){
                for (MonAnDat monAnDat : banDat.getMonAnDats()){
                    PreparedStatement updateMAD = con.prepareStatement(sqlUpdateMonAn);
                    updateMAD.setInt(1, monAnDat.getSoLuong());
                    updateMAD.setInt(2, monAnDat.getId());
                    updateMAD.executeUpdate();
                }
                for (ComboDat comboDat : banDat.getComboDats()){
                    PreparedStatement updateCBD = con.prepareStatement(sqlUpdateCombo);
                    updateCBD.setInt(1, comboDat.getSoLuong());
                    updateCBD.setInt(2, comboDat.getId());
                    updateCBD.executeUpdate();
                }
            }
//            con.commit();  //cmt lai neu chay JUnit test
            kq = true;
        } catch (SQLException e) {
            try{
//                con.rollback();  //cmt lai neu chay JUnit test
            }catch(Exception ex){
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
//                con.setAutoCommit(true);   //cmt lai neu chay JUnit test
            } catch (Exception e) {
                kq = false;
                e.printStackTrace();
            }
        }
        return kq;
    }
}
