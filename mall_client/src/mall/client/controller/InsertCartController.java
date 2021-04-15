package mall.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;
import mall.client.vo.Cart;
import mall.client.vo.Client;


@WebServlet("/InsertCartController")
public class InsertCartController extends HttpServlet {
	
	private CartDao cartDao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 유효성 검사
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		
		// request 분석
		int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
		
		// model 호출
		this.cartDao = new CartDao();
		Cart cart = new Cart();
		cart.setEbookNo(ebookNo);
		cart.setClientMail(((Client)session.getAttribute("loginClient")).getClientMail());
		
		// 장바구니 중복 검사
		if(!this.cartDao.selectClientMail(cart)) {
			System.out.println("이미 장바구니에 존재합니다.");
			response.sendRedirect(request.getContextPath()+"/EbookOneController?ebookNo="+ebookNo);
			return;
		} else {
			this.cartDao.insertCart(cart);
		}
		
		// redirect
		response.sendRedirect(request.getContextPath()+"/CartListController");
	}
}
