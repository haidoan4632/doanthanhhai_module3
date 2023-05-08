<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/4/2023
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <form action="/user?action=create" method="post">
        <div  class="form-group">
        <label>Name</label>
        <input class="form-control" name="name"><br>
        <label>Email</label>
        <input class= "form-control" name="email"><br>
        <label>Country</label>
        <input class="form-control" name="country"><br>
        <button class="btn btn-success" type="submit">Create</button>
        </div>
    </form>
</body>
</html>
