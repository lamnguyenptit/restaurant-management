<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Dang nhap</title>
    </head>
    <body style="margin-left: 300px">
        <h2 style="margin-left: 100px"> Đăng nhập </h2>
        <form name="dangnhap" action="doDangNhap.jsp" method="post">
            <table border="0">
                <tr>
                    <td>Tên đăng nhập:</td>
                    <td><input type="text" name="taiKhoan" id="taiKhoan" required/></td>
                </tr>
                <tr>
                    <td>Mật khẩu:</td>
                    <td><input type="password" name="matKhau" id="matKhau" required/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Đăng nhập"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
