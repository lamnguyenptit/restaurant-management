<%@ page import="com.lam.restaurantmanagement.nhanvien.model.NhanVien" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Trang chu nhan vien</title>
</head>
<body style="margin-left: 300px">
    <%
        NhanVien nhanVien = (NhanVien) session.getAttribute("nhanvien");
        if (nhanVien == null)
            response.sendRedirect("gdDangNhap.jsp?err=timeout");
    %>
    <h1>Trang chủ nhân viên</h1>
    <button style="margin-left: 50px" onclick="function openPage(jsp) {
        window.top.location.href = jsp;
    }
    openPage('gdChonBan.jsp')">Thanh toán</button>
</body>
</html>
