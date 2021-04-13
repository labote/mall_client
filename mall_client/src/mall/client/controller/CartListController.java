package mall.client.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;
import mall.client.vo.*;

@WebServlet("/CartListController")
public class CartListController extends HttpServlet {
	private CartDao cartDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 유효성 검사, redirect
		HttpSession s = request.getSession();
		if(s.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		
		// Dao호출
		this.cartDao = new CartDao();
		List<Map<String,Object>> cartList = this.cartDao.selectCartList(((Client)(s.getAttribute("loginClient"))).getClientMail());
		
		// View forward
		request.setAttribute("cartList", cartList);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/cart/cartList.jsp");
		rd.forward(request, response);
	}

}
