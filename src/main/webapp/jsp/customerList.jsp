<%@ page import="org.kliakhin.hometask.customer.Customer" %>
<%@ page import="org.kliakhin.hometask.customer.CustomerService" %>
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
<ul>
		<li><a class="active" href="..//menu.html">Home</a></li>
		<li><a href="jsp/merchantList.jsp">MerchantList</a></li>
		<li><a href="jsp/customerList.jsp">CustomerList</a></li>
		<li><a href="jsp/paymentList.jsp">PaymentList</a></li>
		<li><a href="jsp/transMoneyList.jsp">TransMoneyList</a></li>
		<ul style="float: right; list-style-type: none;">
			<li><a href="#about">About</a></li>
			<li><a href="#login">Login</a></li>
		</ul>
	</ul>
	<h1>Customer List</h1>
	<table>
		<tr>
			<td>ID
			<td>Name
			<td>Address
			<td>Email
			<td>ccNO
			<td>ccType
		</tr>
		<%
			org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext(
					"spring/application-config.xml");
			CustomerService customerService = (CustomerService) context
					.getBean("customerServiceImpl");
			java.util.List<Customer> list = customerService.findAll();
			for (Customer c : list) {
				out.print(c.getDataForWeb());
			}
		%>
	</table>
	<a href="html/menu.html" class="button">Home</a>
	<a href="html/addNewCustomer.html" class="button">Add new customer</a>
</body>
</html>