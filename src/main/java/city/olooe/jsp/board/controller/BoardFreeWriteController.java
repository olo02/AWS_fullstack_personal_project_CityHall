package city.olooe.jsp.board.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import city.olooe.jsp.domain.Board;
import city.olooe.jsp.service.BoardService;
import city.olooe.jsp.service.BoardServiceImpl;
import static city.olooe.jsp.util.ParamSolver.*;

@WebServlet("/board/freewrite")
@MultipartConfig(maxRequestSize = 10 * 1024 * 1024, fileSizeThreshold = 8 * 1024)
public class BoardFreeWriteController extends HttpServlet{
	
	private BoardService boardService = new BoardServiceImpl();  
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if(!isLogin(req)) {
			resp.sendRedirect(req.getContextPath() + "/member/signin?href=" + URLEncoder.encode(req.getRequestURI(), "utf-8"));
			return;
		}
		req.getRequestDispatcher("/WEB-INF/jsp/board/freewrite.jsp").forward(req, resp);
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
