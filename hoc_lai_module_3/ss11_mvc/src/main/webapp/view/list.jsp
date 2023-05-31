<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/24/2023
  Time: 8:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<html>
<head>
    <title>Hiển thị</title>
</head>
<body>
<h3 class="text-center"><a href="/bookManagement">Danh sách sách</a></h3>
<p class="text-center my-3"><a href="/bookManagement?action=create">
    <button class="btn btn-info btn-sm">+ Thêm sản phẩm mới</button>
</a>
</p>

<form action="/bookManagement?action=searchByTitle" method="post">
    <input type="text" name="titleSearch" placeholder="Nhập tên sách">
    <button type="submit">Tim kiếm</button>
</form>
<div class="container">
    <table class="table table-striped ms-5" border="1">
        <tr>
            <th>ID</th>
            <th>Tiêu đề sách</th>
            <th>Số trang</th>
            <th>Tác giả</th>
            <th>Loại sách</th>
            <th colspan="2">action</th>
        </tr>
        <c:forEach var="book" items="${bookList}">
            <tr>
                <td>${book.id}</td>
                <td>${book.title}</td>
                <td>${book.pageSize}</td>
                <td>${book.author}</td>
                <td>${book.category}</td>
                <td>
                    <a href="/bookManagement?action=update&id=${book.id}">Update</a>
                </td>
                <td>
                    <button type="button" class="btn btn-danger btn-lg" data-toggle="modal"
                            data-target="#modelId${book.id}">
                        Xóa
                    </button>
                </td>

            </tr>
            <form action="/bookManagement?action=delete" method="post">
            <!-- Modal -->
            <div class="modal fade" id="modelId${book.id}" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="${book.id}">

                        <div class="modal-body">
                            bạn có muốn xóa quyển sách có tên là ${book.title} không?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-danger">Xóa</button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </c:forEach>
    </table>
</div>

</body>
</html>




