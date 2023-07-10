package city.olooe.jsp.service;

import java.util.List;

import city.olooe.jsp.domain.Reply;

public interface ReplyService {
	public Long register(Reply reply);
	
	public List<Reply> list(Long bno);
	
	public Reply get(Long rno);
	
	public int remove(Long rno);
}
