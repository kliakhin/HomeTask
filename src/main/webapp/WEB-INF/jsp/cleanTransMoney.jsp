<%@page import="org.kliakhin.hometask.entity.Transmoney"%>
<%@ page import="org.kliakhin.hometask.service.TransmoneyService" %>
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
		TransmoneyService transmoneyService = (TransmoneyService) context
				.getBean("transmoneyServiceImpl");
		for (Transmoney transmoney : transmoneyService.findAll()) {
			if (transmoney.getStatus().equals("T")) {
				transmoneyService.remove(transmoney.getId());
			}
		}
		response.sendRedirect("transmoneys.jsp");
	%>
</body>
</html>