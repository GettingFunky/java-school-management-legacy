<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="pageTitle" value="Ενημέρωση Στοιχείων Μαθητή" />
<%@ include file="header3.jsp" %>

<main class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
        <h1 class="text-2xl font-bold text-gray-800 mb-6">Ενημέρωση Στοιχείων Μαθητή</h1>

        <!-- Error Message -->
        <c:if test="${not empty requestScope.errorMessage or not empty sessionScope.errorMessage}">
            <div class="mb-6 p-4 bg-red-50 border-l-4 border-red-500 text-red-700 rounded">
                <p>${fn:escapeXml(not empty requestScope.errorMessage ? requestScope.errorMessage : sessionScope.errorMessage)}</p>
            </div>
        </c:if>

        <!-- Students Form -->
        <div class="bg-white shadow-md rounded-lg p-6 mb-8">
            <form method="POST" action="${pageContext.request.contextPath}/school-app/student/update" class="space-y-6">

                <!--Hidden ID -->
               <input type="hidden" name="id" value="${updateDTO.id}" />


                <!-- Name Row -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="firstname" class="block text-sm font-medium text-gray-700 mb-1">Όνομα</label>
                        <input id="firstname" name="firstname" type="text"
                               value="${fn:escapeXml(updateDTO.firstname)}"
                               class="w-full px-3 py-2 border ${not empty requestScope.firstnameMessage ? 'border-red-300' : 'border-gray-300'} rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                               placeholder="Όνομα">
                        <c:if test="${not empty requestScope.firstnameMessage}">
                            <p class="mt-1 text-sm text-red-600">${requestScope.firstnameMessage}</p>
                        </c:if>
                    </div>
                    <div>
                        <label for="lastname" class="block text-sm font-medium text-gray-700 mb-1">Επώνυμο</label>
                        <input id="lastname" name="lastname" type="text"
                               value="${fn:escapeXml(updateDTO.lastname)}"
                               class="w-full px-3 py-2 border ${not empty requestScope.lastnameMessage ? 'border-red-300' : 'border-gray-300'} rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                               placeholder="Επώνυμο">
                        <c:if test="${not empty requestScope.lastnameMessage}">
                            <p class="mt-1 text-sm text-red-600">${requestScope.lastnameMessage}</p>
                        </c:if>
                    </div>
                </div>

                <!-- VAT and Father's Name -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                          <label for="birthDate" class="block text-sm font-medium text-gray-700 mb-1">Ημερομηνία Γέννησης</label>
                          <input id="birthDate" name="birthDate" type="date"
                                 value="${updateDTO.birthDate}"
                                 class="w-full px-3 py-2 border border-gray-300 bg-gray-100 text-gray-700 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                          <c:if test="${not empty requestScope.birthDateMessage}">
                              <p class="mt-1 text-sm text-red-600">${requestScope.birthDateMessage}</p>
                          </c:if>
                      </div>
                    <div>
                        <label for="fathername" class="block text-sm font-medium text-gray-700 mb-1">Επώνυμο Πατρός</label>
                        <input id="fathername" name="fathername" type="text"
                               value="${fn:escapeXml(updateDTO.fatherName)}"
                               class="w-full px-3 py-2 border ${not empty requestScope.fathernameMessage ? 'border-red-300' : 'border-gray-300'} rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                               placeholder="Επώνυμο Πατρός">
                        <c:if test="${not empty requestScope.fatherNameMessage}">
                            <p class="mt-1 text-sm text-red-600">${requestScope.fathernameMessage}</p>
                        </c:if>
                    </div>
                </div>

                <!-- Contact Info -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="phoneNum" class="block text-sm font-medium text-gray-700 mb-1">Αριθμός Τηλεφώνου</label>
                        <input id="phoneNum" name="phoneNum" type="text"
                               value="${fn:escapeXml(updateDTO.phoneNum)}"
                               class="w-full px-3 py-2 border ${not empty requestScope.phoneNumMessage ? 'border-red-300' : 'border-gray-300'} rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                               placeholder="Αριθμός Τηλεφώνου">
                        <c:if test="${not empty requestScope.phoneNumMessage}">
                            <p class="mt-1 text-sm text-red-600">${requestScope.phoneNumMessage}</p>
                        </c:if>
                    </div>
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">E-mail</label>
                        <input id="email" name="email" type="text"
                               value="${fn:escapeXml(updateDTO.email)}"
                               class="w-full px-3 py-2 border ${not empty requestScope.emailMessage ? 'border-red-300' : 'border-gray-300'} rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                               placeholder="E-mail">
                        <c:if test="${not empty requestScope.emailMessage}">
                            <p class="mt-1 text-sm text-red-600">${requestScope.emailMessage}</p>
                        </c:if>
                    </div>
                </div>

                <!-- Address -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label for="street" class="block text-sm font-medium text-gray-700 mb-1">Οδός</label>
                        <input id="street" name="street" type="text"
                               value="${fn:escapeXml(updateDTO.street)}"
                               class="w-full px-3 py-2 border ${not empty requestScope.streetMessage ? 'border-red-300' : 'border-gray-300'} rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                               placeholder="Οδός">
                        <c:if test="${not empty requestScope.streetMessage}">
                            <p class="mt-1 text-sm text-red-600">${requestScope.streetMessage}</p>
                        </c:if>
                    </div>
                    <div>
                        <label for="streetNum" class="block text-sm font-medium text-gray-700 mb-1">Αριθμός</label>
                        <input id="streetNum" name="streetNum" type="text"
                               value="${fn:escapeXml(updateDTO.streetNum)}"
                               class="w-full px-3 py-2 border ${not empty requestScope.streetNumMessage ? 'border-red-300' : 'border-gray-300'} rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                               placeholder="Αριθμός">
                        <c:if test="${not empty requestScope.streetNumMessage}">
                            <p class="mt-1 text-sm text-red-600">${requestScope.streetNumMessage}</p>
                        </c:if>
                    </div>
                </div>

