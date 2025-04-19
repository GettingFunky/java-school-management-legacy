<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:set var="pageTitle" value="Επιτυχής Διαγραφή" />
<%@ include file="header3.jsp" %>

<main class="flex-grow container mx-auto px-4 py-12">
    <div class="max-w-xl mx-auto bg-white p-6 rounded-xl shadow-md border border-success-200">
        <div class="flex items-center mb-4">
            <i class="fas fa-check-circle text-success-500 text-3xl mr-3"></i>
            <h1 class="text-2xl font-bold text-gray-800">Επιτυχής Διαγραφή</h1>
        </div>
        <p class="text-gray-700 text-lg mb-4">Ο καθηγητής με κωδικό <strong>${requestScope.id}</strong> διαγράφηκε επιτυχώς.</p>

        <div class="flex justify-end">
            <a href="${pageContext.request.contextPath}/school-app/teachers/view"
               class="inline-flex items-center px-4 py-2 bg-primary-500 hover:bg-primary-600 text-white font-medium rounded-lg transition">
                <i class="fas fa-arrow-left mr-2"></i> Επιστροφή στην προβολή καθηγητών
            </a>
        </div>
    </div>
</main>

<%@ include file="footer2.jsp"%>
