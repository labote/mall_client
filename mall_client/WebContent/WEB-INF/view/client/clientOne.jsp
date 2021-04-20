<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<td>${clientOne.clientNo}</td>
				<td>${clientOne.clientMail}</td>
				<td>${clientOne.clientDate}</td>
			</tr>
		</tbody>
	</table>
	<!-- UpdateClientPwController.doGet() - updateClientPw.jsp -->
	<!-- UpdateClientPwController.doPost() - ClientDao.updateClientPw() - session.invalidate() - redirect: /IndexController -->
	<a href="${pageContext.request.contextPath}/UpdateClientPwController" class="btn">비밀번호 수정</a>
	<!-- DeleteClientController - CartDao.deleteCartByClient(mail), ClientDao.deleteClient(mail) - session.invalidate() - redirect: /IndexController -->
	<a href="${pageContext.request.contextPath}/DeleteClientController" class="btn">회원탈퇴</a>
</body>
</html>