<%@ page import="org.kliakhin.hometask.transmoney.Transmoney" %>
<%@ page import="org.kliakhin.hometask.transmoney.TransmoneyService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Transmoney List</title>
</head>
<body>
	<h1>Transmoney List</h1>
	<table>
		<tr>
			<td>Id
			<td>MerchantId
			<td>Sum Sent
			<td>Sent Date
			<td>Status
		</tr>
		<%
			org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext(
					"WEB-INF/spring/application-config.xml");
			TransmoneyService transmoneyService = (TransmoneyService) context
					.getBean("transmoneyServiceImpl");
			java.util.List<Transmoney> list = transmoneyService.findAll();
			for (Transmoney tm : list) {
				out.print(tm.getDataForWeb());
			}
		%>
	</table>
	<a href="..//menu.html" class="button">Home</a><br>
	Cash(do transaction)
	<form action="doTransactions.jsp" method="POST">
		Id:    <input type="text" name="cash" /> 
		<br /> 
		<input type="submit" value="Submit" />
	</form>
	<a href="cleanTransMoney.jsp" class="button">Clean Table</a><br>
</body>
</html>
