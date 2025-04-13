<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="pageTitle" value="Προβολή Καθηγητή" />
<%@ include file="header3.jsp" %>

<main class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <h1 class="text-2xl font-bold text-gray-800 mb-6">Προβολή Καθηγητή</h1>

        <c:if test="${not empty requestScope.errorMessage or not empty sessionScope.errorMessage}">
            <div class="mb-6 p-4 bg-red-50 border-l-4 border-red-500 text-red-700 rounded">
                <p>${fn:escapeXml(not empty requestScope.errorMessage ? requestScope.errorMessage : sessionScope.errorMessage)}</p>
            </div>
        </c:if>

        <div class="bg-white shadow-md rounded-lg p-6 mb-8">
            <form>

            <!-- Name -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label for="firstname" class="block text-sm font-medium text-gray-700 mb-1">Όνομα</label>
                    <input id="firstname" name="firstname" type="text" readonly
                           value="${fn:escapeXml(teacher.firstname)}"
                           class="w-full px-3 py-2 border border-gray-300 bg-gray-100 text-gray-700 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                           placeholder="Όνομα" />
                </div>
                <div>
                    <label for="lastname" class="block text-sm font-medium text-gray-700 mb-1">Επώνυμο</label>
                    <input id="lastname" name="lastname" type="text" readonly
                           value="${fn:escapeXml(teacher.lastname)}"
                           class="w-full px-3 py-2 border border-gray-300 bg-gray-100 text-gray-700 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                           placeholder="Επώνυμο" />
                </div>
            </div>

            <!-- VAT and Father's Name -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
                <div>
                    <label for="vat" class="block text-sm font-medium text-gray-700 mb-1">ΑΦΜ</label>
                    <input id="vat" name="vat" type="text" readonly
                           value="${fn:escapeXml(teacher.vat)}"
                           class="w-full px-3 py-2 border border-gray-300 bg-gray-100 text-gray-700 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                           placeholder="ΑΦΜ" />
                </div>
                <div>
                    <label for="fathername" class="block text-sm font-medium text-gray-700 mb-1">Επώνυμο Πατρός</label>
                    <input id="fathername" name="fathername" type="text" readonly
                           value="${fn:escapeXml(teacher.fatherName)}"
                           class="w-full px-3 py-2 border border-gray-300 bg-gray-100 text-gray-700 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                           placeholder="Επώνυμο Πατρός" />
                </div>
            </div>

            <!-- Contact Info -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
                <div>
                    <label for="phoneNum" class="block text-sm font-medium text-gray-700 mb-1">Αριθμός Τηλεφώνου</label>
                    <input id="phoneNum" name="phoneNum" type="text" readonly
                           value="${fn:escapeXml(teacher.phoneNum)}"
                           class="w-full px-3 py-2 border border-gray-300 bg-gray-100 text-gray-700 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                           placeholder="Αριθμός Τηλεφώνου" />
                </div>
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">E-mail</label>
                    <input id="email" name="email" type="text" readonly
                           value="${fn:escapeXml(teacher.email)}"
                           class="w-full px-3 py-2 border border-gray-300 bg-gray-100 text-gray-700 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                           placeholder="E-mail" />
                </div>
            </div>

            <!-- Address -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
                <div>
                    <label for="street" class="block text-sm font-medium text-gray-700 mb-1">Οδός</label>
                    <input id="street" name="street" type="text" readonly
                           value="${fn:escapeXml(teacher.street)}"
                           class="w-full px-3 py-2 border border-gray-300 bg-gray-100 text-gray-700 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                           placeholder="Οδός" />
                </div>
                <div>
                    <label for="streetNum" class="block text-sm font-medium text-gray-700 mb-1">Αριθμός</label>
                    <input id="streetNum" name="streetNum" type="text" readonly
                           value="${fn:escapeXml(teacher.streetNum)}"
                           class="w-full px-3 py-2 border border-gray-300 bg-gray-100 text-gray-700 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                           placeholder="Αριθμός" />
                </div>
            </div>

            <!-- Zip and City -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
                <div>
                    <label for="zipcode" class="block text-sm font-medium text-gray-700 mb-1">ΤΚ</label>
                    <input id="zipcode" name="zipcode" type="text" readonly
                           value="${fn:escapeXml(teacher.zipCode)}"
                           class="w-full px-3 py-2 border border-gray-300 bg-gray-100 text-gray-700 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                           placeholder="ΤΚ" />
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Πόλη</label>
                    <c:forEach items="${requestScope.cities}" var="city">
                        <c:if test="${city.id == teacher.cityId}">
                            <input type="text" readonly
                                   value="${fn:escapeXml(city.name)}"
                                   class="w-full px-3 py-2 border border-gray-300 bg-gray-100 text-gray-700 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500" />
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            </form>
        </div>

        <!-- Back Link -->
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/school-app/teachers/view"
               class="text-blue-600 hover:text-blue-800 font-medium transition-colors duration-200">
                Επιστροφή στη λίστα καθηγητών
            </a>
        </div>
    </div>
</main>

<%@ include file="footer2.jsp" %>
