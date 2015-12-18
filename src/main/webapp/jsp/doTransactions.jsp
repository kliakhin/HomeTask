<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ page import="org.kliakhin.hometask.transmoney.Transmoney" %>
<%@ page import="org.kliakhin.hometask.transmoney.TransmoneyService" %>
<%@ page import="org.kliakhin.hometask.merchant.MerchantService" %>
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
				"spring/application-config.xml");

		TransmoneyService transmoneyService = (TransmoneyService) context
				.getBean("transmoneyServiceImpl");
		MerchantService merchantService = (MerchantService) context
				.getBean("merchantServiceImpl");
		java.util.List<Transmoney> list = transmoneyService.findWithFalseStatus();
		int limit = Integer.parseInt(request.getParameter("cash"));
		for (Transmoney transmoney : list) {
			double sumSent = transmoney.getSumSent();
			System.out.println("sumSent= " + sumSent);
			if (limit - sumSent < 0)
				continue;
			transmoneyService.doTransaction(transmoney.getId());
			limit -= sumSent;
			merchantService.updateForTrans(transmoney.getMerchantId(), Date.valueOf(LocalDate.now()), transmoney.getSumSent(), transmoney.getSumSent());
			System.out.println("sumSent= " + sumSent);
			
			System.out.println("sumSent= " + sumSent);
			
		}
		response.sendRedirect("transMoneyList.jsp");
	%>

</body>
</html>