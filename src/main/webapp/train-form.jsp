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
            <a href="https://sithum.online" class="navbar-brand"> Train Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/train/list"
                   class="nav-link">Trains</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <c:if test="${train != null}">
            <form action="update" method="post">
                </c:if>
                <c:if test="${train == null}">
                <form action="insert" method="post">
                    </c:if>

                    <caption>
                        <h2>
                            <c:if test="${train != null}">
                                Edit Train
                            </c:if>
                            <c:if test="${train == null}">
                                Add New Train
                            </c:if>
                        </h2>
                    </caption>

                    <c:if test="${train != null}">
                        <input type="hidden" name="id" value="<c:out value='${train.train_id}' />"/>
                    </c:if>

                    <fieldset class="form-group">
                        <label>Train Name</label> <input type="text"
                                                        value="<c:out value='${train.trainname}' />" class="form-control"
                                                        name="trainname" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Train From</label> <input type="text"
                                                            value="<c:out value='${train.from}' />"
                                                            class="form-control"
                                                            name="from" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Train To</label> <input type="text"
                                                             value="<c:out value='${train.to}' />"
                                                             class="form-control"
                                                             name="to">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Train Type</label> <input type="text"
                                                         value="<c:out value='${train.type}' />" class="form-control"
                                                         name="type">
                    </fieldset>

                    <button type="submit" class="btn btn-success">Save</button>
                </form>
        </div>
    </div>
</div>
</body>
</html>
