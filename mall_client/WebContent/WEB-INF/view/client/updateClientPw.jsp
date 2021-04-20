<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateClientPw</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/UpdateClientPwController" method="post">
		<table border="1">
			<tr>
				<td>ClientMail</td>
				<td>${clientOne.clientMail}</td>
			</tr>
			<tr>
				<td>New Password</td>
				<td><input type="password" name="newClientPw"></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>