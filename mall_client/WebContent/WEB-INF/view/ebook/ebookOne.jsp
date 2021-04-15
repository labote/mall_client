<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.client.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ebookOne</title>
</head>
<body>
	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	
	<!-- clientOne -->
	<%
		Ebook ebook = (Ebook)(request.getAttribute("ebookOne"));
	%>
	
	<table border="1">
		<tr>
			<td>ebookISBN</td>
			<td><%=ebook.getEbookISBN()%></td>
		</tr>
		<tr>
			<td>categoryName</td>
			<td><%=ebook.getCategoryName()%></td>
		</tr>
		<tr>
			<td>ebookTitle</td>
			<td><%=ebook.getEbookTitle()%></td>
		</tr>
		<tr>
			<td>ebookState</td>
			<td><%=ebook.getEbookState()%></td>
		</tr>
		<tr>
			<td>ebookAuthor</td>
			<td><%=ebook.getEbookAuthor()%></td>
		</tr>
		<tr>
			<td>ebookImg</td>
			<td><img src="<%=request.getContextPath()%>/img/default.jpg"></td>
		</tr>
		<tr>
			<td>ebookCompany</td>
			<td><%=ebook.getEbookCompany()%></td>
		</tr>
		<tr>
			<td>ebookPageCount</td>
			<td><%=ebook.getEbookPageCount()%></td>
		</tr>
		<tr>
			<td>ebookPrice</td>
			<td><%=ebook.getEbookPrice()%></td>
		</tr>
		<tr>
			<td>ebookDate</td>
			<td><%=ebook.getEbookDate()%></td>
		</tr>
		<tr>
			<td>ebookSummary</td>
			<td><%=ebook.getEbookSummary()%></td>
		</tr>

	</table>
	<div>
		<!-- InsertCartController?ebookNo - CartDao.insertCart() - redirect:CartListController -->
		<a href="<%=request.getContextPath()%>/InsertCartController?ebookNo=<%=ebook.getEbookNo()%>">
		<%
			if(session.getAttribute("loginClient") == null || !ebook.getEbookState().equals("판매중")){
		%>
				<button type="button" disabled="disabled">장바구니 추가</button>
		<%		
			} else {
		%>
				<button type="button">장바구니 추가</button>
		<%		
			}
		%>
		</a>
		<a href="<%=request.getContextPath()%>/IndexController">뒤로 가기</a>
		<!-- <button type="button" onclick="history.back()" class="float-right">Cancel</button> -->
		<!-- <a href="javascript:window.history.back();"><button type="button">뒤로가기</button></a> -->
		<!-- <button type="button" onclick="history.back()" class="btn btn-primary btn-sm float-right">Cancel</button> -->
	</div>
</body>
</html>