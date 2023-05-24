<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/23/2023
  Time: 10:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách học viên</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<h1>Danh sách học viên trung tâm codegym</h1>
<table class="table">
    <thead>
    <tr class="tr">
        <th>MÃ HỌC VIÊN:</th>
        <th>TÊN HỌC VIÊN:</th>
        <th>GIỚI TÍNH:</th>
        <th>ĐIỂM SỐ:</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${hocVienList}" var="hocvien">
        <tr>
            <td>${hocvien.maHocVien}</td>
            <td>${hocvien.tenHocVien}</td>
            <td>${hocvien.gioiTinh}</td>
            <td>
                <c:choose>
                    <c:when test="${hocvien.diemSo >= 90}">Giỏi</c:when>
                    <c:when test="${hocvien.diemSo >= 80}">Khá</c:when>
                    <c:when test="${hocvien.diemSo >= 60}">Trung bình</c:when>
                    <c:when test="${hocvien.diemSo < 60}">Yếu</c:when>
                    <c:otherwise>
                        Danh sách rỗng
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
