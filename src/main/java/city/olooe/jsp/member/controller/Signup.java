package city.olooe.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import city.olooe.jsp.domain.Member;
import city.olooe.jsp.service.MemberService;
import city.olooe.jsp.service.MemberServiceImpl;
import city.olooe.jsp.util.ParamSolver;


@WebServlet("/member/signup")
public class Signup extends HttpServlet{
	
	private MemberService memberService = new MemberServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/signup.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Member member = ParamSolver.getParams(req, Member.class);
		
		memberService.register(member);
		
		resp.sendRedirect(req.getContextPath() + "/index");
		return;
	}
	

	
}
