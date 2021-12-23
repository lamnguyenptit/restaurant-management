<%@ page import="com.lam.restaurantmanagement.nhanvien.model.NhanVien" %>
<%@ page import="com.lam.restaurantmanagement.nhanvien.dao.NhanVienDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String taiKhoan = request.getParameter("taiKhoan");
    String matKhau = request.getParameter("matKhau");
    NhanVien nhanVien = new NhanVien(taiKhoan, matKhau);
    NhanVienDAO nhanVienDAO = new NhanVienDAO();
    boolean kq = nhanVienDAO.kiemTraDangNhap(nhanVien);
    if (kq){
        session.setAttribute("nhanvien", nhanVien);
        response.sendRedirect("nhanvien\\gdChinhNV.jsp");
    }
    else
        response.sendRedirect("gdDangNhap.jsp?err=fail");
%>
