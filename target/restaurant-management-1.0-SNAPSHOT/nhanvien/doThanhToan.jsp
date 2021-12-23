<%@ page import="com.lam.restaurantmanagement.nhanvien.dao.ThongTinDatBanDAO" %>
<%@ page import="com.lam.restaurantmanagement.nhanvien.model.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Thanh Toan</title>
</head>
<body>
    <%
        NhanVien nhanVien = (NhanVien) session.getAttribute("nhanvien");
        if (nhanVien == null)
            response.sendRedirect("dangnhap.jsp?err=timeout");
        ThongTinDatBan thongTinDatBan = (ThongTinDatBan) session.getAttribute("thongtindatban");
        if (thongTinDatBan == null)
            response.sendRedirect("gdHoaDon.jsp");
        thongTinDatBan.setNhanVien(nhanVien);
        List<MonAnDat> dsXoaMonAnDat = (List<MonAnDat>) session.getAttribute("dsxoamonandat");
        List<ComboDat> dsXoaComboDat = (List<ComboDat>) session.getAttribute("dsxoacombodat");
        if((new ThongTinDatBanDAO()).thanhToan(thongTinDatBan, dsXoaMonAnDat, dsXoaComboDat)){
            session.removeAttribute("thongtindatban");
            session.removeAttribute("dsxoamonandat");
            session.removeAttribute("dsxoacombodat");
    %>
    <script type="text/javascript">
        alert("Thanh toán thành công!");
    </script>
    <%
        response.sendRedirect("gdChinhNV.jsp");
    }else{
    %>
    <script type="text/javascript">
        alert("Lỗi thanh toán!");
        history.back();
    </script>
    <%}%>
</body>
</html>
