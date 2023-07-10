package city.olooe.jsp.service;

import java.util.List;

import city.olooe.jsp.dao.ReplyDao;
import city.olooe.jsp.domain.Reply;

public class ReplyServiceImpl implements ReplyService {
	
	private ReplyDao dao = new ReplyDao();
	
	public Long register(Reply reply) {
		return (long) dao.insert(reply);
	};
	
	public List<Reply> list(Long bno){
		return dao.selectList(bno);
	};
	
	public Reply get(Long rno) {
		return dao.selectOne(rno);
	}
	
	public int remove(Long rno) {
		return dao.delete(rno);
	};
}
