<%@ page import="com.lam.restaurantmanagement.nhanvien.dao.*" %>
<%@ page import="com.lam.restaurantmanagement.nhanvien.model.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hoa Don</title>
</head>
<style>
    table, th, td {
        border: 1px solid black;
    }
</style>
<body style="margin-left: 300px">
<h1 style="margin-left: 100px">Hoá đơn</h1>
<% NhanVien nhanVien = (NhanVien) session.getAttribute("nhanvien");
    if (nhanVien == null)
        response.sendRedirect("gdDangNhap.jsp?err=timeout");
    String action = request.getParameter("action");
    ThongTinDatBan thongTinDatBan = (ThongTinDatBan) session.getAttribute("thongtindatban");
    List<MonAnDat> dsXoaMonAnDat = (List<MonAnDat>) session.getAttribute("dsxoamonandat");
    List<ComboDat> dsXoaComboDat = (List<ComboDat>) session.getAttribute("dsxoacombodat");
    if ((action == null) || (action.trim().length() == 0)) {
        int idThongTinDatBan = Integer.parseInt(request.getParameter("ban"));
        thongTinDatBan = (new ThongTinDatBanDAO().getThongTinDatBan(idThongTinDatBan));
        if (thongTinDatBan == null)
            response.sendRedirect("gdChonBan.jsp");
        dsXoaMonAnDat = new ArrayList<>();
        dsXoaComboDat = new ArrayList<>();
    } else if (action.equalsIgnoreCase("delete")) {
        if (request.getParameter("idmad") != null){
            int idMonAnDat = Integer.parseInt(request.getParameter("idmad"));
            for (BanDat banDat : thongTinDatBan.getBanDats()){
                for (MonAnDat tmp : banDat.getMonAnDats()) {
                    if (idMonAnDat == tmp.getId()) {
                        dsXoaMonAnDat.add(tmp);
                        banDat.getMonAnDats().remove(tmp);
                        break;
                    }
                }
            }
        }
        else if (request.getParameter("idcbd") != null){
            int idComboDat = Integer.parseInt(request.getParameter("idcbd"));
            for (BanDat banDat : thongTinDatBan.getBanDats()){
                for (ComboDat tmp : banDat.getComboDats()) {
                    if (idComboDat == tmp.getId()) {
                        dsXoaComboDat.add(tmp);
                        banDat.getComboDats().remove(tmp);
                        break;
                    }
                }
            }
        }
    } else if (action.equalsIgnoreCase("add")) {
        if (request.getParameter("idmad") != null){
            int idMonAnDat = Integer.parseInt(request.getParameter("idmad"));
            for (BanDat banDat : thongTinDatBan.getBanDats()){
                for (MonAnDat tmp : banDat.getMonAnDats()) {
                    if (idMonAnDat == tmp.getId()) {
                        tmp.setSoLuong(tmp.getSoLuong() + 1);
                        break;
                    }
                }
            }
        }
        else if (request.getParameter("idcbd") != null){
            int idComboDat = Integer.parseInt(request.getParameter("idcbd"));
            for (BanDat banDat : thongTinDatBan.getBanDats()) {
                for (ComboDat tmp : banDat.getComboDats()) {
                    if (idComboDat == tmp.getId()) {
                        tmp.setSoLuong(tmp.getSoLuong() + 1);
                        break;
                    }
                }
            }
        }
    } else if (action.equalsIgnoreCase("sub")) {
        if (request.getParameter("idmad") != null){
            int idMonAnDat = Integer.parseInt(request.getParameter("idmad"));
            for (BanDat banDat : thongTinDatBan.getBanDats()){
                for (MonAnDat tmp : banDat.getMonAnDats()) {
                    if (idMonAnDat == tmp.getId()) {
                        tmp.setSoLuong(tmp.getSoLuong() - 1);
                        break;
                    }
                }
            }
        }
        else if (request.getParameter("idcbd") != null){
            int idComboDat = Integer.parseInt(request.getParameter("idcbd"));
            for (BanDat banDat : thongTinDatBan.getBanDats()){
                for (ComboDat tmp : banDat.getComboDats()) {
                    if (idComboDat == tmp.getId()) {
                        tmp.setSoLuong(tmp.getSoLuong() - 1);
                        break;
                    }
                }
            }
        }
    }
    else if (action.equalsIgnoreCase("magiamgia")){
        String tenMGG = String.valueOf(request.getParameter("magiamgia"));
        thongTinDatBan.setMaGiamGia((new MaGiamGiaDAO()).getMaGiamGia(tenMGG));
    }
    KhachHang khachHang = thongTinDatBan.getKhachHang();
    List<BanDat> banDats = thongTinDatBan.getBanDats();
    StringBuilder maBan = new StringBuilder();
    for (BanDat banDat : banDats)
        maBan.append(banDat.getBan().getId()).append(", ");
    maBan.delete(maBan.length() - 2, maBan.length());
    long tongTien = 0;
