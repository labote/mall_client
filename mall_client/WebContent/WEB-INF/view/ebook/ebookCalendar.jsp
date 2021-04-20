<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EbookCalendar</title>
</head>
<body>
	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	
	<h1>Ebook Calendar</h1>

	<!-- n행 7열 -->
	<div>
		<a href="${pageContext.request.contextPath}/EbookCalendarController?currentYear=${preYear}&currentMonth=${preMonth}"><button>이전 달</button></a>
		<span>${currentYear}년</span>
		<span>${currentMonth}월</span>
		<a href="${pageContext.request.contextPath}/EbookCalendarController?currentYear=${nextYear}&currentMonth=${nextMonth}"><button>다음 달</button></a>
	</div>
	<table border="1">
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<tr>
			<!-- (공백 + endDay)만큼 td가 필요 -->
			<c:forEach begin="1" end="${endDay+firstDayOfWeek-1}" step="1" var="i">
				<c:if test="${(i-firstDayOfWeek+1) <= 0}">
					<td>&nbsp;</td>
				</c:if>
				
				<c:if test="${(i-firstDayOfWeek+1) > 0}">
					<td>
						<div>${i-firstDayOfWeek+1}</div>
						<div>
							<c:forEach var="m" items="${ebookListByMonth}">
								<c:if test="${(i-firstDayOfWeek+1) == m.d}">
									<div>
										<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">
											<c:if test="${m.ebookTitle.length()>10}">
												${m.ebookTitle.substring(0,10)}...
											</c:if>
											<c:if test="${m.ebookTitle.length()<=10}">
												${m.ebookTitle}
											</c:if>
										</a>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</td>
				</c:if>
				
				<c:if test="${i%7 == 0}">
					</tr><tr>
				</c:if>
			</c:forEach>
			<!-- 남은 자리를 td로 채운다 -->
			<c:if test="${(endDay+firstDayOfWeek-1)%7 != 0}">
				<c:forEach begin="1" end="${7-((endDay+firstDayOfWeek-1)%7)}" step="1" var="i">
					<td>&nbsp;</td>
				</c:forEach>
			</c:if>
		</tr>
	</table>
</body>
</html>