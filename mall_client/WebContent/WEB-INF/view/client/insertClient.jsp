<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertClient</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="<%=request.getContextPath()%>/InsertClientController" method="post">
		ClientMail : <input type="text" name="clientMail">
		ClientPw : <input type="password" name="clientPw">
		<button type="submit">회원가입</button>
	</form>
</body>
</html>