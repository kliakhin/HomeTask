<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Login</title>
</head>
<body>
	<%
		if (request.getParameter("psw").equals("1234") && request.getParameter("login").equals("1234")) {
		response.sendRedirect("..//menu.html");
		} else if (request.getParameter("psw").equals("123456")) {
			out.println("<h1> Wrong login! </h1>");
	%>
	<h1>Repeat enter</h1>
	<a href="..//loginPage.html" class="button">Login</a>
	<%
		} else if (request.getParameter("login").equals("1111")) {
			out.println("<h1> Wrong password! </h1>");
	%>
	<h1>Repeat enter</h1>
	<a href="..//loginPage.html" class="button">Login</a>
	<%
		} else {
			out.println("<h1> Wrong login and password!!!</h1>");
	%>
	<h1>Repeat enter</h1>
	<a href="..//loginPage.html" class="button">Login</a>
	<%
		}
	%>
</body>
</html>