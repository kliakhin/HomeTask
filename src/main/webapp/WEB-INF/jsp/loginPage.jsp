
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
</head>
<body>
<ul>
		<li><a class="active" href="../menu.html">Home</a></li>
		<li><a href="jsp/merchantList.jsp">MerchantList</a></li>
		<li><a href="jsp/customerList.jsp">CustomerList</a></li>
		<li><a href="jsp/paymentList.jsp">PaymentList</a></li>
		<li><a href="jsp/transMoneyList.jsp">TransMoneyList</a></li>
		<ul style="float: right; list-style-type: none;">
			<li><a href="#about">About</a></li>
			<li><a href="#login">Login</a></li>
		</ul>
	</ul>
	<form action="jsp/login.jsp" method="POST">
		Login:    <input type="text" name="login" /> 
		<br /> 
		Password: <input type="password" name="psw" /> 
		<br /> 
		<input type="submit" value="Submit" />
	</form>
</body>
</html>