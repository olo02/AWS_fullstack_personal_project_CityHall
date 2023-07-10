package city.olooe.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import city.olooe.jsp.domain.Member;
import city.olooe.jsp.service.MemberService;
import city.olooe.jsp.service.MemberServiceImpl;
import city.olooe.jsp.util.ParamSolver;

@WebServlet("/member/myinfo")
public class MyInfo extends HttpServlet{

	private MemberService memberService = new MemberServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("member", memberService.get(req.getParameter("id")));
		req.getRequestDispatcher("/WEB-INF/jsp/member/myinfo.jsp").forward(req, resp);
	}
	
}
