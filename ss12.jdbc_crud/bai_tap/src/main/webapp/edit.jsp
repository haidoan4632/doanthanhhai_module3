<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/4/2023
  Time: 9:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
<head>
    <title>Edit</title>
</head>
<body>
<form action="/user?action=edit" method="post">
    <form method="post">
        id :<input type="hidden" name="id" id="id" value="${user.getId()}">
        name :<input type="text" name="name" id="name" value="${user.getName()}">
        email :<input type="text" name="email" id="email" value="${user.getEmail()}">
        country :<input type="text" name="country" id="country" value="${user.getCountry()}">
        <button type="submit">update</button>
    </form>
</form>
</body>
</html>
