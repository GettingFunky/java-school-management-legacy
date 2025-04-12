<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="pageTitle" value="Προβολή Καθηγητή" />
<%@ include file="header3.jsp" %>

<main class="flex-grow container mx-auto px-4 py-8">
    <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 max-w-3xl mx-auto">
        <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">Προβολή Καθηγητή</h2>

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-gray-700 text-lg">
            <p><strong>ID:</strong> ${teacher.id}</p>
            <p><strong>Όνομα:</strong> ${teacher.firstname}</p>
            <p><strong>Επώνυμο:</strong> ${teacher.lastname}</p>
            <p><strong>ΑΦΜ:</strong> ${teacher.vat}</p>
            <p><strong>Email:</strong> ${teacher.email}</p>
            <p><strong>Πατρώνυμο:</strong> ${teacher.fatherName}</p>
        </div>

        <div class="mt-8 text-center">
            <a href="${pageContext.request.contextPath}/school-app/teachers/view"
               class="inline-flex items-center px-4 py-2 bg-primary-500 hover:bg-primary-600 text-white font-medium rounded-lg transition-colors duration-200 shadow-sm">
                <i class="fas fa-arrow-left mr-2"></i>
                Επιστροφή στη Λίστα
            </a>
        </div>
    </div>
</main>

<%@ include file="footer2.jsp" %>