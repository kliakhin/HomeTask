<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Customer List</title>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<h1>Customer List</h1>
	<table>
        <tr>
            <td>ID
            <td>Name
            <td>Address
            <td>Email
            <td>ccNo
            <td>ccType
            <td>Maturity
        </tr>
		<c:forEach items="${customers}" var="item">
			<tr>
				<td><c:out value="${item.id}" /></td>
				<td><c:out value="${item.name}" /></td>
				<td><c:out value="${item.address}" /></td>
				<td><c:out value="${item.email}" /></td>
				<td><c:out value="${item.ccNO}" /></td>
				<td><c:out value="${item.ccType}" /></td>
				<td><c:out value="${item.maturity}" /></td>
			</tr>
		</c:forEach>
	</table>
	<a href="<c:url value="/"/>" class="button">Home</a>
	<a href="<c:url value="/customer/create"/>" class="button">Add new customer</a>
</body>
</html>