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

@WebServlet("/board/detail")
public class BoardDetailController extends HttpServlet{
	
	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria criteria = ParamSolver.getParams(req, Criteria.class);
		req.setAttribute("cri", criteria);
		req.setAttribute("board", boardService.get(Long.valueOf(req.getParameter("bno"))));
		req.getRequestDispatcher("/WEB-INF/jsp/board/detail.jsp").forward(req, resp);
	}
}
