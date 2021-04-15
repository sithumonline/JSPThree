<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<jsp:include page="header.jsp"></jsp:include>
<section class="text-gray-600 body-font">
    <div class="container px-5 py-24 mx-auto">
        <div class="flex flex-col text-center w-full mb-20">
            <h1 class="sm:text-4xl text-3xl font-medium title-font mb-2 text-gray-900">List of Books</h1>
        </div>
        <div class="lg:w-2/3 w-full mx-auto overflow-auto">
            <table class="table-auto w-full text-left whitespace-no-wrap">
                <thead>
                <tr>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">
                        ID
                    </th>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">
                        Username
                    </th>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">
                        Train
                    </th>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">
                        Station
                    </th>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">
                        Time
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${listBook}">
                    <tr>
                        <td class="border-t-2 border-gray-200 px-4 py-3"><c:out value="${book.book_id}"/></td>
                        <td class="border-t-2 border-gray-200 px-4 py-3"><c:out value="${book.username}"/></td>
                        <td class="border-t-2 border-gray-200 px-4 py-3"><c:out value="${book.train}"/></td>
                        <td class="border-t-2 border-gray-200 px-4 py-3"><c:out value="${book.station}"/></td>
                        <td class="border-t-2 border-gray-200 px-4 py-3"><c:out value="${book.time}"/></td>
                        <td class="border-t-2 border-gray-200 px-4 py-3"><a
                                href="<%=request.getContextPath()%>/book/edit?id=<c:out value='${book.book_id}' />">Edit</a>
                            &nbsp;&nbsp;&nbsp;&nbsp; <a
                                    href="<%=request.getContextPath()%>/book/delete?id=<c:out value='${book.book_id}' />">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="flex pl-4 mt-4 lg:w-2/3 w-full mx-auto">
            <a href="<%=request.getContextPath()%>/book/new"
               class="flex ml-auto text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded">Add
                New Book</a>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</html>
