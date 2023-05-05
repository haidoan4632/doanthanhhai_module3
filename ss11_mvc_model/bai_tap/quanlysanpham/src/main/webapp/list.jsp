<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 4/28/2023
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<html>
<head>
    <title>Hiển thị danh sách quản lý sản phẩm</title>
</head>
<body>
<th>
    <button onclick="window.location.href='/productManagament?action=create&id=${product.getId()}'" type="button"
            class="btn btn-danger">Create
    </button>
</th>
<table class="table table-striped">
    <thead>
    <tr>
        <th>ID</th>
        <th>NameProduct</th>
        <th>RateProduct</th>
        <th>ProductDescription</th>
        <th>Producer</th>
        <th>Delete</th>
        <th>Edit</th>

        <th></th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getNameProduct()}</td>
            <td>${product.getRateProduct()}</td>
            <td>${product.getProductDescription()}</td>
            <td>${product.getProducer()}</td>

            <th>
                <button onclick="window.location.href='/productManagament?action=delete&id=${product.getId()}'" type="button"
                        class="btn btn-danger">Delete
                </button>
            </th>
            <th>
                <button onclick="window.location.href='/productManagament?action=edit&id=${product.getId()}'" type="button"
                        class="btn btn-secondary">Edit
                </button>
            </th>
        </tr>

        </tr>
    </c:forEach>

    </tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
