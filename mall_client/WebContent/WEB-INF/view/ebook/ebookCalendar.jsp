<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
	
	<%
		// request 호출
		List<Map<String,Object>> ebookListByMonth = (List<Map<String,Object>>)request.getAttribute("ebookListByMonth");
		int currentYear = (Integer)request.getAttribute("currentYear");
		int currentMonth = (Integer)request.getAttribute("currentMonth");
		int endDay = (Integer)request.getAttribute("endDay");
		int firstDayOfWeek = (Integer)request.getAttribute("firstDayOfWeek");
		
		// 디버깅
		System.out.println("currentYear : " + currentYear);
		System.out.println("currentMonth : " + currentMonth);
		System.out.println("endDay : " + endDay);
		System.out.println("firstDayOfWeek : " + firstDayOfWeek);
		
		int preYear = currentYear;
		int preMonth = currentMonth - 1;
		
		// preMonth가 0이면 이전 년도
		if(preMonth == 0){
			preMonth = 12;
			preYear -= 1;
		}
		
		// preMonth가 1이면 다음 년도
		int nextYear = currentYear;
		int nextMonth = currentMonth + 1;

		if(nextMonth == 13){
			nextMonth = 1;
			nextYear += 1;
		}
	%>
	
	<!-- n행 7열 -->
	<div>
		<a href="<%=request.getContextPath()%>/EbookCalendarController?currentYear=<%=preYear%>&currentMonth=<%=preMonth%>"><button>이전 달</button></a>
		<span><%=currentYear%>년</span>
		<span><%=currentMonth%>월</span>
		<a href="<%=request.getContextPath()%>/EbookCalendarController?currentYear=<%=nextYear%>&currentMonth=<%=nextMonth%>"><button>다음 달</button></a>
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
			<%
				for(int i=1; i<firstDayOfWeek; i++){
			%>
					<td></td>
			<%
				}
				for(int i=1; i<=endDay; i++){
			%>            
					<td>
						<%=i%> <!-- 날짜 -->
						<%
							for(Map m : ebookListByMonth) {
								// 날짜가 동일하다면 해당 날짜의 신간 출력
								if(i == (Integer)m.get("d")) {
						%>
									<div>
										<a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=m.get("ebookNo")%>">
										<%
											String ebookTitle = (String)m.get("ebookTitle");
											if(ebookTitle.length()>10){
										%>
												<%=ebookTitle.substring(0,11)%>
										<%
											} else {
										%>
												<%=ebookTitle%>
										<%		
											}
										%>
										</a>
									</div>
						<%
								}
							}
						%>
					</td>
			<%
					if(firstDayOfWeek%7==0){
			%>               
						</tr><tr>
			<%               
					}
					firstDayOfWeek += 1;
				}
				firstDayOfWeek -= 1;
				if((firstDayOfWeek%7) != 0){
					for(int i=1; i<=7-(firstDayOfWeek%7); i++){
			%>               
			            <td></td>
			<%               
			        }
			    }
			%>

	
		</tr>
	</table>
</body>
</html>