<%@ page import="org.kliakhin.hometask.payment.PaymentService" %>
<%@ page import="org.kliakhin.hometask.payment.Payment" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Payment List</title>
</head>
<body>
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
		<%
			org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext(
					"spring/application-config.xml");
			PaymentService paymentService = (PaymentService) context
					.getBean("paymentServiceImpl");
			java.util.List<Payment> list = paymentService.findAll();
			for (Payment m : list) {
				out.print(m.getDataForWeb());
			}
		%>
	</table>
	<a href="..//menu.html" class="button">Home</a>
	<a href="..//addNewPayment.html" class="button">Add New Payment</a>
	<form action="removePayment.jsp" method="POST">
		Id:    <input type="text" name="id" /> 
		<br /> 
		<input type="submit" value="Submit" />
	</form>
</body>
</html>
