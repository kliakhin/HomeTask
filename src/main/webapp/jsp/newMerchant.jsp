<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@ page import="org.kliakhin.hometask.merchant.Merchant" %>
<%@ page import="org.kliakhin.hometask.merchant.MerchantService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>New Merchant</title>
</head>
<body>
		<%
			org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext(
					"spring/application-config.xml");
			MerchantService merchantService = (MerchantService) context
					.getBean("merchantServiceImpl");
			Merchant merchant = new Merchant();
			merchant.setName(request.getParameter("name"));
			merchant.setBankName(request.getParameter("bank"));
			merchant.setSwift(request.getParameter("swift"));
			merchant.setAccount(request.getParameter("account"));
			merchant.setCharge(Double.valueOf(request.getParameter("charge")));
			merchant.setPeriod(Short.valueOf(request.getParameter("period")));
			merchant.setMinSum(Double.valueOf(request.getParameter("sum")));
			LocalDate lastSent = LocalDate.now();
			merchant.setLastSent(Date.valueOf(lastSent.minusYears(1)));
			merchantService.save(merchant);
			response.sendRedirect("merchantList.jsp");
		%>
</body>

</html>