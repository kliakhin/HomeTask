<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Merchant List</title>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<h1>Merchant List</h1>
	<table>
		<tr>
			<td>ID
			<td>Name
			<td>Charge
			<td>Period
			<td>Minimum Sum
			<td>Bank
			<td>Swift
			<td>Account
			<td>NeedToSend
			<td>Sent
			<td>LastSend
		</tr>
		<c:forEach items="${merchants}" var="item">
			<tr>
				<td><c:out value="${item.id}" /></td>
				<td><c:out value="${item.name}" /></td>
				<td><c:out value="${item.charge}" /></td>
				<td><c:out value="${item.period}" /></td>
				<td><c:out value="${item.minSum}" /></td>
				<td><c:out value="${item.bankName}" /></td>
				<td><c:out value="${item.swift}" /></td>
				<td><c:out value="${item.account}" /></td>
				<td><c:out value="${item.needToSend}" /></td>
				<td><c:out value="${item.sent}" /></td>
				<td><c:out value="${item.lastSent}" /></td>
			</tr>
		</c:forEach>
	</table>
	<a href="<c:url value="/"/>" class="button">Home</a>
	<a href="<c:url value="/merchant/create"/>" class="button">Add new customer</a>
	<a href="<c:url value="/merchant/reset"/>" class="button">Reset merchant list(test)</a>
	<a href="<c:url value="/merchant/resetdate"/>" class="button">Reset date(test)</a>
	<form action="<c:url value="/merchant/remove"/>" method="POST">
		Remove Merchant
		<input type="text" name="id">
		<input type="submit" value="Submit"/>
	</form>
</body>
</html>
