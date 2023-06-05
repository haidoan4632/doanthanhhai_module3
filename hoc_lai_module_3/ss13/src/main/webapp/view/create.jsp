<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 6/1/2023
  Time: 10:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94Wr HftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
            <th><label for="x">Author</label></th>
            <th><input hidden id="x" name="author" placeholder="input author" type="text"></th>
        </tr>
        <tr>
            <th><label for="y">ID Author</label></th>
            <th><input id="y" name="idAuthor" placeholder="input id author" type="number"></th>
        </tr>

        <tr>
            <th><label for="z">Category</label></th>
            <th><input id="z" hidden name="category" placeholder="input category" type="text"></th>
        </tr>

        <tr>
            <th><label for="m">ID Category</label></th>
            <th><input id="m" name="idCategory" placeholder="input id category" type="number"></th>
        </tr>
        <tr>
            <th colspan="2">
                <button type="submit" style="float: right">Thêm sách</button>
            </th>
        </tr>
        </thead>
    </table>
</form>
</body>
</html>
