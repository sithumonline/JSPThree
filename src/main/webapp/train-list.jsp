<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<jsp:include page="header.jsp"></jsp:include>
<section class="text-gray-600 body-font">
    <div class="container px-5 py-24 mx-auto">
        <div class="flex flex-col text-center w-full mb-20">
            <h1 class="sm:text-4xl text-3xl font-medium title-font mb-2 text-gray-900">List of Trains</h1>
        </div>
        <div class="lg:w-2/3 w-full mx-auto overflow-auto">
            <table class="table-auto w-full text-left whitespace-no-wrap">
                <thead>
                <tr>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">
                        ID
                    </th>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">
                        Name
                    </th>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">
                        From
                    </th>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">
                        To
                    </th>
                    <th class="px-4 py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">
                        Type
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="train" items="${listTrain}">
                    <tr>
                        <td class="border-t-2 border-gray-200 px-4 py-3"><c:out value="${train.train_id}"/></td>
                        <td class="border-t-2 border-gray-200 px-4 py-3"><c:out value="${train.trainname}"/></td>
                        <td class="border-t-2 border-gray-200 px-4 py-3"><c:out value="${train.from}"/></td>
                        <td class="border-t-2 border-gray-200 px-4 py-3"><c:out value="${train.to}"/></td>
                        <td class="border-t-2 border-gray-200 px-4 py-3"><c:out value="${train.type}"/></td>
                        <td class="border-t-2 border-gray-200 px-4 py-3"><a
                                href="<%=request.getContextPath()%>/train/edit?id=<c:out value='${train.train_id}' />">Edit</a>
                            &nbsp;&nbsp;&nbsp;&nbsp; <a
                                    href="<%=request.getContextPath()%>/train/delete?id=<c:out value='${train.train_id}' />">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="flex pl-4 mt-4 lg:w-2/3 w-full mx-auto">
            <a href="<%=request.getContextPath()%>/train/new"
               class="flex ml-auto text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded">Add
                New Train</a>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</html>
