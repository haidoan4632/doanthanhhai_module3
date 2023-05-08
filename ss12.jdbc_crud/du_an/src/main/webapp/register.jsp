<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/7/2023
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="../bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
<html>
<head>
    <title>Đăng ký</title>
</head>
<body>
<h4 class="text-primary text-center display-2">Register</h4>
<form method="post" class="container-md" action="/user?action=register">
    <div class="mb-3">
        <label for="exampleInputName" class="form-label"></label>
        <input type="text" class="form-control" id="exampleInputName" name="name" placeholder="Your Full Name"
               autocomplete="off" minlength="3" maxlength="50" required>
        <i class="input-icon uil uil-at"></i>
    </div>
    <div class="mb-3">
        <label for="exampleInputName1" class="form-label"></label>
        <input type="email" class="form-control" id="exampleInputName1" name="email" placeholder="Your Email"
               autocomplete="off" max="50" required>
        <i class="input-icon uil uil-at"></i>
    </div>
    <div class="mb-3">
        <label for="exampleInputName3" class="form-label"></label>
        <input type="text" class="form-control" id="exampleInputName3" type="password" name="password"
               placeholder="Your Password" autocomplete="off" minlength="6" maxlength="50" required>
        <i class="input-icon uil uil-at"></i>
    </div>
    <div class="mb-3">
        <label for="exampleInputName4" class="form-label"></label>
        <input class="form-control" id="exampleInputName4" type="phoneNumber" name="phoneNumber"
               placeholder="Your phone number" autocomplete="off" minlength="10" maxlength="12" required>
        <i class="input-icon uil uil-at"></i>
    </div>

    <div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <p class="text-center text-danger display-4">${registerFail} </p>
    </div>

</form>
</div>
</body>
</html>
