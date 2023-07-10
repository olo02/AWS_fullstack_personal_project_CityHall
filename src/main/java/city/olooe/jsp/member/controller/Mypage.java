package city.olooe.jsp.member.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import city.olooe.jsp.service.MemberService;
import city.olooe.jsp.service.MemberServiceImpl;

@WebServlet("/member/mypage")
public class Mypage extends HttpServlet{
	
	private MemberService memberService = new MemberServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/mypage.jsp").forward(req, resp);
	}
	
	
	public static void main(String[] args) {
		MemberService memberService = new MemberServiceImpl();
		
		memberService.get("olooe");
	}
}
