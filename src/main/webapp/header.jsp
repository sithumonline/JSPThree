<%--
  Created by IntelliJ IDEA.
  User: sithumonline
  Date: 4/15/21
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>Nexterbook</title>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<link rel="shortcut icon" type="image/jpg" href="<%=request.getContextPath()%>/nexter-logo.svg"/>
<header class="text-gray-600 body-font">
    <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
        <a class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0"
           href="<%=request.getContextPath()%>/">
            <img src="<%=request.getContextPath()%>/nexter-logo.svg" class="w-10 h-10 text-white p-2 bg-indigo-500 rounded-full"/>
            <span class="ml-3 text-xl">Nexterbook</span>
        </a>
        <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center">
            <a class="mr-5 hover:text-gray-900" href="<%=request.getContextPath()%>/train/">Train</a>
            <a class="mr-5 hover:text-gray-900" href="<%=request.getContextPath()%>/station/">Station</a>
            <a class="mr-5 hover:text-gray-900" href="<%=request.getContextPath()%>/book/">Book</a>
            <a class="mr-5 hover:text-gray-900" href="<%=request.getContextPath()%>/user/">User</a>
        </nav>
        <a class="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0"
           href="<%=request.getContextPath()%>/xyz/">Log In
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                 class="w-4 h-4 ml-1" viewBox="0 0 24 24">
                <path d="M5 12h14M12 5l7 7-7 7"></path>
            </svg>
        </a>
    </div>
</header>
</html>