%>
<div>Mã bàn: <%=maBan%>
</div>
<div>Nhân viên: <%=nhanVien.getTen()%>
</div>
<div>Mã nhân viên: <%=nhanVien.getId()%>
</div>
<div>Khách hàng: <%=khachHang.getTen()%>
</div>
<br>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Tên món</th>
        <th>Đơn giá</th>
        <th>Số lượng</th>
        <th>Thành tiền</th>
        <th>Chức năng</th>
    </tr>
    </thead>
    <tbody>
    <%for (BanDat banDat : thongTinDatBan.getBanDats()) {
        for (MonAnDat monAnDat : banDat.getMonAnDats()) {%>
    <tr>
        <td><%=monAnDat.getMonAn().getId()%></td>
        <td><%=monAnDat.getMonAn().getTen()%></td>
        <td><%=monAnDat.getMonAn().getGia()%></td>
        <td>
            <%if (monAnDat.getSoLuong() == 1) {%>
                <button onclick="return xoa()">-</button>
            <script type="text/javascript">
                function xoa() {
                    if(confirm('Bạn có muốn xoá món ăn này ?')){
                        location.href = "gdHoaDon.jsp?action=delete&&idmad=<%=monAnDat.getId()%>"
                    }else{
                        return false;
                    }
                }
            </script>
            <%}else {%>
                <button onclick="location.href='gdHoaDon.jsp?action=sub&&idmad=<%=monAnDat.getId()%>'">-</button>
            <%}%>
            <%=monAnDat.getSoLuong()%>
            <button onclick="location.href='gdHoaDon.jsp?action=add&&idmad=<%=monAnDat.getId()%>'">+</button>
        </td>
        <td><%=monAnDat.getSoLuong() * monAnDat.getMonAn().getGia()%></td>
        <td>
            <a href="gdHoaDon.jsp?action=delete&&idmad=<%=monAnDat.getId()%>" onclick="return confirm('Bạn có muốn xoá món ăn này ?')">
                <img width="15px" height="15px" src="https://image.flaticon.com/icons/png/512/1214/1214428.png" alt=""/>
            </a>
        </td>
    </tr>
    <%  tongTien += monAnDat.getSoLuong() * monAnDat.getMonAn().getGia();
        }
        for (ComboDat comboDat : banDat.getComboDats()) {%>
    <tr>
        <td><%=comboDat.getCombo().getId()%></td>
        <td><%=comboDat.getCombo().getTen()%></td>
        <td><%=comboDat.getCombo().getGia()%></td>
        <td>
            <%if (comboDat.getSoLuong() == 1){%>
            <button onclick="return xoa()">-</button>
            <script type="text/javascript">
                function xoa() {
                    if(confirm('Bạn có muốn xoá combo này ?')){
                        location.href = "gdHoaDon.jsp?action=delete&&idcbd=<%=comboDat.getId()%>"
                    }else{
                        return false;
                    }
                }
            </script>
            <%}else {%>
                <button onclick="location.href='gdHoaDon.jsp?action=sub&&idcbd=<%=comboDat.getId()%>'">-</button>
            <%}%>
            <%=comboDat.getSoLuong()%>
            <button onclick="location.href='gdHoaDon.jsp?action=add&&idcbd=<%=comboDat.getId()%>'">+</button>
        </td>
        <td><%=comboDat.getSoLuong() * comboDat.getCombo().getGia()%></td>
        <td>
            <a href="gdHoaDon.jsp?action=delete&&idcbd=<%=comboDat.getId()%>" onclick="return confirm('Bạn có muốn xoá combo này ?')">
                <img width="15px" height="15px" src="https://image.flaticon.com/icons/png/512/1214/1214428.png" alt=""/>
            </a>
        </td>
    </tr>
    <%  tongTien += comboDat.getSoLuong() * comboDat.getCombo().getGia();
        }
    }%>
    </tbody>
</table>
    <%if (thongTinDatBan.getMaGiamGia() != null && thongTinDatBan.getMaGiamGia().getId() != 0 && !thongTinDatBan.getMaGiamGia().getTrangThai()) {
        tongTien = tongTien - tongTien * thongTinDatBan.getMaGiamGia().getPhanTram() / 100;%>
    <div>Mã giảm giá: <%=thongTinDatBan.getMaGiamGia().getTen() + " (" + thongTinDatBan.getMaGiamGia().getPhanTram() + "%)"%></div>
    <%}
        thongTinDatBan.setTongTien(tongTien);%>
<div>Tổng tiền: <%=thongTinDatBan.getTongTien()%>
</div>
<br>
<form name="mgg" action="gdHoaDon.jsp?action=magiamgia" method="post">
    <div>Nhập mã giảm giá</div>
    <label><input type="text" name="magiamgia"></label>
    <input type="submit" value="Xác nhận">
    <%
        if (thongTinDatBan.getMaGiamGia() != null && thongTinDatBan.getMaGiamGia().getId() == 0){%>
    <div style="color: red">Nhập sai mã giảm giá !</div>
    <%
            thongTinDatBan.setMaGiamGia(null);
        }
    else if ((thongTinDatBan.getMaGiamGia() != null && thongTinDatBan.getMaGiamGia().getTrangThai())){%>
        <div style="color: red">Mã giảm giá đã được sử dụng !</div>
    <%
            thongTinDatBan.setMaGiamGia(null);
    }%>
</form>
<br>
<%
    session.setAttribute("thongtindatban", thongTinDatBan);
    session.setAttribute("dsxoamonandat", dsXoaMonAnDat);
    session.setAttribute("dsxoacombodat", dsXoaComboDat);
%>
<button onclick="function openPage(jsp) {
            window.top.location.href = jsp;
        }
    openPage('gdChonBan.jsp')">Quay lại
</button>
<% if (thongTinDatBan.getTongTien() > 0) {%>
    <button style="margin-left: 200px" onclick="function openPage(jsp) {
                window.top.location.href = jsp;
            }
        openPage('doThanhToan.jsp')">Thanh toán
    </button>
<%} else {%>
    <button style="margin-left: 200px" disabled>Thanh toán</button>
<%}%>
</body>
</html>
