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
	<a href="<%=request.getContextPath()%>/WithdrawController" class="btn">회원탈퇴</a>
	<a href="<%=request.getContextPath()%>/UpdatePasswordController" class="btn">비밀번호 수정</a>
</body>
</html>