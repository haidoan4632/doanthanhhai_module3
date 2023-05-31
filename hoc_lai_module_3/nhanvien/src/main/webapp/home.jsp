<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/29/2023
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css" />

    <style>
        * {
            margin: 0px;
            box-sizing: border-box;
            font-family: "Times New Roman";
            /*font-size: 1.2rem;*/
        }

        .my-button {
            padding: 10px 20px;
            border-radius: 5px;
            color: black;
            font-weight: bold;
            font-size: 1rem;
            padding: 0px;
        }

        .my-button:hover {
            background-color: #4CAF50;
            cursor: pointer;
            font-size: 1rem;

        }

        .font-size {
            font-size: 0.9rem;
        }

        .li-group1 {
            font-size: 0.9rem;
            padding: 0px;
        }

        .footer {
            position: sticky;
            top: 0px;
            background-color: gray;
            color: white;
            text-align: center;
        }

    </style>
</head>
<body style="margin: 0px; height: 100%;background-color: white">
<div>
    <div class="container-fluid" style="width: 95%">
        <nav class="row navbar navbar-expand-lg" style="background-color: #2d6a99;padding: 0px">
            <div class="container-fluid">
                <a id="ig1-user-page" href="#" class="navbar-brand"><img style="width: 2rem; height: 2rem"
                                                                         src="https://lh3.googleusercontent.com/alu-Ei5qhJQm7rh2HywlBthL0Rf3r6GPoiU5HP6X72YkZqAoNqsYzlyn27oyppK5qGQWX5oZmSlR3_zHhcwL2XXEeE_yADyuZIbHwqUY0A"></a>
                <div class="collapse navbar-collapse col-12" id="navbarSupportedContent">
                    <a style="color: white">Home</a>
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0;">
                        <div class="col-10" style="display:flex; width: 100%">
                            <li clx ass="nav-item">
                            <li clx ass="nav-item">
                                <a class="nav-link active font-size" aria-current="page" style="color:white" href="/">Quản
                                    lý nhân viên</a>
                            </li>
                            <li clx ass="nav-item">
                                <a class="nav-link active font-size" aria-current="page" style="color:white" href="/">Quản
                                    lý khách hàng</a>
                            </li>
                            <li clx ass="nav-item">
                                <a class="nav-link active font-size" aria-current="page" style="color:white" href="/">Quản
                                    lý đơn hàng</a>
                            </li>
                        </div>
                    </ul>
                    <div class="col-2">
                        <a class="nav-link active font-size" aria-current="page" style="color:white" href="/">
                            <i class="fa-solid fa-user"></i> Đăng xuất</a>
                    </div>


                </div>
            </div>
        </nav>
    </div>
    <div class="container-fluid " style="width: 95%">
        <div class="row">
            <div class="col-sm-12 col-md-4 col-lg-3 container-fluid" style="margin-top: 6rem">
                <div style="width: 90%;height: 28rem ;margin-top: 0.5rem;margin-bottom:0.5rem; border: 2px solid;border-image-slice: 1;border-image-source: linear-gradient(to right bottom,#6a5af9, #f62682)">
                    <div class="card">
                        <img src="https://images2.thanhnien.vn/Uploaded/nhutnq/2022_10_02/220928180903-03-dall-e-ai-2189.jpg"
                             class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title" style="text-align: center;font-weight: bold ">Thông tin chi tiết</h5>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item li-group1">Mã nhân viên:</li>
                            <li class="list-group-item li-group1">Tên nhân viên:</li>
                            <li class="list-group-item li-group1">Giới tính:</li>
                            <li class="list-group-item li-group1">VỊ trí:</li>
                            <li class="list-group-item li-group1">Điện thoại:</li>
                            <li class="list-group-item li-group1">Email:</li>
                            <li class="list-group-item li-group1">Ngày sinh:</li>
                            <li class="list-group-item li-group1">Lương:</li>
                        </ul>
                    </div>
                </div>

            </div>
            <div class="col-sm-12 col-md-8 col-lg-9 container-fluid">
                <div class="row" style="position: relative">
                    <h3 style="text-align: center; margin-top:1rem; font-weight: bold; color: black; margin-bottom: 3rem">Bảng quản lý nhân
                        viên</h3>

                    <div style="width: 100%; margin-bottom: 1.5rem">
                        <div style="float: left">
                            <button class="my-button" style="display: inline; margin-bottom: 1rem"><a
                                    style="text-decoration: none"
                                    href=""><i class="fa-sharp fa-regular fa-plus"></i>Thêm mới nhân viên </a></button>
                        </div>
                        <div style="float: right">
                            <form class=" d-flex m-0" role="search" action="/" method="post"
                                  style="height: 5vh">
                                <input style="width: 10rem" class="form-control me-2" type="search"
                                       placeholder="Nhập tên nhân viên"
                                       aria-label="Search"
                                       name="name" id="searchInput" oninput="saveSearchInput()">
                                <input style="width: 10rem" class="form-control me-2" type="number"
                                       placeholder="Nhập số điện thoại"
                                       aria-label="Search"
                                       name="name" id="searchInput1" oninput="saveSearchInput()">
                                <button type="submit" class="btn btn-outline-primary"
                                        style="background: white; width: 7rem;height: auto; color: black">
                                    <i class="fa-solid fa-magnifying-glass"></i> Tìm kiếm
                                </button>
                            </form>
                        </div>
                    </div>


                    <table id="tableStudent" class="table table-success table-striped"
                           style="width: 99%;border: 1px solid; font-size: 1.2rem; ">
                        <thead>
                        <tr>
                            <th>Mã nhân viên</th>
                            <th>Tên nhân viên</th>
                            <th>Email</th>
                            <th>Mã Tài khoản</th>
                            <th>Xóa</th>
                            <th>Sửa</th>
                            <th>Chi tiết</th>
                        </tr>
                        </thead>
                        <c:forEach items="${danhSachNhanVien}" var="list">
                            <tbody>
                            <tr>
                                <td>${list.getMaNhanVien()}</td>
                                <td>${list.getTenNhanVien()}</td>
                                <td>${list.getEmail()}</td>
                                <td>${list.getMaTaiKhoan()}</td>
                                <th><i class="fa-sharp fa-solid fa-trash"></i></th>
                                <th><i class="fa-sharp fa-solid fa-wrench"></i></th>
                                <th style="text-align: center"><i class="fa-solid fa-circle-info"></i></th>
                            </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer container-fluid " style="width: 95%;margin-top: 8rem">
        <div class="container-fluid">
            <a href="https://fptshop.com.vn/" class="text-white">© 2021. Công ty đa cấp bán máy tính</a>
        </div>
    </footer>
</div>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTalebs.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableStudent').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 7
        } );
    } );
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>
