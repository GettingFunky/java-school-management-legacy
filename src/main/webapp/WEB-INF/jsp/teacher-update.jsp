<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="pageTitle" value="Εισαγωγή Νέου Καθηγητή" />
<%@ include file="header3.jsp" %>

<main class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto">
		<form method="POST" action="${pageContext.request.contextPath}/school-app/teachers/update">
            <input type="hidden" name="id" value="${requestScope.updateDTO.id}" >
            <div class="row m-bottom">
                <div>
                    <input class="m-bottom" type="text" name="firstname" value="${requestScope.updateDTO.firstname}" placeholder="Όνομα">
                    <p class="validation-error">${sessionScope.firstnameMessage}</p>
                </div>
                <div>
                    <input class="m-bottom" type="text" name="lastname" value="${requestScope.updateDTO.lastname}" placeholder="Επώνυμο">
                    <p class="validation-error">${sessionScope.lastnameMessage}</p>
                </div>
            </div>
            <div class="row m-bottom">
                <input class="m-bottom" type="text" name="vat" value="${requestScope.updateDTO.vat}" placeholder="ΑΦΜ">
                <p class="validation-error">${sessionScope.vatMessage}</p>
                <input class="m-bottom" type="text" name="fathername" value="${requestScope.updateDTO.fatherName}" placeholder="Επώνυμο Πατρός">
                <p class="validation-error">${sessionScope.fathernameMessage}</p>
            </div>
            <div class="row m-bottom">
                <input class="m-bottom" type="text" name="phoneNum" value="${requestScope.updateDTO.phoneNum}" placeholder="Αριθμός Τηλεφώνου">
                <p class="validation-error">${sessionScope.phoneNumMessage}</p>
                <input class="m-bottom" type="text" name="email" value="${requestScope.updateDTO.email}" placeholder="E-mail">
                <p class="validation-error">${sessionScope.emailMessage}</p>
            </div>
            <div class="row m-bottom">
                <input class="m-bottom" type="text" name="street" value="${requestScope.updateDTO.street}" placeholder="Οδός">
                <p class="validation-error">${sessionScope.streetMessage}</p>
                <input class="m-bottom" type="text" name="streetNum" value="${requestScope.updateDTO.streetNum}" placeholder="Αριθμός">
                <p class="validation-error">${sessionScope.streetNumMessage}</p>
            </div>
            <div class="row m-bottom">
                <input class="m-bottom" type="text" name="zipcode" value="${requestScope.updateDTO.zipCode}" placeholder="ΤΚ">
                <p class="validation-error">${sessionScope.zipcodeMessage}</p>

            <!-- City Dropdown -->
                <select class="m-bottom" name="cityId">
                <%-- The Select City option appears in the dropdown but cannot be chosen after a real selection is made --%>
                    <option value="" disabled ${empty updateDTO.cityId ? 'selected' : ''}>
                        Select City
                    </option>
                    <c:forEach items="${cities}" var="city">
                        <option value="${city.id}"
                                ${city.id eq updateDTO.cityId ? 'selected' : ''}>
                            ${city.name}
                        </option>
                    </c:forEach>
                </select>
                <p class="validation-error">${sessionScope.cityIdMessage}</p>
            </div>
            <div class="row">
                <button type="submit">Εισαγωγή</button>
            </div>

		</form>	
	</div>	

    <div class="m-bottom">
        <a href="${pageContext.request.contextPath}/school-app/teachers/view">Επιστροφή</a>
    </div>

    <div>
        ${requestScope.errorMessage}
    </div>
</main>

<%@ include file="footer2.jsp" %>
