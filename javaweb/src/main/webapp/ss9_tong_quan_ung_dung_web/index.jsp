<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 4/26/2023
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/result" method="get">
    <label>Product Description <input name="Product Description" type="text" placeholder="Mô tả sản phẩm"/></label>
    <br>
    <input name="List Price" placeholder="Giá niêm yết của sản phẩm">
    <input name="Discount Percent" placeholder="Tỷ lệ chiết khấu(phần trăm)">
    <button type="submit">Calculate Discount</button>
</form>
</body>
</html>
