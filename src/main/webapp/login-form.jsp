<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<jsp:include page="header.jsp"></jsp:include>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="login" method="post">

                <caption>
                    <h2>
                        Log In
                    </h2>
                </caption>

                <div class="relative mb-4">
                    <label class="leading-7 text-sm text-gray-600">User Name</label> <input type="text"
                                                    value="<c:out value='${user.username}' />" class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                                                    name="username" required="required">
                </div>

                <div class="relative mb-4">
                    <label class="leading-7 text-sm text-gray-600">User Password</label> <input type="password"
                                                        value="<c:out value='${user.password}' />"
                                                        class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                                                        name="password" required="required">
                </div>

                <button type="submit" class="text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded text-lg">Log In</button>
                <a href="<%=request.getContextPath()%>/user/new"
                   class="nav-link">
                    <button type="button" class="text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded text-lg">Create Account</button>
                </a>
            </form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</html>
