<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.client.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clientOne</title>
</head>
<body>
	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	
	<!-- clientOne -->
	<%
		Client clientOne = (Client)(request.getAttribute("clientOne"));
	%>
	
	<table border="1">
		<thead>
			<tr>
				<td>clientNo</td>
				<td>clientMail</td>
				<td>clientDate</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=clientOne.getClientNo() %></td>
				<td><%=clientOne.getClientMail() %></td>
				<td><%=clientOne.getClientDate() %></td>
			</tr>
		</tbody>
	</table>
</body>
</html>