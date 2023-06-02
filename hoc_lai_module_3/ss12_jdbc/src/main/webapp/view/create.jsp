<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 6/1/2023
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/bookManagement?action=create" method="post">
    <table>
        <thead>
        <tr>
            <th><label for="a">ID</label></th>
            <th><input pattern="" id="a" name="id" placeholder="input id" type="number"></th>
        </tr>

        <tr>
            <th><label for="b">Title</label></th>
            <th><input id="b" name="title" placeholder="input name" type="text"></th>
        </tr>

        <tr>
            <th><label for="c">PageSize</label></th>
            <th><input id="c" name="pageSize" placeholder="input pageSize" type="number"></th>
        </tr>
        <tr>
            <th><label for="y">Category</label></th>
            <th><input id="y" name="category" placeholder="input category" type="text"></th>
        </tr>
        <tr>
            <th colspan="2"> <button type="submit" style="float: right">Thêm sách</button></th>
        </tr>
        </thead>
    </table>
</form>
</body>
</html>
