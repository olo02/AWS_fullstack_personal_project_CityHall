package city.olooe.jsp.service;

import java.util.List;

import city.olooe.jsp.domain.Board;
import city.olooe.jsp.domain.Criteria;

public interface BoardService {
	//C
	public Long register(Board board);

	//R : 단일
	public Board get(Long bno);
	
	//R : 전체
	public List<Board> list(Criteria cri);
	public int listCount(Criteria cri);
	
	//U
	public void modify(Board board);
	
	//D
	public void remove(Long bno);
}
