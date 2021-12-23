<%@ page import="com.lam.restaurantmanagement.nhanvien.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lam.restaurantmanagement.nhanvien.dao.ThongTinDatBanDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chon ban</title>
</head>
<body style="margin-left: 300px">
    <%
        NhanVien nhanVien = (NhanVien) session.getAttribute("nhanvien");
        if (nhanVien == null)
            response.sendRedirect("gdDangNhap.jsp?err=timeout");
        List<ThongTinDatBan> thongTinDatBans = (new ThongTinDatBanDAO()).getDSThongTinDatBan();
    %>
    <h1 style="margin-left: 100px">Chọn bàn </h1>
    <div>Bàn
    <form name="chonban" action="gdHoaDon.jsp" method="post">
        <select name="ban">
            <option value="-1" selected>--chọn bàn--</option>
            <%for (ThongTinDatBan tmp : thongTinDatBans){
                List<BanDat> banDats = tmp.getBanDats();
                StringBuilder ban = new StringBuilder();
                for (BanDat b : banDats)
                    ban.append(b.getBan().getId()).append(", ");
                ban.delete(ban.length()-2, ban.length());
            %>
            <option value="<%=tmp.getId()%>"><%=ban.toString()%></option>
            <%}%>
        </select>
        <input type="submit" value="Tiếp tục"/>
    </form>
    </div>
    <button onclick="function openPage(jsp) {
            window.top.location.href = jsp;
        }
    openPage('gdChinhNV.jsp')">Quay lại
    </button>
</body>
</html>
