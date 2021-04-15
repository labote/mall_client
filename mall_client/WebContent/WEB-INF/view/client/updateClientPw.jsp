<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.client.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateClientPw</title>
</head>
<body>
	<%
		Client clientOne = (Client)(request.getAttribute("clientOne"));
	%>
	<form action="<%=request.getContextPath()%>/UpdateClientPwController" method="post">
		<table border="1">
			<tr>
				<td>ClientMail</td>
				<td><%=clientOne.getClientMail()%></td>
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