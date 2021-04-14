<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Station Management Application</title>
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
            <a href="https://sithum.online" class="navbar-brand"> Station Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/station/list"
                   class="nav-link">Stations</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <c:if test="${station != null}">
            <form action="update" method="post">
                </c:if>
                <c:if test="${station == null}">
                <form action="insert" method="post">
                    </c:if>

                    <caption>
                        <h2>
                            <c:if test="${station != null}">
                                Edit Station
                            </c:if>
                            <c:if test="${station == null}">
                                Add New Station
                            </c:if>
                        </h2>
                    </caption>

                    <c:if test="${station != null}">
                        <input type="hidden" name="id" value="<c:out value='${station.station_id}' />"/>
                    </c:if>

                    <fieldset class="form-group">
                        <label>Station Name</label> <input type="text"
                                                        value="<c:out value='${station.stationname}' />" class="form-control"
                                                        name="stationname" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Station Abb</label> <input type="text"
                                                            value="<c:out value='${station.aaa}' />"
                                                            class="form-control"
                                                            name="aaa" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Station Bbb</label> <input type="text"
                                                             value="<c:out value='${station.bbb}' />"
                                                             class="form-control"
                                                             name="bbb">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Station Ccc</label> <input type="text"
                                                         value="<c:out value='${station.ccc}' />" class="form-control"
                                                         name="ccc">
                    </fieldset>

                    <button type="submit" class="btn btn-success">Save</button>
                </form>
        </div>
    </div>
</div>
</body>
</html>
