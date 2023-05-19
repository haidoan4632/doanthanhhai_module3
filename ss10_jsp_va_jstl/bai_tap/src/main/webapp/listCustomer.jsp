<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 4/27/2023
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>

<a href="/customer">
    <button style="margin-left: 10px">Hiển thị danh sách khách hàng</button>
</a>
<div class="container" style="margin:0 auto; ">

    <table class="table table-striped" style="margin-left:10px ;width: 70%;border:solid deepskyblue">
        <tr>
            <th colspan="4" style="text-align: center;">Danh sách khách hàng</th>
        </tr>
        <tr>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>

        <c:forEach var="lisCustomer" items="${customerList}">
            <tr>
                <td>${lisCustomer.getName()} </td>
                <td>${lisCustomer.getDateOfBirth()} </td>
                <td>${lisCustomer.getAddress()} </td>
                <td>
                    <img src="${lisCustomer.getImage()}" alt="" width="100px">
                </td>
            </tr>
        </c:forEach>
    </table>

</div>
</body>
</html>
