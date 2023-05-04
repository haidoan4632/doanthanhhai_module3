<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 4/28/2023
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<form action="/productManagament?action=create" method="post">
    <label>ID</label>
    <input class="form-control" name="id"><br>
    <label>NameProduct</label>
    <input class="form-control" name="nameProduct"><br>
    <label>RateProduct</label>
    <input class= "form-control" name="rateProduct"><br>
    <label>ProductDescription</label>
    <input class="form-control" name="productDescription"><br>
    <label>Producer</label>
    <input class="form-control" name="producer"><br>
    <button class="btn btn-success" type="submit">Create</button>

</form>
</body>
</html>
