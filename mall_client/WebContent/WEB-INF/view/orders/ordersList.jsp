<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<h1>OrdersList</h1>
	<!-- 몇 페이지씩 보여줄 지 결정해주는 페이지 -->
	<form action="${pageContext.request.contextPath}/OrdersListController" method="get">
		<select name="rowPerPage">
			<c:forEach begin="10" end="30" var="i" step="5">
				<c:if test="${rowPerPage == i}">
					<option value="${i}" selected="selected">${i}</option>
				</c:if>
				<c:if test="${rowPerPage != i}">
					<option value="${i}">${i}</option>
				</c:if>
			</c:forEach>
		</select>
		<button type="submit">보기</button>
	</form>
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
			<c:forEach var="m" items="${ordersList}">
				<tr>
					<td>${m.ordersNo}</td>
					<td>${m.ebookNo}</td>
					<td>${m.ordersDate}</td>
					<td>${m.ordersState}</td>
					<td>${m.ebookTitle}</td>
					<td>${m.ebookPrice}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<form action="${pageContext.request.contextPath}/OrdersListController" method="get">
		SearchTitle :
		<input type="text" name="searchTitle">
		<button type="submit">검색</button>
	</form>
	
	<c:if test="${currentPage>1}">
		<%-- 	<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage-1%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>"><button class="btn btn-primary btn-sm"><i class="align-middle" data-feather="chevrons-left"></i></button></a> --%>			
		<a href="${pageContext.request.contextPath}/OrdersListController?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}&searchTitle=${searchTitle}"><button type="button">이전</button></a>
	</c:if>
	
	<c:if test="${totalRow%rowPerPage != 0}">
		<c:set var="lastPage" value="${lastPage+1}"></c:set>
	</c:if>
	
	<c:if test="${currentPage<lastPage}">
		<%-- <a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage+1%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>"><button class="btn btn-primary btn-sm"><i class="align-middle" data-feather="chevrons-right"></i></button></a> --%>
		<a href="${pageContext.request.contextPath}/OrdersListController?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}&searchTitle=${searchTitle}"><button type="button">다음</button></a>
	</c:if>
</body>
</html>