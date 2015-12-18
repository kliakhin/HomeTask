<%@ page import="org.kliakhin.hometask.merchant.Merchant" %>
<%@ page import="org.kliakhin.hometask.merchant.MerchantService" %>
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
	<ul>
		<li><a class="active" href="../menu.html">Home</a></li>
		<li><a href="merchantList.jsp">MerchantList</a></li>
		<li><a href="customerList.jsp">CustomerList</a></li>
		<li><a href="paymentList.jsp">PaymentList</a></li>
		<li><a href="transMoneyList.jsp">TransMoneyList</a></li>
		<ul style="float: right; list-style-type: none;">
			<li><a href="#about">About</a></li>
			<li><a href="#login">Login</a></li>
		</ul>
	</ul>
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
			<td>Send
			<td>LastSend
		</tr>
		<%
			org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext(
					"spring/application-config.xml");
			MerchantService merchantService = (MerchantService) context
					.getBean("merchantServiceImpl");
			java.util.List<Merchant> list = merchantService.findAll();
			for (Merchant m : list) {
				out.print(m.getDataForWeb());
			}
		%>
	</table>

	<a href="..//addNewMerchant.html">Add new merchant</a>
	<br> Remove merchant
	<form action="removeMerchant.jsp" method="POST">
		Id: <input type="text" name="id" /> <br /> <input type="submit"
			value="Submit" />
	</form>
	<a href="updateMerchants.jsp">Update to start</a>
	<br>
</body>
</html>
