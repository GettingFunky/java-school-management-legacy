<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:set var="pageTitle" value="Διαχείριση και προβολή Καθηγητών/Μαθητών" />
<%@ include file="header3.jsp" %>

<main class="flex-grow container mx-auto px-4 py-8">
    <div class="mb-8">
        <h1 class="text-2xl font-bold text-gray-800 mb-2">${pageTitle}</h1>
    </div>

    <!-- Dashboard Grid -->
    <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
        <!-- Καθηγητές -->
        <c:if test="${sessionScope.role == 'ADMIN'}">
            <a href="${pageContext.request.contextPath}/school-app/teachers/view"
               class="flex items-center justify-center w-full h-28 bg-primary-500 hover:bg-primary-600 text-white font-semibold rounded-xl shadow transition">
                <i class="fa-solid fa-chalkboard-teacher mr-2 text-2xl"></i> Καθηγητές
            </a>
        </c:if>

        <!-- Μαθητές -->
        <a href="${pageContext.request.contextPath}/school-app/dashboard"
           class="flex items-center justify-center w-full h-28 bg-yellow-500 hover:bg-yellow-600 text-white font-semibold rounded-xl shadow transition">
            <i class="fa-solid fa-user-graduate mr-2 text-2xl"></i> Μαθητές
        </a>
    </div>
</main>

<%@ include file="footer2.jsp"%>
