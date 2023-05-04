<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/4/2023
  Time: 4:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<form action="/user?action=delete"method="post">
    <input name="id" value="${id}">
    <button class="btn btn-success" type="submit"></button>
</form>
</body>
</html>
