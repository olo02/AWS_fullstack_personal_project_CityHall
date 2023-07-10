package city.olooe.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import city.olooe.jsp.service.MemberService;
import city.olooe.jsp.service.MemberServiceImpl;

@WebServlet("/member/idCheck")
public class IdCheck extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberService memberService = new MemberServiceImpl();
		PrintWriter out = resp.getWriter();
		String id = req.getParameter("id");
		
		if(memberService.get(id) == null) {
			out.print("success");
		}
		else {
			out.print("fail");
		}
		
	}	
}
