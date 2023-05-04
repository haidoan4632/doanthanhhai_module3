<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/4/2023
  Time: 11:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/user?action=edit&id=${user.id}">Edit</a>
                </td>
                <td>
                    <a href="/user?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <th>
        <button onclick="window.location.href='/user?action=create'" type="button"
                class="btn btn-danger">Create
        </button>
    </th>
    <form action="/user">
        <input type="text" name="country">
        <input type="hidden" name="action" value="search">
        <button type="submit">search</button>

    </form>
    <th>
        <button onclick="window.location.href='/user?action=sortName'" type="button"
                class="btn btn-danger">Sắp xếp theo tên
        </button>
    </th>

</div>
</body>
</html>
