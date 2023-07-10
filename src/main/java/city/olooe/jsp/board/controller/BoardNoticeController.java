package city.olooe.jsp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import city.olooe.jsp.domain.Criteria;
import city.olooe.jsp.domain.PageDto;
import city.olooe.jsp.service.BoardService;
import city.olooe.jsp.service.BoardServiceImpl;
import city.olooe.jsp.util.ParamSolver;

@WebServlet("/board/notice")
public class BoardNoticeController extends HttpServlet{
	
	private BoardService boardService = new BoardServiceImpl();  
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria criteria = ParamSolver.getParams(req, Criteria.class);
		criteria.setCategory(1);
		
		req.setAttribute("boards", boardService.list(criteria));
		req.setAttribute("page", new PageDto(boardService.listCount(criteria), criteria));
		req.getRequestDispatcher("/WEB-INF/jsp/board/notice.jsp").forward(req, resp);
	}
}
