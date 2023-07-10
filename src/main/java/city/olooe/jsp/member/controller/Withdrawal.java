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

@WebServlet("/member/withdrawal")
public class Withdrawal extends HttpServlet {
	
	MemberService memberService = new MemberServiceImpl();

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Member member = (Member)req.getSession().getAttribute("member");
		memberService.delete(member.getId());
		req.getSession().setAttribute("member", null);
		resp.sendRedirect(req.getContextPath() + "/index");
	}
}
