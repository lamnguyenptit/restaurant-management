package dao;

import com.lam.restaurantmanagement.nhanvien.dao.MaGiamGiaDAO;
import com.lam.restaurantmanagement.nhanvien.model.MaGiamGia;
import org.junit.Assert;
import org.junit.Test;

public class TestMaGiamGiaDAO {
    private final MaGiamGiaDAO maggDAO = new MaGiamGiaDAO();

    @Test
    public void getMaGiamGia_testChuan1(){
        //Ma giam gia co ton tai, chua su dung
        MaGiamGia mgg = maggDAO.getMaGiamGia("XINCHAO");
        Assert.assertEquals(1, mgg.getId());
        Assert.assertEquals("XINCHAO", mgg.getTen());
        Assert.assertFalse(mgg.getTrangThai());
    }

    @Test
    public void getMaGiamGia_testChuan2(){
        //Ma giam gia co ton tai, da su dung
        MaGiamGia mgg = maggDAO.getMaGiamGia("XINCHAO1");
        Assert.assertEquals(2, mgg.getId());
        Assert.assertEquals("XINCHAO1", mgg.getTen());
        Assert.assertTrue(mgg.getTrangThai());
    }

    @Test
    public void getMaGiamGia_testChuan3(){
        //Ma giam gia khong ton tai
        MaGiamGia mgg = maggDAO.getMaGiamGia("XINCHAO2");
        Assert.assertEquals(0, mgg.getId());
    }
}
