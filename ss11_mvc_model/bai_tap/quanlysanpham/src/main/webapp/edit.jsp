<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 4/28/2023
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/productManagament?action=edit" method="post">
    id :<input type="text" name="id"  value="${product.getId()}">
    nameProduct :<input type="text" name="nameProduct"  value="${product.getNameProduct()}">
    RateProduct :<input type="hidden" name="RateProduct" value="${product.getRateProduct()}">
    ProductDescription :<input type="text" name="ProductDescription"  value="${product.getProductDescription()}">
    Producer :<input type="text" name="Producer" id="Producer" value="${product.getProducer()}">
    <button class="btn btn-success" type="submit">Edit</button>
</form>
</form>
</body>
</html>
