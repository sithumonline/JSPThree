<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Train Management Application</title>
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
            <a href="https://sithum.online" class="navbar-brand"> Train
                Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list"
                   class="nav-link">Trains</a></li>
        </ul>
    </nav>
</header>
<br>

<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">List of Trains</h3>
        <hr>
        <div class="container text-left">

            <a href="<%=request.getContextPath()%>/train/new" class="btn btn-success">Add
                New Train</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>From</th>
                <th>To</th>
                <th>Type</th>
            </tr>
            </thead>
            <tbody>
            <!--   for (Todo todo: todos) {  -->
            <c:forEach var="train" items="${listTrain}">

                <tr>
                    <td><c:out value="${train.train_id}"/></td>
                    <td><c:out value="${train.trainname}"/></td>
                    <td><c:out value="${train.from}"/></td>
                    <td><c:out value="${train.to}"/></td>
                    <td><c:out value="${train.type}"/></td>
                    <td><a href="<%=request.getContextPath()%>/train/edit?id=<c:out value='${train.train_id}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; <a
                                href="<%=request.getContextPath()%>/train/delete?id=<c:out value='${train.train_id}' />">Delete</a></td>
                </tr>
            </c:forEach>
            <!-- } -->
            </tbody>

        </table>
    </div>
</div>
</body>
</html>
