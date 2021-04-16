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
		// 값들 가져온다
		List<Map<String,Object>> ordersList = (List<Map<String,Object>>)(request.getAttribute("ordersList"));
		int currentPage = (Integer)request.getAttribute("currentPage");
		int rowPerPage = (Integer)request.getAttribute("rowPerPage");
		int totalRow = (Integer)request.getAttribute("totalRow");
		String searchTitle = (String)request.getAttribute("searchTitle");
		
		// 디버깅
		System.out.println("currentPage : " + currentPage);
		System.out.println("rowPerPage : " + rowPerPage);
		System.out.println("totalRow : " + totalRow);
		System.out.println("searchTitle : " + searchTitle);
	%>
	
	<h1>OrdersList</h1>
	<!-- 몇 페이지씩 보여줄 지 결정해주는 페이지 -->
	<form action="<%=request.getContextPath()%>/IndexController" method="get">
		<select name="rowPerPage">
		<%
			for(int i=10; i<31; i+=5){
				if(rowPerPage == i){
		%>
					<option value="<%=i%>" selected="selected"><%=i%></option>
		<%			
				} else {
		%>
					<option value="<%=i%>"><%=i%></option>
		<%			
				}
			}
		%>
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
			<%
				for(Map<String,Object> m : ordersList){
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
		<form action="<%=request.getContextPath()%>/OrdersListController" method="get">
		SearchTitle :
		<input type="text" name="searchTitle">
		<button type="submit">검색</button>
	</form>
	<%
		if(currentPage > 1){
	%>
	<%-- 	<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage-1%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>"><button class="btn btn-primary btn-sm"><i class="align-middle" data-feather="chevrons-left"></i></button></a> --%>			
			<a href="<%=request.getContextPath()%>/OrdersListController?currentPage=<%=currentPage-1%>&rowPerPage=<%=rowPerPage%>&searchTitle=<%=searchTitle%>"><button type="button">이전</button></a>
	<%
		}
			
		int lastPage = totalRow / rowPerPage; // 마지막 페이지 초기화
			
		if(totalRow % rowPerPage != 0){ // 나머지가 있으면 한 페이지 추가
			lastPage += 1;
		}
		System.out.println("lastPage : " + lastPage); // 라스트 페이지 잘 나오는지 디버깅
						
		if(currentPage < lastPage){
	%>
			<%-- <a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage+1%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>"><button class="btn btn-primary btn-sm"><i class="align-middle" data-feather="chevrons-right"></i></button></a> --%>
			<a href="<%=request.getContextPath()%>/OrdersListController?currentPage=<%=currentPage+1%>&rowPerPage=<%=rowPerPage%>&searchTitle=<%=searchTitle%>"><button type="button">다음</button></a>
	<%
		}
	%>
</body>
</html>