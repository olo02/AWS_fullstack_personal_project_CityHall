package city.olooe.jsp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import city.olooe.jsp.domain.Criteria;
import city.olooe.jsp.service.BoardService;
import city.olooe.jsp.service.BoardServiceImpl;
import city.olooe.jsp.util.ParamSolver;

@WebServlet("/board/remove")
public class BoardRemoveController extends HttpServlet {
	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = ParamSolver.getParams(req, Criteria.class);
		boardService.remove(Long.valueOf(req.getParameter("bno")));
		String category = req.getParameter("category");
		resp.sendRedirect(category.equals("1") ? "notice" : "free" + "?" + cri.getFullQueryString());
	}
}
