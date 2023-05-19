<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/16/2023
  Time: 8:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
</head>
<body>
<table class="table">
    <thead style="color: blueviolet">
    <tr>
        <th>Mã số phiếu phạt</th>
        <th>Tên tài khoản bị phạt</th>
        <th>Mã số đăng ký</th>
        <th>Lỗi vi phạm</th>
        <th>Ngày giờ vi phạm</th>
        <th>Số tiền đóng phạt</th>
        <th>Ghi chú</th>
        <th>Xóa</th>
    </tr>
    </thead>
    <c:forEach items="${xuPhatList}" var="xuPhat">
    <tbody>
    <tr>
        <td>${xuPhat.maSoPhieuPhat}</td>
        <td>${xuPhat.tenTaiKhoanBiPhat}</td>
        <td>${xuPhat.maSoDangKy}</td>
        <td>${xuPhat.loiViPham}</td>
        <td>${xuPhat.ngayGioViPham}</td>
        <td>${xuPhat.soTienDongPhat}</td>
        <td>${xuPhat.ghiChu}</td>
        <td>
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
                    data-target="#modelId${xuPhat.maSoPhieuPhat}">
                Đóng phạt
            </button>
        </td>
    </tr>
    <form action="/xuphat" method="get">
        <div class="modal fade" id="modelId${xuPhat.maSoPhieuPhat}" tabindex="-1" role="dialog"
             aria-labelledby="modelTitleId" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${xuPhat.maSoPhieuPhat}">
                    <div class="modal-body">
                        bạn có muốn đóng phạt cho${xuPhat.tenTaiKhoanBiPhat} không?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Xóa</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    </c:forEach>
    </tbody>
    </tr>

</table>
</body>
</html>

