<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Προβολή Καθηγητή</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/teachers.css">
</head>
<body>
<%@ include file="header.jsp" %>

<div class="main-content">
    <h2>Προβολή Καθηγητή</h2>

    <p><strong>ID:</strong> ${teacher.id}</p>
    <p><strong>Όνομα:</strong> ${teacher.firstname}</p>
    <p><strong>Επώνυμο:</strong> ${teacher.lastname}</p>
    <p><strong>ΑΦΜ:</strong> ${teacher.vat}</p>
    <p><strong>Email:</strong> ${teacher.email}</p>
    <p><strong>Πατρώνυμο:</strong> ${teacher.fatherName}</p>

    <br>
    <a class="custom-button-green" href="${pageContext.request.contextPath}/school-app/teachers/view">🔙 Επιστροφή στη Λίστα</a>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
