package mall.client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.ClientDao;
import mall.client.vo.Client;
import mall.client.vo.Ebook;

@WebServlet("/UpdateClientPwController")
public class UpdateClientPwController extends HttpServlet {
	
	ClientDao clientDao;

	// form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 유효성 검사, redirect
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
				response.sendRedirect(request.getContextPath()+"/IndexController");
				return;
		}
		
		// Dao 호출
		this.clientDao = new ClientDao();
		Client clientOne = clientDao.selectClientOne(((Client)(session.getAttribute("loginClient"))).getClientMail());
		
		// View forward
		request.setAttribute("clientOne", clientOne);
		request.getRequestDispatcher("/WEB-INF/view/client/updateClientPw.jsp").forward(request, response);
	}

	// action : C -> M -> redirect(indexController)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request 호출
		HttpSession session = request.getSession();
		String newClientPw = request.getParameter("newClientPw");
		System.out.println("newClientPw : " + newClientPw); // 디버깅
		
		// 전처리
		Client client = new Client();
		client.setClientPw(newClientPw);
		client.setClientMail(((Client)(session.getAttribute("loginClient"))).getClientMail());
		
		// model 호출
		this.clientDao = new ClientDao();
		clientDao.updateClientPw(client);
		
		// redirect
		session.invalidate();
		response.sendRedirect(request.getContextPath()+"/IndexController");
	}

}
