package city.olooe.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import city.olooe.jsp.domain.Member;
import city.olooe.jsp.service.MemberService;
import city.olooe.jsp.service.MemberServiceImpl;
import city.olooe.jsp.util.DBConn;
import city.olooe.jsp.util.ParamSolver;

@WebServlet("/member/modifyme")
public class ModifyMe extends HttpServlet{

	private MemberService memberService = new MemberServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {//		String uri = req.getRequestURI();
//		req.getU
//		System.out.println("uri : " + uri);
//		System.out.println("uri : " + uri);
//		System.out.println("uri : " + uri);
//		System.out.println("uri : " + uri);
//		System.out.println("uri : " + uri);
//		if ("/member/modifyme".equals(uri)) {
//			modifyMe(req, resp);
//		} else if ()
		
 		req.getRequestDispatcher("/WEB-INF/jsp/member/modifyme.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Member member = ParamSolver.getParams(req, Member.class);
		memberService.modify(member);
		Member updatemember = member;
		req.getSession().setAttribute("member", updatemember);
		resp.sendRedirect(req.getContextPath() + "/member/mypage");
		return;
	}
	
	private void modifyMe(HttpServletRequest req, HttpServletResponse resp) {
		//modifyMe
	}
	
	

}
