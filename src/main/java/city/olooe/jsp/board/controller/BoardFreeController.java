package city.olooe.jsp.board.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import city.olooe.jsp.domain.Board;
import city.olooe.jsp.domain.Criteria;
import city.olooe.jsp.domain.PageDto;
import city.olooe.jsp.service.BoardService;
import city.olooe.jsp.service.BoardServiceImpl;

import static city.olooe.jsp.util.ParamSolver.*;

@WebServlet("/board/free")
public class BoardFreeController extends HttpServlet{
	
	private BoardService boardService = new BoardServiceImpl();  
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Criteria criteria = getParams(req, Criteria.class);
		criteria.setCategory(2);
		
		req.setAttribute("boards", boardService.list(criteria));
		req.setAttribute("page", new PageDto(boardService.listCount(criteria), criteria));
		req.getRequestDispatcher("/WEB-INF/jsp/board/free.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(!isLogin(req)) {
			resp.sendRedirect(req.getContextPath() + "/member/signin?href=" + URLEncoder.encode(req.getRequestURI(), "utf-8"));
			return;
		}
		Board board = getParams(req, Board.class);
		board.setCategory(2);
		boardService.register(board);
		resp.sendRedirect("free");
		return;
	}
	
}
