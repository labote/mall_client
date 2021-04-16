<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrdersList</title>
</head>
<body>
	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	
	<!-- cartList -->
	<%
		List<Map<String,Object>> ordersList = (List<Map<String,Object>>)(request.getAttribute("ordersList"));
	%>
	
	<h1>OrdersList</h1>
	<table border="1">
		<thead>
			<tr>
				<th>ordersNo</th>
				<th>ebookNo</th>
				<th>ordersDate</th>
				<th>ordersState</th>
				<th>ebookTitle</th>
				<th>ebookPrice</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Map m : ordersList){
			%>
					<tr>
						<td><%=(Integer)(m.get("ordersNo"))%></td>
						<td><%=(Integer)(m.get("ebookNo"))%></td>
						<td><%=(String)(m.get("ordersDate"))%></td>
						<td><%=(String)(m.get("ordersState"))%></td>
						<td><%=(String)(m.get("ebookTitle"))%></td>
						<td><%=(Integer)(m.get("ebookPrice"))%></td>
					</tr>
			<%		
				}
			%>
		</tbody>
	</table>
</body>
</html>