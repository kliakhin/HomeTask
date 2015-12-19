<%@ page import="org.kliakhin.hometask.payment.PaymentService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext(
				"WEB-INF/spring/application-config.xml");
		PaymentService paymentService = (PaymentService) context
				.getBean("paymentServiceImpl");
		paymentService.remove(Integer.parseInt(request.getParameter("id")));
		response.sendRedirect("paymentList.jsp");
	%>
</body>
</html>