<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@ page import="org.kliakhin.hometask.merchant.MerchantService" %>
<%@ page import="org.kliakhin.hometask.payment.PaymentService" %>
<%@ page import="org.kliakhin.hometask.payment.Payment" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>New Payment</title>
</head>
<body>
	<%
		org.springframework.context.ApplicationContext context = new org.springframework.context.support.ClassPathXmlApplicationContext(
				"spring/application-config.xml");

		PaymentService paymentService = (PaymentService) context
				.getBean("paymentServiceImpl");
		MerchantService merchantService = (MerchantService) context
				.getBean("merchantServiceImpl");

		int merchantId = Integer.parseInt(request.getParameter("merchantId"));
		double sumPayed = Double.valueOf(request.getParameter("sumPayed"));
		double chargePayed = sumPayed * (merchantService.findById(merchantId).getCharge()) / 100;
		Payment payment = new Payment();
		payment.setSumPayed(sumPayed);
		payment.setGoods(request.getParameter("goods"));
		payment.setDt(Timestamp.valueOf(LocalDateTime.now()));
		payment.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
		payment.setMerchantId(merchantId);
		payment.setChargePayed(chargePayed);
		paymentService.save(payment);
		merchantService.updateNeddToSend(merchantId, sumPayed - chargePayed);
		response.sendRedirect("paymentList.jsp");
	%>
</body>

</html>
