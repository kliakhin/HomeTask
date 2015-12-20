<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <title>Transmoney List</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<h1>Transmoney List</h1>
<table>
    <tr>
        <td>Id
        <td>MerchantId
        <td>Sum Sent
        <td>Sent Date
        <td>Status
    </tr>
    <c:forEach items="${transmoneys}" var="item">
        <tr>
            <td><c:out value="${item.id}"/></td>
            <td><c:out value="${item.merchantId}"/></td>
            <td><c:out value="${item.sumSent}"/></td>
            <td><c:out value="${item.sentDate}"/></td>
            <td><c:out value="${item.status}"/></td>
        </tr>
    </c:forEach>
</table>
<a href="<c:url value="/"/>" class="button">Home</a>
<br>
<form action="<c:url value="/transmoney/dotransmoney"/>" method="POST">
    Enter limited cash:
    <input type="text" name="cash"/>
    <input type="submit" value="Submit"/>
</form>
<a href="<c:url value="/transmoney/clear"/>" class="button">Clear true transactions</a>
<form action="<c:url value="/transmoney/remove"/>" method="POST">
    Remove Transmoney
    <input type="text" name="id">
    <input type="submit" value="Submit"/>
</form>
</body>
</html>
