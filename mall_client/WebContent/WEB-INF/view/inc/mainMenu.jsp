<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mall.client.vo.*"%>
<!-- 상단 메뉴 -->
<%
	if(session.getAttribute("loginClient") == null) {
%>
		<!-- 비로그인 -->
		<div>
			<form action="<%=request.getContextPath()%>/LoginController" method="post">
				<!-- ID : <input type="text" name="clientMail" value="asankeyih@seattletimes.com">
				PW : <input type="password" name="clientPw" value="1234"> -->
				ID : <input type="text" name="clientMail">
				PW : <input type="password" name="clientPw">
				<button type="submit">로그인</button>
			</form>
			<ul>
				<!-- InsertClientController - /view/client/insertClient.jsp -->
				<li><a href="<%=request.getContextPath()%>/InsertClientController">회원가입</a></li>
			</ul>
		</div>
<%		
	} else {
%>
		<!-- 로그인 -->
		<div>
			<div>
				<%=((Client)(session.getAttribute("loginClient"))).getClientMail()%>님 반갑습니다.
			</div>
			<ul>
				<li><a href="<%=request.getContextPath()%>/IndexController">홈</a></li>
				<li><a href="<%=request.getContextPath()%>/LogoutController">로그아웃</a></li>
				<!-- ClientOneController - ClientDao.selectClientOne(세션 속성 안에 clientMail) - /view/client/clientOne.jsp -->
				<li><a href="<%=request.getContextPath()%>/ClientOneController">회원정보</a></li>
				<li><a href="<%=request.getContextPath()%>/CartListController">장바구니</a></li>
				<li><a href="<%=request.getContextPath()%>/WithdrawController">회원탈퇴</a></li>
				<li><a href="<%=request.getContextPath()%>/UpdatePasswordController">비밀번호 수정</a></li>
			</ul>
		</div>
<%		
	}
%>