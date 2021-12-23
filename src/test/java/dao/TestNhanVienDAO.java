package dao;

import com.lam.restaurantmanagement.nhanvien.dao.NhanVienDAO;
import com.lam.restaurantmanagement.nhanvien.model.NhanVien;
import org.junit.Assert;
import org.junit.Test;

public class TestNhanVienDAO {
    private final NhanVienDAO nvDAO = new NhanVienDAO();

    @Test
    public void kiemTraDangNhap_testChuan1(){
        //Dung ten tai khoan va mat khau
        String taiKhoan = "lam", matKhau = "123456";
        NhanVien nhanVien = new NhanVien(taiKhoan, matKhau);
        Assert.assertTrue(nvDAO.kiemTraDangNhap(nhanVien));
    }

    @Test
    public void kiemTraDangNhap_testChuan2(){
        //Dung ten tai khoan va sai mat khau
        String taiKhoan = "lam1", matKhau = "123456";
        NhanVien nhanVien = new NhanVien(taiKhoan, matKhau);
        Assert.assertFalse(nvDAO.kiemTraDangNhap(nhanVien));
    }

    @Test
    public void kiemTraDangNhap_testChuan3(){
        //Sai ten tai khoan va dung mat khau
        String taiKhoan = "lam", matKhau = "1234567";
        NhanVien nhanVien = new NhanVien(taiKhoan, matKhau);
        Assert.assertFalse(nvDAO.kiemTraDangNhap(nhanVien));
    }

    @Test
    public void kiemTraDangNhap_testChuan4(){
        //Sai ten tai khoan va mat khau
        String taiKhoan = "lam1", matKhau = "1234567";
        NhanVien nhanVien = new NhanVien(taiKhoan, matKhau);
        Assert.assertFalse(nvDAO.kiemTraDangNhap(nhanVien));
    }
}
