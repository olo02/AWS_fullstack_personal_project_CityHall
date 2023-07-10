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

@WebServlet("/member/signin")
public class Signin extends HttpServlet{
	
	private MemberService memberService = new MemberServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/signin.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		
		String msg = "";
		
		switch(memberService.login(id, pw)) {
		case 1 :
			req.getSession().setAttribute("member", memberService.get(id));
			resp.sendRedirect(req.getContextPath() + "/index");
			break;
		case 2 :
			msg = "일치하는 아이디가 없습니다.";
			msg = URLEncoder.encode(msg, "utf-8");
			resp.sendRedirect(req.getContextPath() + "/member/signin?msg=" + msg);
			break;
		case 3 :
			msg = "비밀번호를 다시 입력해 주세요.";
			msg = URLEncoder.encode(msg, "utf-8");
			resp.sendRedirect(req.getContextPath() + "/member/signin?msg=" + msg);
		}
	}
	
	public static void main(String[] args) {
		MemberService memberService = new MemberServiceImpl();
		
		memberService.get("olooe");
	}
}
