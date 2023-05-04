<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/3/2023
  Time: 11:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <div class="form-group">
        <label for="id">Id</label>
        <input type="number"
               class="form-control" name="id" id="id">
    </div>
    <div class="form-group">
        <label for="name">Name</label>
        <input type="text"
               class="form-control" name="name" id="name">
    </div>
    <div class="form-group">
        <label for="email">Email</label>
        <input type="text"
               class="form-control" name="email" id="email">
    </div>
    <div class="form-group">
        <label for="country">Country</label>
        <input type="text"
               class="form-control" name="country" id="country">
    </div>
    <button type="submit" value="create">Save</button>
</form>
</body>
</html>
