<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<table border="1">
		<tr>
			<td>ebookISBN</td>
			<td>${ebookOne.ebookISBN}</td>
		</tr>
		<tr>
			<td>categoryName</td>
			<td>${ebookOne.categoryName}</td>
		</tr>
		<tr>
			<td>ebookTitle</td>
			<td>${ebookOne.ebookTitle}</td>
		</tr>
		<tr>
			<td>ebookState</td>
			<td>${ebookOne.ebookState}</td>
		</tr>
		<tr>
			<td>ebookAuthor</td>
			<td>${ebookOne.ebookAuthor}</td>
		</tr>
		<tr>
			<td>ebookImg</td>
			<td><img src="${pageContext.request.contextPath}/img/default.jpg"></td>
		</tr>
		<tr>
			<td>ebookCompany</td>
			<td>${ebookOne.ebookCompany}</td>
		</tr>
		<tr>
			<td>ebookPageCount</td>
			<td>${ebookOne.ebookPageCount}</td>
		</tr>
		<tr>
			<td>ebookPrice</td>
			<td>${ebookOne.ebookPrice}</td>
		</tr>
		<tr>
			<td>ebookDate</td>
			<td>${ebookOne.ebookDate}</td>
		</tr>
		<tr>
			<td>ebookSummary</td>
			<td>${ebookOne.ebookSummary}</td>
		</tr>

	</table>
	<div>
		<!-- InsertCartController?ebookNo - CartDao.insertCart() - redirect:CartListController -->
		<a href="${pageContext.request.contextPath}/InsertCartController?ebookNo=${ebookOne.ebookNo}">
		
		<c:if test="${loginClient == null || ebookOne.ebookState ne '판매중'}">
			<button type="button" disabled="disabled">장바구니 추가</button>
		</c:if>
		
		<c:if test="${loginClient != null && ebookOne.ebookState eq '판매중'}">
			<button type="button">장바구니 추가</button>
		</c:if>

		</a>
		<a href="${pageContext.request.contextPath}/IndexController?rowPerPage=${rowPerPage}&currentPage=${currentPage}">뒤로 가기</a>
		<!-- <button type="button" onclick="history.back()" class="float-right">Cancel</button> -->
		<!-- <a href="javascript:window.history.back();"><button type="button">뒤로가기</button></a> -->
		<!-- <button type="button" onclick="history.back()" class="btn btn-primary btn-sm float-right">Cancel</button> -->
	</div>
</body>
</html>