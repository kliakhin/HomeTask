<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <title>Payment List</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<h1>Payment List</h1>
<table>
    <tr>
        <td>ID
        <td>Charge Payed
        <td>Sum Payed
        <td>Goods
        <td>Date
        <td>CustomerId
        <td>MerchantId
    </tr>
    <c:forEach items="${payments}" var="item">
        <tr>
            <td><c:out value="${item.id}"/></td>
            <td><c:out value="${item.chargePayed}"/></td>
            <td><c:out value="${item.sumPayed}"/></td>
            <td><c:out value="${item.goods}"/></td>
            <td><c:out value="${item.dt}"/></td>
            <td><c:out value="${item.customerId}"/></td>
            <td><c:out value="${item.merchantId}"/></td>
        </tr>
    </c:forEach>
</table>
<a href="<c:url value="/"/>" class="button">Home</a>
<a href="<c:url value="/payment/create"/>" class="button">Add new payment</a>
<form action="<c:url value="/payment/remove"/>" method="POST">
    Remove Payment
    <input type="text" name="id" value="Enter payment ID">
    <input type="submit" value="Submit"/>
</form>
</body>
</html>
