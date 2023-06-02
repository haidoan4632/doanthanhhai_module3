<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 6/1/2023
  Time: 10:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<form action="/bookManagement?action=update" method="post">
    <table>
        <thead>
        <tr>
            <th><input hidden name="id" value="${id}"></th>
        </tr>

        <tr>
            <th><label for="b">Title</label></th>
            <th><input id="b" name="title" placeholder="input name" type="text"></th>
        </tr>

        <tr>
            <th><label for="c">PageSize</label></th>
            <th><input id="c" name="pageSize" placeholder="input pageSize" type="number"></th>
        </tr>
        <th><label for="x">Author</label></th>
        <th><input id="x" name="author" placeholder="input author" type="text"></th>

        <tr>
            <th><label for="y">Category</label></th>
            <th><input id="y" name="category" placeholder="input category" type="text"></th>
        </tr>
        <tr>
            <th colspan="2">
                <button type="submit" style="float: right">Chỉnh sửa sách</button>
            </th>
        </tr>
        </thead>
    </table>
</form>

</body>
</html>
