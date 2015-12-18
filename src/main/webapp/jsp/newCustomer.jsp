<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ page import="org.kliakhin.hometask.customer.Customer" %>
<%@ page import="org.kliakhin.hometask.customer.CustomerService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>New Customer</title>
</head>
<body>
	<h1>Customer List</h1>
	<table>
		<tr>
			<td>Name
			<td>Bank
			<td>Charge
			<td>Minimum Sum
		</tr>
		<%
			org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext(
					"spring/application-config.xml");
			CustomerService customerService = (CustomerService) context
					.getBean("customerServiceImpl");
			Customer customer = new Customer();
			customer.setName(request.getParameter("name"));
			customer.setAddress(request.getParameter("address"));
			customer.setEmail(request.getParameter("email"));
			customer.setCcNO(request.getParameter("ccNO"));
			customer.setCcType(request.getParameter("ccType"));
			LocalDate date = LocalDate.of(Integer.parseInt(request.getParameter("year")),
					Integer.parseInt(request.getParameter("month")), Integer.parseInt(request.getParameter("day")));
			Date maturity = Date.valueOf(date);
			customer.setMaturity(maturity);
			customerService.save(customer);
			response.sendRedirect("customerList.jsp");
		%>
	</table>
</body>

</html>