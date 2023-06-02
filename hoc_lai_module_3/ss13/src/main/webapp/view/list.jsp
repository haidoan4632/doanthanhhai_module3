<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 6/1/2023
  Time: 10:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94Wr HftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container" style="font-size: x-large;margin-left: 40rem">
    <form action="" method="post">
        <h1>Create Book</h1>
        <%--    <div class="form-group">--%>
        <%--      <label for="id">ID Book</label>--%>
        <%--      <input type="text"--%>
        <%--             class="form-control" name="idBook" id="id" aria-describedby="helpId" placeholder="Input id book">--%>
        <%--    </div>--%>

        <div class="form-group">
            <label for="title">Title</label>
            <input type="text"
                   class="form-control" name="titleBook" id="title" aria-describedby="helpId"
                   placeholder="Input title book">
        </div>
        <div class="form-group">
            <label for="pageSize">Page size</label>
            <input type="text"
                   class="form-control" name="pageSize" id="pageSize" aria-describedby="helpId"
                   placeholder="Input page size book">
        </div>
        <div class="form-group">
            <label for="authorID" id="authorID">Author</label>
            <select class="form-select" name="authorID">
                <c:forEach var="author" items="${authorList}">
                    <option value="${author.authorId}">${author.authorName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="categoryID" id="categoryID">Category</label>
            <select class="form-select" name="categoryID">
                <c:forEach var="category" items="${categoryList}">
                    <option value="${category.idCategory}">${category.nameCategory}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <button type="submit" class="btn btn-success" role="button">Create</button>
            <button class="btn btn-warning">Cancel</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
