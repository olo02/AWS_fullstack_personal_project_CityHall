package city.olooe.jsp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import city.olooe.jsp.domain.Reply;
import city.olooe.jsp.service.ReplyService;
import city.olooe.jsp.service.ReplyServiceImpl;
import city.olooe.jsp.util.ParamSolver;

@WebServlet("/reply")
public class ReplyController extends HttpServlet {
	// Http Method
	// GET, POST, PUT(PATCH), DELETE

	private ReplyService replyService = new ReplyServiceImpl();

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long rno = Long.valueOf(req.getParameter("rno"));
		PrintWriter out = resp.getWriter();
		Reply reply = replyService.get(rno);
		
		if (reply != null && ParamSolver.isMine(req, reply.getWriter())) {
			out.print(replyService.remove(rno));
		}
		else {
			out.print(0);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long bno = Long.valueOf(req.getParameter("bno"));
        
        List<Reply> replies = replyService.list(bno);
        Gson gson = new Gson();
        String json = gson.toJson(replies);
        
        resp.setContentType("application/json; charset=utf8");
        resp.getWriter().print(json);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Reply reply = ParamSolver.getParams(req, Reply.class);
		replyService.register(reply);
	
	}

	
	
	
	
}
