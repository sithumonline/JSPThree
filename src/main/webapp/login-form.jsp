<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
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
            <a href="https://sithum.online" class="navbar-brand"> User Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/user/list"
                   class="nav-link">Users</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="login" method="post">

                <caption>
                    <h2>
                        Log In
                    </h2>
                </caption>

                <fieldset class="form-group">
                    <label>User Name</label> <input type="text"
                                                    value="<c:out value='${user.username}' />" class="form-control"
                                                    name="username" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>User Password</label> <input type="password"
                                                        value="<c:out value='${user.password}' />"
                                                        class="form-control"
                                                        name="password" required="required">
                </fieldset>

                <button type="submit" class="btn btn-success">Log In</button>
                <a href="<%=request.getContextPath()%>/user/new"
                   class="nav-link">
                    <button type="button" class="btn btn-success">Create Account</button>
                </a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
