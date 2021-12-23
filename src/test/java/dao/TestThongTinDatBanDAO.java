package dao;

import com.lam.restaurantmanagement.nhanvien.dao.DAO;
import com.lam.restaurantmanagement.nhanvien.dao.ThongTinDatBanDAO;
import com.lam.restaurantmanagement.nhanvien.model.*;
import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TestThongTinDatBanDAO {
    private final ThongTinDatBanDAO ttdbDAO = new ThongTinDatBanDAO();

    @Test
    public void getDSThongTinDatBan_testChuan1(){
        //Khach hang dat 1 ban
        List<ThongTinDatBan> ttdbs = ttdbDAO.getDSThongTinDatBan();
        Assert.assertEquals(1, ttdbs.get(0).getBanDats().size());
    }

    @Test
    public void getDSThongTinDatBan_testChuan2(){
        //Khach hang dat nhieu ban
        List<ThongTinDatBan> ttdbs = ttdbDAO.getDSThongTinDatBan();
        Assert.assertTrue(ttdbs.get(1).getBanDats().size() > 1);
    }

    @Test
    public void getMonAnDatAndComboDat_testChuan1(){
        //Ban dat co 1 mon an, 1 combo
        ThongTinDatBan thongTinDatBan = ttdbDAO.getThongTinDatBan(3);
        List<MonAnDat> monAnDats = new ArrayList<>();
        List<ComboDat> comboDats = new ArrayList<>();
        for (BanDat banDat : thongTinDatBan.getBanDats()){
            monAnDats.addAll(banDat.getMonAnDats());
            comboDats.addAll(banDat.getComboDats());
        }
        Assert.assertEquals(1, monAnDats.size());
        Assert.assertEquals(1, comboDats.size());
    }

    @Test
    public void getMonAnDatAndComboDat_testChuan2(){
        //Ban dat co nhieu mon an, nhieu combo
        ThongTinDatBan thongTinDatBan = ttdbDAO.getThongTinDatBan(4);
        List<MonAnDat> monAnDats = new ArrayList<>();
        List<ComboDat> comboDats = new ArrayList<>();
        for (BanDat banDat : thongTinDatBan.getBanDats()){
            monAnDats.addAll(banDat.getMonAnDats());
            comboDats.addAll(banDat.getComboDats());
        }
        Assert.assertTrue(monAnDats.size() > 1);
        Assert.assertTrue(comboDats.size() > 1);
    }

    @Test
    public void getMonAnDatAndComboDat_testChuan3(){
        //Ban dat co khong mon an, khong co combo
        ThongTinDatBan thongTinDatBan = ttdbDAO.getThongTinDatBan(8);
        List<MonAnDat> monAnDats = new ArrayList<>();
        List<ComboDat> comboDats = new ArrayList<>();
        for (BanDat banDat : thongTinDatBan.getBanDats()){
            monAnDats.addAll(banDat.getMonAnDats());
            comboDats.addAll(banDat.getComboDats());
        }
        Assert.assertTrue(monAnDats.isEmpty());
        Assert.assertTrue(comboDats.isEmpty());
    }

    @Test
    public void getMonAnDatAndComboDat_testChuan4(){
        //Ban dat co 1 mon an, khong co combo
        ThongTinDatBan thongTinDatBan = ttdbDAO.getThongTinDatBan(5);
        List<MonAnDat> monAnDats = new ArrayList<>();
        List<ComboDat> comboDats = new ArrayList<>();
        for (BanDat banDat : thongTinDatBan.getBanDats()){
            monAnDats.addAll(banDat.getMonAnDats());
            comboDats.addAll(banDat.getComboDats());
        }
        Assert.assertEquals(1, monAnDats.size());
        Assert.assertTrue(comboDats.isEmpty());
    }

    @Test
    public void getMonAnDatAndComboDat_testChuan5(){
        //Ban dat co nhieu mon an, khong co combo
        ThongTinDatBan thongTinDatBan = ttdbDAO.getThongTinDatBan(1);
        List<MonAnDat> monAnDats = new ArrayList<>();
        List<ComboDat> comboDats = new ArrayList<>();
        for (BanDat banDat : thongTinDatBan.getBanDats()){
            monAnDats.addAll(banDat.getMonAnDats());
            comboDats.addAll(banDat.getComboDats());
        }
        Assert.assertTrue(monAnDats.size() > 1);
        Assert.assertTrue(comboDats.isEmpty());
    }

    @Test
    public void getMonAnDatAndComboDat_testChuan6(){
        //Ban dat khong co mon an, co 1 combo
        ThongTinDatBan thongTinDatBan = ttdbDAO.getThongTinDatBan(6);
        List<MonAnDat> monAnDats = new ArrayList<>();
        List<ComboDat> comboDats = new ArrayList<>();
        for (BanDat banDat : thongTinDatBan.getBanDats()){
            monAnDats.addAll(banDat.getMonAnDats());
            comboDats.addAll(banDat.getComboDats());
        }
        Assert.assertTrue(monAnDats.isEmpty());
        Assert.assertEquals(1, comboDats.size());
    }

    @Test
    public void getMonAnDatAndComboDat_testChuan7(){
        //Ban dat khong co mon an, co nhieu combo
        ThongTinDatBan thongTinDatBan = ttdbDAO.getThongTinDatBan(7);
        List<MonAnDat> monAnDats = new ArrayList<>();
        List<ComboDat> comboDats = new ArrayList<>();
        for (BanDat banDat : thongTinDatBan.getBanDats()){
            monAnDats.addAll(banDat.getMonAnDats());
            comboDats.addAll(banDat.getComboDats());
        }
        Assert.assertTrue(monAnDats.isEmpty());
        Assert.assertTrue(comboDats.size() > 1);
    }

    @Test
    public void thanhToan_testChuan1() {
        //Thanh toan khong dung ma giam gia, khong chinh sua mon an
        ThongTinDatBan ttdb = ttdbDAO.getThongTinDatBan(4);
        NhanVien nhanVien = new NhanVien();
        nhanVien.setId(1);
        ttdb.setNhanVien(nhanVien);
        List<MonAnDat> xoaMAD = new ArrayList<>();
        List<ComboDat> xoaCBD = new ArrayList<>();
        try {
            DAO.con.setAutoCommit(false);
            boolean ok = ttdbDAO.thanhToan(ttdb, xoaMAD, xoaCBD);
            Assert.assertTrue(ok);

            ThongTinDatBan ttdbNew = ttdbDAO.getThongTinDatBan(4);
            Assert.assertTrue(ttdbNew.getThanhToan());
            Assert.assertEquals(nhanVien.getId(), ttdbNew.getNhanVien().getId());
            Assert.assertNull(ttdbNew.getMaGiamGia());
            List<MonAnDat> monAnDats = new ArrayList<>();
            List<ComboDat> comboDats = new ArrayList<>();
            for (BanDat banDat : ttdbNew.getBanDats()){
                monAnDats.addAll(banDat.getMonAnDats());
                comboDats.addAll(banDat.getComboDats());
            }
            Assert.assertFalse(monAnDats.isEmpty());
            Assert.assertFalse(comboDats.isEmpty());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Test
    public void thanhToan_testChuan2() {
        //Thanh toan co dung ma giam gia, khong chinh sua mon an
        ThongTinDatBan ttdb = ttdbDAO.getThongTinDatBan(4);
        NhanVien nhanVien = new NhanVien();
        nhanVien.setId(1);
        MaGiamGia maGiamGia = new MaGiamGia();
        maGiamGia.setId(1);
        ttdb.setNhanVien(nhanVien);
        ttdb.setMaGiamGia(maGiamGia);
        List<MonAnDat> xoaMAD = new ArrayList<>();
        List<ComboDat> xoaCBD = new ArrayList<>();
        try {
            DAO.con.setAutoCommit(false);
            boolean ok = ttdbDAO.thanhToan(ttdb, xoaMAD, xoaCBD);
            Assert.assertTrue(ok);

            ThongTinDatBan ttdbNew = ttdbDAO.getThongTinDatBan(4);
            Assert.assertTrue(ttdbNew.getThanhToan());
            Assert.assertEquals(nhanVien.getId(), ttdbNew.getNhanVien().getId());
            Assert.assertEquals(maGiamGia.getId(), ttdbNew.getMaGiamGia().getId());
            List<MonAnDat> monAnDats = new ArrayList<>();
            List<ComboDat> comboDats = new ArrayList<>();
            for (BanDat banDat : ttdbNew.getBanDats()){
                monAnDats.addAll(banDat.getMonAnDats());
                comboDats.addAll(banDat.getComboDats());
            }
            Assert.assertFalse(monAnDats.isEmpty());
            Assert.assertFalse(comboDats.isEmpty());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Test
    public void thanhToan_testChuan3() {
        //Thanh toan khong dung ma giam gia, co tang mon an
        ThongTinDatBan ttdb = ttdbDAO.getThongTinDatBan(4);
        NhanVien nhanVien = new NhanVien();
        nhanVien.setId(1);
        ttdb.setNhanVien(nhanVien);
        List<MonAnDat> xoaMAD = new ArrayList<>();
        List<ComboDat> xoaCBD = new ArrayList<>();

        for (BanDat banDat : ttdb.getBanDats()){
            banDat.getMonAnDats().get(0).setSoLuong(banDat.getMonAnDats().get(0).getSoLuong() + 1);
            banDat.getComboDats().get(0).setSoLuong(banDat.getComboDats().get(0).getSoLuong() + 1);
            break;
        }
        try {
            DAO.con.setAutoCommit(false);
            boolean ok = ttdbDAO.thanhToan(ttdb, xoaMAD, xoaCBD);
            Assert.assertTrue(ok);

            ThongTinDatBan ttdbNew = ttdbDAO.getThongTinDatBan(4);
            Assert.assertTrue(ttdbNew.getThanhToan());
            Assert.assertEquals(nhanVien.getId(), ttdbNew.getNhanVien().getId());
            Assert.assertNull(ttdbNew.getMaGiamGia());
            List<MonAnDat> monAnDats = new ArrayList<>();
            List<ComboDat> comboDats = new ArrayList<>();
            for (BanDat banDat : ttdbNew.getBanDats()){
                monAnDats.addAll(banDat.getMonAnDats());
                comboDats.addAll(banDat.getComboDats());
            }
            Assert.assertEquals(3, monAnDats.get(0).getSoLuong());
            Assert.assertEquals(3, comboDats.get(0).getSoLuong());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Test
    public void thanhToan_testChuan4() {
        //Thanh toan khong dung ma giam gia, co giam mon an
        ThongTinDatBan ttdb = ttdbDAO.getThongTinDatBan(4);
        NhanVien nhanVien = new NhanVien();
        nhanVien.setId(1);
        ttdb.setNhanVien(nhanVien);
        List<MonAnDat> xoaMAD = new ArrayList<>();
        List<ComboDat> xoaCBD = new ArrayList<>();

        for (BanDat banDat : ttdb.getBanDats()){
            banDat.getMonAnDats().get(0).setSoLuong(banDat.getMonAnDats().get(0).getSoLuong() - 1);
            banDat.getComboDats().get(0).setSoLuong(banDat.getComboDats().get(0).getSoLuong() - 1);
            break;
        }
        try {
            DAO.con.setAutoCommit(false);
            boolean ok = ttdbDAO.thanhToan(ttdb, xoaMAD, xoaCBD);
            Assert.assertTrue(ok);

            ThongTinDatBan ttdbNew = ttdbDAO.getThongTinDatBan(4);
            Assert.assertTrue(ttdbNew.getThanhToan());
            Assert.assertEquals(nhanVien.getId(), ttdbNew.getNhanVien().getId());
            Assert.assertNull(ttdbNew.getMaGiamGia());
            List<MonAnDat> monAnDats = new ArrayList<>();
            List<ComboDat> comboDats = new ArrayList<>();
            for (BanDat banDat : ttdbNew.getBanDats()){
                monAnDats.addAll(banDat.getMonAnDats());
                comboDats.addAll(banDat.getComboDats());
            }
            Assert.assertEquals(1, monAnDats.get(0).getSoLuong());
            Assert.assertEquals(1, comboDats.get(0).getSoLuong());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Test
    public void thanhToan_testChuan5() {
        //Thanh toan khong dung ma giam gia, co xoa mon an
        ThongTinDatBan ttdb = ttdbDAO.getThongTinDatBan(4);
        NhanVien nhanVien = new NhanVien();
        nhanVien.setId(1);
        ttdb.setNhanVien(nhanVien);
        List<MonAnDat> xoaMAD = new ArrayList<>();
        List<ComboDat> xoaCBD = new ArrayList<>();

        for (BanDat banDat : ttdb.getBanDats()){
            xoaMAD.add(banDat.getMonAnDats().get(0));
            xoaCBD.add(banDat.getComboDats().get(0));
            break;
        }
        try {
            DAO.con.setAutoCommit(false);
            boolean ok = ttdbDAO.thanhToan(ttdb, xoaMAD, xoaCBD);
            Assert.assertTrue(ok);

            ThongTinDatBan ttdbNew = ttdbDAO.getThongTinDatBan(4);
            Assert.assertTrue(ttdbNew.getThanhToan());
            Assert.assertEquals(nhanVien.getId(), ttdbNew.getNhanVien().getId());
            Assert.assertNull(ttdbNew.getMaGiamGia());
            List<MonAnDat> monAnDats = new ArrayList<>();
            List<ComboDat> comboDats = new ArrayList<>();
            for (BanDat banDat : ttdbNew.getBanDats()){
                monAnDats.addAll(banDat.getMonAnDats());
                comboDats.addAll(banDat.getComboDats());
            }
            Assert.assertEquals(1, monAnDats.size());
            Assert.assertEquals(1, comboDats.size());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Test
    public void thanhToan_testChuan6() {
        //Thanh toan nhieu ban khong dung ma giam gia, khong chinh sua mon an, moi ban co nhieu mon an, combo
        ThongTinDatBan ttdb = ttdbDAO.getThongTinDatBan(2);
        NhanVien nhanVien = new NhanVien();
        nhanVien.setId(1);
        ttdb.setNhanVien(nhanVien);
        List<MonAnDat> xoaMAD = new ArrayList<>();
        List<ComboDat> xoaCBD = new ArrayList<>();
        try {
            DAO.con.setAutoCommit(false);
            boolean ok = ttdbDAO.thanhToan(ttdb, xoaMAD, xoaCBD);
            Assert.assertTrue(ok);

            ThongTinDatBan ttdbNew = ttdbDAO.getThongTinDatBan(2);
            Assert.assertTrue(ttdbNew.getThanhToan());
            Assert.assertEquals(nhanVien.getId(), ttdbNew.getNhanVien().getId());
            Assert.assertNull(ttdbNew.getMaGiamGia());
            for (BanDat banDat : ttdbNew.getBanDats()){
                Assert.assertEquals(1, banDat.getMonAnDats().size());
                Assert.assertEquals(1, banDat.getComboDats().size());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
