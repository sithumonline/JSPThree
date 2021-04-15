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
            <form action="login" method="post">
                <h2 class="text-gray-900 text-lg mb-1 font-medium title-font">
                    Log In
                </h2>
                <div class="relative mb-4">
                    <label class="leading-7 text-sm text-gray-600">User Name</label> <input type="text"
                                                                                            value="<c:out value='${user.username}' />"
                                                                                            class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                                                                                            name="username"
                                                                                            required="required">
                </div>

                <div class="relative mb-4">
                    <label class="leading-7 text-sm text-gray-600">User Password</label> <input type="password"
                                                                                                value="<c:out value='${user.password}' />"
                                                                                                class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
                                                                                                name="password"
                                                                                                required="required">
                </div>

                <button type="submit"
                        class="text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded text-lg">
                    Log In
                </button>
                <a href="<%=request.getContextPath()%>/user/new"
                   class="self-center text-indigo-500 bg-white border-0 py-2 px-8 focus:outline-none rounded text-lg">
                    Create Account
                </a>
            </form>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</html>
