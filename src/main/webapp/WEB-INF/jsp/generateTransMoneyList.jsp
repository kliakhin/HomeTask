<%@page import="org.kliakhin.hometask.transmoney.TransmoneyServiceImpl" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="org.kliakhin.hometask.merchant.MerchantService" %>
<%@page import="org.kliakhin.hometask.merchant.Merchant" %>
<%@page import="org.kliakhin.hometask.transmoney.Transmoney" %>
<%@page import="org.kliakhin.hometask.transmoney.TransmoneyService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
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
    MerchantService merchantSevice = (MerchantService) context
            .getBean("merchantServiceImpl");
    for (Merchant merchant : merchantSevice.findMerchantListForTrans()) {
        Timestamp timestamp = Timestamp.valueOf(LocalDateTime.now());
        Transmoney transmoney = new Transmoney();
        transmoney.setMerchantId(merchant.getId());
        transmoney.setSentDate(timestamp);
        transmoney.setStatus("F");
        transmoney.setSumSent(merchant.getNeedToSend());
        transmoneyService.save(transmoney);
        merchantSevice.updateLastSent(merchant.getId(), java.sql.Date.valueOf(LocalDate.now()));
    }
    response.sendRedirect("transMoneyList.jsp");
%>
</body>
</html>