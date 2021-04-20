<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 상단 메뉴 -->
<c:if test="${loginClient == null}">
		<!-- 비로그인 -->
		<div>
			<form action="${pageContext.request.contextPath}/LoginController" method="post">
				<!-- ID : <input type="text" name="clientMail" value="asankeyih@seattletimes.com">
				PW : <input type="password" name="clientPw" value="1234"> -->
				ID : <input type="text" name="clientMail">
				PW : <input type="password" name="clientPw">
				<button type="submit">로그인</button>
			</form>
			<ul>
				<!-- InsertClientController - /view/client/insertClient.jsp -->
				<li><a href="${pageContext.request.contextPath}/IndexController">홈</a></li>
				<li><a href="${pageContext.request.contextPath}/InsertClientController">회원가입</a></li>
				<li><a href="${pageContext.request.contextPath}/EbookCalendarController">ebook 달력</a></li>
			</ul>
		</div>
</c:if>

<c:if test="${loginClient != null}">
	<!-- 로그인 -->
	<div>
		<div>
			${loginClient.clientMail}님 반갑습니다.
		</div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/IndexController">홈</a></li>
			<li><a href="${pageContext.request.contextPath}/LogoutController">로그아웃</a></li>
			<!-- ClientOneController - ClientDao.selectClientOne(세션 속성 안에 clientMail) - /view/client/clientOne.jsp -->
			<li><a href="${pageContext.request.contextPath}/ClientOneController">회원정보</a></li>
			<li><a href="${pageContext.request.contextPath}/CartListController">장바구니</a></li>
			<!-- OrdersListController - OrdersDao.selectOrdersListByClient() - OrdersList.jsp -->
			<li><a href="${pageContext.request.contextPath}/OrdersListController">주문리스트</a></li>
			<li><a href="${pageContext.request.contextPath}/EbookCalendarController">ebook 달력</a></li>
		</ul>
	</div>
</c:if>