<!-- Zip Code and City -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
                <label for="zipcode" class="block text-sm font-medium text-gray-700 mb-1">ΤΚ</label>
                <input id="zipcode" name="zipcode" type="text"
                       value="${fn:escapeXml(updateDTO.zipCode)}"
                       class="w-full px-3 py-2 border ${not empty requestScope.zipcodeMessage ? 'border-red-300' : 'border-gray-300'} rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                       placeholder="ΤΚ">
                <c:if test="${not empty requestScope.zipcodeMessage}">
                    <p class="mt-1 text-sm text-red-600">${requestScope.zipcodeMessage}</p>
                </c:if>
            </div>
            <div>
                <label for="cityId" class="block text-sm font-medium text-gray-700 mb-1">Πόλη</label>
                <select id="cityId" name="cityId"
                        class="w-full px-3 py-2 border ${not empty requestScope.cityIdMessage ? 'border-red-300' : 'border-gray-300'} rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                    <c:forEach items="${requestScope.cities}" var="city">
                        <option value="${city.id}"
                                <c:if test="${city.id == updateDTO.cityId}">selected</c:if>>
                            ${fn:escapeXml(city.name)}
                        </option>
                    </c:forEach>
                </select>
                <c:if test="${not empty requestScope.cityIdMessage}">
                    <p class="mt-1 text-sm text-red-600">${requestScope.cityIdMessage}</p>
                </c:if>
            </div>
        </div>


                <!-- Submit Button -->
                <div class="pt-4">
                    <button type="submit"
                            class="w-full md:w-auto px-6 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-yellow-500 hover:bg-yellow-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-200">
                        Ενημέρωση
                    </button>
                </div>
            </form>
        </div>

        <!-- Back Link -->
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/school-app/students/view"
               class="text-blue-600 hover:text-blue-800 font-medium transition-colors duration-200">
                Επιστροφή στη λίστα μαθητών
            </a>
        </div>
    </div>
</main>

<%@ include file="footer2.jsp" %>