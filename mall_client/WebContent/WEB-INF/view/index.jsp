<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 로그인/회원가입/내정보 -->
	<!-- 장바구니(세션) -->
	<!-- 캘린더(이번달에 나온 책들) -->
	<!-- 베스트셀러(주문량) -->
	<!-- 메뉴2 카테고리 -->
	<h1>index</h1>
	
	<!-- 카테고리별 목록을 볼 수 있는 네비게이션 -->
	<div>
		<a href="${pageContext.request.contextPath}/IndexController?rowPerPage=${rowPerPage}">[전체]</a>
		<c:forEach var="s" items="${categoryNameList}">
			<a href="${pageContext.request.contextPath}/IndexController?categoryName=${s}&rowPerPage=${rowPerPage}&searchTitle=${searchTitle}">[${s}]</a>
		</c:forEach>
	</div>
	
	<!-- 몇 페이지씩 보여줄 지 결정해주는 페이지 -->
	<form action="${pageContext.request.contextPath}/IndexController" method="get">
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
	<!-- best ebook 상품 출력 -->
	<h3>Best ebook</h3>
	<table border="1">
		<tr>
			<c:forEach var="m" items="${bestOrdersList}">
				<td>
					<div><img src="${pageContext.request.contextPath}/img/default.jpg"></div>
					<!-- EbookOneController - EbookDao.selectEbookOne() - ebookOne.jsp -->
					<div><a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${m.ebookTitle}></a></div>
					<div>￦${m.ebookPrice}</div>
				</td>
			</c:forEach>
		</tr>
	</table>
	<!-- ebook 상품 출력 -->
	<h3>Ebook List</h3>
 	<table border="1">
		<tr>
			<c:set var="i" value="0"></c:set>
			<c:forEach var="ebook" items="${ebookList}">
				<c:set var="i" value="${i+1}"></c:set>
				<td>
					<div><img src="${pageContext.request.contextPath}/img/default.jpg"></div>
					<!-- EbookOneController - EbookDao.selectEbookOne() - ebookOne.jsp -->
					<div><a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${ebook.ebookNo}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${ebook.ebookTitle}</a></div>
					<div>￦${ebook.ebookPrice}</div>
				</td>
				<c:if test="${i%5==0}">
					</tr><tr>
				</c:if>
			</c:forEach>
		</tr>
	</table>
	<form action="${pageContext.request.contextPath}/IndexController" method="get">
		<input type="hidden" name="categoryName" value="${categoryName}">
		SearchTitle :
		<input type="text" name="searchTitle">
		<button type="submit">검색</button>
	</form>
	
	<c:if test="${currentPage > 1}">
	<%--	<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage-1%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>"><button class="btn btn-primary btn-sm"><i class="align-middle" data-feather="chevrons-left"></i></button></a> --%>			
			<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}&searchTitle=${searchTitle}"><button type="button">이전</button></a>
	</c:if>
	
	<c:if test="${totalRow % rowPerPage != 0}">
		<c:set var="lastPage" value="${rowPerPage + 1}"></c:set>
	</c:if>
	
	<c:if test="${currentPage < lastPage}">
	<%--	<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage+1%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>"><button class="btn btn-primary btn-sm"><i class="align-middle" data-feather="chevrons-right"></i></button></a> --%>
			<a href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}&searchTitle=${searchTitle}"><button type="button">다음</button></a>
	</c:if>
</body>
</html>