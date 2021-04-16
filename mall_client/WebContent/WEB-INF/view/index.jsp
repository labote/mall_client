<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mall.client.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<%
		// 값들을 가져온다
		List<Ebook> ebookList = (List<Ebook>)(request.getAttribute("ebookList"));
		List<String> categoryNameList = (List)(request.getAttribute("categoryNameList"));
		int currentPage = (Integer)request.getAttribute("currentPage");
		int rowPerPage = (Integer)request.getAttribute("rowPerPage");
		int totalRow = (Integer)request.getAttribute("totalRow");
		String searchTitle = (String)request.getAttribute("searchTitle");
		String categoryName = (String)request.getAttribute("categoryName");
		// 디버깅
		System.out.println("currentPage : " + currentPage);
		System.out.println("rowPerPage : " + rowPerPage);
		System.out.println("totalRow : " + totalRow);
		System.out.println("searchTitle : " + searchTitle);
		System.out.println("categoryName : " + categoryName);
	%>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 로그인/회원가입/내정보 -->
	<!-- 장바구니(세션) -->
	<!-- 캘린더(이번달에 나온 책들) -->
	<!-- 베스트셀러(주문량) -->
	<!-- 메뉴2 카테고리 -->
	<h1>index</h1>
	
	<!-- 카테고리별 목록을 볼 수 있는 네비게이션 -->
	<div>
		<a href="<%=request.getContextPath()%>/IndexController?rowPerPage=<%=rowPerPage%>">[전체]</a>
	<%
		//ArrayList<String> categoryNameList = CategoryDao.categoryNameList();
		// 페이지당 행의 수, 값이 존재하면 그 값으로 초기화
		for(String s : categoryNameList) {
	%>
		<a href="<%=request.getContextPath()%>/IndexController?categoryName=<%=s%>&rowPerPage=<%=rowPerPage%>&searchTitle=<%=searchTitle%>">[<%=s%>]</a>
	<%
		}
	%>
	</div>
	
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
		<tr>
			<%
				int i = 0;
				for(Ebook ebook : ebookList){
					i+=1;
			%>
					<td>
						<div><img src="<%=request.getContextPath()%>/img/default.jpg"></div>
						<!-- EbookOneController - EbookDao.selectEbookOne() - ebookOne.jsp -->
						<div><a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=ebook.getEbookNo()%>&currentPage=<%=currentPage%>&rowPerPage=<%=rowPerPage%>"><%=ebook.getEbookTitle()%></a></div>
						<div>￦<%=ebook.getEbookPrice()%></div>
					</td>
			<%		
					if(i%5==0){
			%>
						</tr><tr>
			<%			
					}
				}
			%>
		</tr>
	</table>
	<form action="<%=request.getContextPath()%>/IndexController" method="get">
		<input type="hidden" name="categoryName" value="<%=categoryName%>">
		SearchTitle :
		<input type="text" name="searchTitle">
		<button type="submit">검색</button>
	</form>
	<%
		if(currentPage > 1){
	%>
	<%-- 	<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage-1%>&rowPerPage=<%=rowPerPage%>&searchWord=<%=searchWord%>"><button class="btn btn-primary btn-sm"><i class="align-middle" data-feather="chevrons-left"></i></button></a> --%>			
			<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage-1%>&rowPerPage=<%=rowPerPage%>&searchTitle=<%=searchTitle%>"><button type="button">이전</button></a>
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
			<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage+1%>&rowPerPage=<%=rowPerPage%>&searchTitle=<%=searchTitle%>"><button type="button">다음</button></a>
	<%
		}
	%>
</body>
</html>