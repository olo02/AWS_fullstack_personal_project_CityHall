package city.olooe.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.bcrypt.BCrypt;

import com.google.gson.Gson;

import city.olooe.jsp.dao.MemberDao;
import city.olooe.jsp.domain.Member;
import city.olooe.jsp.service.MemberService;
import city.olooe.jsp.service.MemberServiceImpl;

@WebServlet("/member/findinfo")
public class FindInfo extends HttpServlet{

	private MemberService memberService = new MemberServiceImpl();
	private MemberDao memberDao = new MemberDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/findinfo.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		if(memberService.get(id, name, email) == null && memberService.get(name, email) != null) {
			Member member = memberService.get(name, email);
			out.print(member.getId());
		}
		else if(id != null && memberService.get(id, name, email) != null) {
			Member member = memberService.get(id, name, email);
			//String findPw = member.getPw().replaceAll("(?<=.{5}).", "*");
			
			// 랜덤으로 임시 비밀번호 부여
			Random random = new Random();
			String randomStr = random.ints(97, 123).limit(9)
					.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
					.toString();
			// 임시 비밀번호를 암호화하여 DB에 저장
			member.setPw(BCrypt.hashpw(randomStr, BCrypt.gensalt()));
			memberDao.updatePw(member);
			// 회원에게 임시 비밀번호 알려주기
			out.print(randomStr);
			
		}
		else {
			out.print("fail");
		}
		
		out.flush();
		
	}

}
