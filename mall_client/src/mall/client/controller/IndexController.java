package mall.client.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.CategoryDao;
import mall.client.model.EbookDao;
import mall.client.vo.Ebook;

// C -> M -> V
@WebServlet("/IndexController")
public class IndexController extends HttpServlet {
	private EbookDao ebookDao;
	private CategoryDao categoryDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request 분석
		int currentPage = 1; // 현페 페이지
		if(request.getParameter("currentPage") != null) { // 현재페이지를 받아온다.
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int rowPerPage = 10; // 페이지당 행의 개수
		if(request.getParameter("rowPerPage") != null) { // rowPerPage가 존재한다면 받아온다.
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		
		int beginRow = (currentPage-1) * rowPerPage; // 시작 행
		
		String searchTitle = ""; // 검색할 제목
		if(request.getParameter("searchTitle") != null) {
			searchTitle = request.getParameter("searchTitle");
		}
		
		String categoryName = ""; // 카테고리
		if(request.getParameter("categoryName") != null) {
			categoryName = request.getParameter("categoryName");
		}
		
		System.out.println("currentPage : " + currentPage);
		System.out.println("rowPerPage : " + rowPerPage);
		System.out.println("searchTitle : " + searchTitle);
		System.out.println("categoryName : " + categoryName);
		
		// model 호출
		this.ebookDao = new EbookDao();
		this.categoryDao = new CategoryDao();
		List<Ebook> ebookList = this.ebookDao.selectEbookListByPage(beginRow, rowPerPage, searchTitle, categoryName);
		List<String> categoryNameList = this.categoryDao.categoryNameList();
		int totalRow = ebookDao.totalCount(searchTitle, categoryName);
		System.out.println("totalRow : " + totalRow);
		
		// View forward
		request.setAttribute("ebookList", ebookList);
		request.setAttribute("categoryNameList", categoryNameList);
		request.setAttribute("rowPerPage", rowPerPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("searchTitle", searchTitle);
		request.setAttribute("categoryName", categoryName);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/index.jsp");
		rd.forward(request, response);
	}
}
