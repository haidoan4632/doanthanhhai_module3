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
<form action="/bookManagement?action=edit" method="post">
    <table>
        <thead>
        <tr>
            <th><label for="a">ID</label></th>
            <th><input pattern="" id="a" name="id" value="${book.id}" type="number"></th>
        </tr>

        <tr>
            <th><label for="b">Title</label></th>
            <th><input id="b" name="title" value="${book.title}" type="text"></th>
        </tr>

        <tr>
            <th><label for="c">PageSize</label></th>
            <th><input id="c" name="pageSize" value="${book.pageSize}" type="number"></th>
        </tr>


        <tr>
            <th><label for="x">Author</label></th>
            <th><input hidden id="x" name="author" type="text"></th>
        </tr>
        <tr>
            <th><label for="y">ID Author</label></th>
            <th><input id="y" name="idAuthor" value="${book.author.authorId}" type="number"></th>
        </tr>

        <tr>
            <th><label for="z">Category</label></th>
            <th><input id="z" hidden name="category" type="text"></th>
        </tr>

        <tr>
            <th><label for="m">ID Category</label></th>
            <th><input id="m" name="idCategory" value="${book.category.idCategory}" type="number"></th>
        </tr>
        <tr>
            <th colspan="2">
                <button type="submit" style="float: right">Sửa thông tin sách</button>
            </th>
        </tr>
        </thead>
    </table>
</form>
</body>
</html>
