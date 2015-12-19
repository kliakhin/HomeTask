<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<title>Add new Payment</title>
</head>
<body>
	<h1>New Payment</h1>
	<form action="jsp/newPayment.jsp" method="POST">
		<table>
			<tr>
				<td>MerchantId:
				<td><input type="text" name="merchantId">
			<tr>
				<td>CustomerId:
				<td><input type="text" name="customerId" />
			<tr>
				<td>Goods:
				<td><input type="text" name="goods" />
			<tr>
				<td>Sum Payed:
				<td><input type="text" name="sumPayed" />
			<tr>
		</table>
		<input type="submit" value="Submit" />
	</form>
</body>
</html>