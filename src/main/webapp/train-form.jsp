<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<jsp:include page="header.jsp"></jsp:include>
<section class="text-gray-600 body-font relative">
    <div class="absolute inset-0 bg-gray-300">
        <iframe style="filter: grayscale(1) contrast(1.2) opacity(0.4);" marginheight="0" marginwidth="0" title="map"
                scrolling="no"
                src="https://maps.google.com/maps?width=100%&amp;height=600&amp;hl=en&amp;q=%C4%B0zmir+(My%20Business%20Name)&amp;ie=UTF8&amp;t=&amp;z=14&amp;iwloc=B&amp;output=embed"
                width="100%" height="100%" frameborder="0"></iframe>
    </div>
    <div class="container px-5 py-24 mx-auto flex">
        <div class="lg:w-1/3 md:w-1/2 bg-white rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0 relative z-10 shadow-md">
            <c:if test="${train != null}">
            <form action="update" method="post">
                </c:if>
                <c:if test="${train == null}">
                <form action="insert" method="post">
                    </c:if>
                    <h2 class="text-gray-900 text-lg mb-1 font-medium title-font">
                        <c:if test="${train != null}">
                            Edit Train
                        </c:if>
                        <c:if test="${train == null}">
                            Add New Train
                        </c:if>
                    </h2>
                    <c:if test="${train != null}">
                        <input type="hidden" name="id" value="<c:out value='${train.train_id}' />"/>
                    </c:if>

                    <div class="relative mb-4">
                        <label class="leading-7 text-sm text-gray-600">Train Name</label> <input type="text"
                                                                                                 value="<c:out value='${train.trainname}' />"
                                                                                                 class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                                                                                                 name="trainname"
                                                                                                 required="required">
                    </div>

                    <div class="relative mb-4">
                        <label class="leading-7 text-sm text-gray-600">Train From</label> <input type="text"
                                                                                                 value="<c:out value='${train.from}' />"
                                                                                                 class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                                                                                                 name="from"
                                                                                                 required="required">
                    </div>

                    <div class="relative mb-4">
                        <label class="leading-7 text-sm text-gray-600">Train To</label> <input type="text"
                                                                                               value="<c:out value='${train.to}' />"
                                                                                               class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                                                                                               name="to">
                    </div>

                    <div class="relative mb-4">
                        <label class="leading-7 text-sm text-gray-600">Train Type</label> <input type="text"
                                                                                                 value="<c:out value='${train.type}' />"
                                                                                                 class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                                                                                                 name="type">
                    </div>

                    <button type="submit"
                            class="text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded text-lg">
                        Save
                    </button>
                </form>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</html>
