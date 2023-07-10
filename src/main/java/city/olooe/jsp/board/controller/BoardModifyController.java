package city.olooe.jsp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import city.olooe.jsp.domain.Board;
import city.olooe.jsp.domain.Criteria;
import city.olooe.jsp.service.BoardService;
import city.olooe.jsp.service.BoardServiceImpl;
import city.olooe.jsp.util.ParamSolver;

@WebServlet("/board/modify")
public class BoardModifyController extends HttpServlet {
	private BoardService boardService = new BoardServiceImpl();  
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(ParamSolver.isMine(req, req.getParameter("writer"))) {
			resp.sendRedirect(req.getContextPath() + "/member/signin");
			return;
		}
		req.setAttribute("cri", ParamSolver.getParams(req, Criteria.class));
		req.setAttribute("board", boardService.get(Long.valueOf(req.getParameter("bno"))));
		req.getRequestDispatcher("/WEB-INF/jsp/board/modify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = ParamSolver.getParams(req, Criteria.class);
		Board board = ParamSolver.getParams(req, Board.class);
		
		boardService.modify(board);
		resp.sendRedirect("detail?bno=" + board.getBno() + "&" + cri.getFullQueryString());
	}
}
