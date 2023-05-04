<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/3/2023
  Time: 11:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button type="button" class="btn btn-primary">
    <a class="btn btn-primary" href="/user?action=create">CREATE</a>
</button>
<form action="/user">
    <div class="btn btn-primary">
        <label for="name">Id</label>
        <input type="hidden" name="action" value="findName">
        <input type="text" class="form-control" name="name" id="name">
    </div>
    <button type="submit" class="btn btn-primary">Search</button>
</form>
<table class="table">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${userList}" >
        <tr>
            <td>${user.getId()}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td>
                <button><a class="btn btn-primary" href="/user?action=delete&id=${user.getId()}">DELETE</a></button>
            </td>
            <td>
                <button><a class="btn btn-primary" href="/user?action=edit&id=${user.getId()}">EDIT</a></button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
