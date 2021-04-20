package mall.client.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.EbookDao;
import mall.client.vo.Ebook;

@WebServlet("/EbookCalendarController")
public class EbookCalendarController extends HttpServlet {
	private EbookDao ebookDao; // 이 달의 신간 ebook을 불러오기 위해
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 의존객체  생성
		this.ebookDao = new EbookDao();
		
		// 년,월에 매개값으로 전달되지 않으면
		Calendar dday = Calendar.getInstance();
		
		if(request.getParameter("currentYear") != null) {
			dday.set(Calendar.YEAR, Integer.parseInt(request.getParameter("currentYear"))); // 값이 넘어오면 set
		}
		if(request.getParameter("currentMonth") != null) {
			dday.set(Calendar.MONTH, Integer.parseInt(request.getParameter("currentMonth")) - 1); // 값이 넘어오면 set
		}
		
		int currentYear = dday.get(Calendar.YEAR);
		int currentMonth = dday.get(Calendar.MONTH) + 1;

		// 마지막 일 (ex,31,30,29,28..)
		int endDay = dday.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		// 현재 달의 1일 요일
		Calendar firstDay = Calendar.getInstance();
		firstDay.set(Calendar.YEAR, currentYear);
		firstDay.set(Calendar.MONTH, currentMonth - 1);
		firstDay.set(Calendar.DATE, 1);
		int firstDayOfWeek = firstDay.get(Calendar.DAY_OF_WEEK);
		
		// 디버깅
		System.out.println("currentYear : " + currentYear);
		System.out.println("currentMonth : " + currentMonth);
		System.out.println("endDay : " + endDay);
		System.out.println("firstDayOfWeek : " + firstDay.get(Calendar.DAY_OF_WEEK));
		
		List<Map<String, Object>> ebookListByMonth = this.ebookDao.selectEbookListByMonth(currentYear, currentMonth);
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
		
		// View forward
		request.setAttribute("ebookListByMonth", ebookListByMonth);
		request.setAttribute("currentYear", currentYear);
		request.setAttribute("currentMonth", currentMonth);
		request.setAttribute("endDay", endDay);
		request.setAttribute("firstDayOfWeek", firstDayOfWeek);
		request.setAttribute("preYear", preYear);
		request.setAttribute("preMonth", preMonth);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		request.getRequestDispatcher("/WEB-INF/view/ebook/ebookCalendar.jsp").forward(request, response);
		 
	}
}
