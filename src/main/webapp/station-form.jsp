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
            <c:if test="${user != null}">
            <form action="update" method="post">
                </c:if>
                <c:if test="${user == null}">
                <form action="insert" method="post">
                    </c:if>
                    <h2 class="text-gray-900 text-lg mb-1 font-medium title-font">
                        <c:if test="${station != null}">
                            Edit Station
                        </c:if>
                        <c:if test="${station == null}">
                            Add New Station
                        </c:if>
                    </h2>
                    <c:if test="${station != null}">
                        <input type="hidden" name="id" value="<c:out value='${station.station_id}' />"/>
                    </c:if>

                    <div class="relative mb-4">
                        <label class="leading-7 text-sm text-gray-600">Station Name</label> <input type="text"
                                                                                                   value="<c:out value='${station.stationname}' />"
                                                                                                   class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                                                                                                   name="stationname"
                                                                                                   required="required">
                    </div>

                    <div class="relative mb-4">
                        <label class="leading-7 text-sm text-gray-600">Station Abb</label> <input type="text"
                                                                                                  value="<c:out value='${station.aaa}' />"
                                                                                                  class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                                                                                                  name="aaa"
                                                                                                  required="required">
                    </div>

                    <div class="relative mb-4">
                        <label class="leading-7 text-sm text-gray-600">Station Bbb</label> <input type="text"
                                                                                                  value="<c:out value='${station.bbb}' />"
                                                                                                  class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                                                                                                  name="bbb">
                    </div>

                    <div class="relative mb-4">
                        <label class="leading-7 text-sm text-gray-600">Station Ccc</label> <input type="text"
                                                                                                  value="<c:out value='${station.ccc}' />"
                                                                                                  class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                                                                                                  name="ccc">
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
