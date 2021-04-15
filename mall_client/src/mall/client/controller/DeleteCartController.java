package mall.client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;
import mall.client.model.EbookDao;
import mall.client.vo.Ebook;

@WebServlet("/DeleteCartController")
public class DeleteCartController extends HttpServlet {
	CartDao cartDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 유효성 검사, redirect
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
				response.sendRedirect(request.getContextPath()+"/IndexController");
				return;
		}
		
		// request 호출
		request.setCharacterEncoding("UTF-8");
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		System.out.println("cartNo : " + cartNo);
		
		// model 호출
		this.cartDao = new CartDao();
		this.cartDao.deleteCart(cartNo);
		
		// redirect
		response.sendRedirect(request.getContextPath()+"/CartListController");
	}
}
