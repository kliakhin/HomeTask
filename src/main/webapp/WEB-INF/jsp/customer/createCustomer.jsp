<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../../../css/style.css" />
<title>Add new Customer</title>
</head>
<body>
    <h1>New Customer</h1>
    <form action="<c:url value="/customer/add"/>" method="POST">
        <table>
            <tr>
                <td>Name:
                <td><input type="text" name="name" />
            <tr>
                <td>Address:
                <td><input type="text" name="address" />
            <tr>
                <td>Email:
                <td><input type="text" name="email" />
            <tr>
                <td>ccNo:
                <td><input type="text" name="ccNO" />
            <tr>
                <td>ccType:
                <td><input type="text" name="ccType" />
            <tr>
                <td>Maturity:
                <td><input type="date" name="maturity" />
            <tr>
        </table>
        <input type="submit" value="Submit" />
    </form>
</body>
</html>
