<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Book Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">
        <div>
            <a href="https://sithum.online" class="navbar-brand"> Book
                Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list"
                   class="nav-link">Books</a></li>
        </ul>
    </nav>
</header>
<br>

<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">List of Books</h3>
        <hr>
        <div class="container text-left">

            <a href="<%=request.getContextPath()%>/book/new" class="btn btn-success">Add
                New Book</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Train</th>
                <th>Station</th>
                <th>Time</th>
            </tr>
            </thead>
            <tbody>
            <!--   for (Todo todo: todos) {  -->
            <c:forEach var="book" items="${listBook}">

                <tr>
                    <td><c:out value="${book.book_id}"/></td>
                    <td><c:out value="${book.username}"/></td>
                    <td><c:out value="${book.train}"/></td>
                    <td><c:out value="${book.station}"/></td>
                    <td><c:out value="${book.time}"/></td>
                    <td><a href="<%=request.getContextPath()%>/book/edit?id=<c:out value='${book.book_id}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; <a
                                href="<%=request.getContextPath()%>/book/delete?id=<c:out value='${book.book_id}' />">Delete</a></td>
                </tr>
            </c:forEach>
            <!-- } -->
            </tbody>

        </table>
    </div>
</div>
</body>
</html>
