package city.olooe.jsp.service;

import java.util.List;

import city.olooe.jsp.dao.BoardDao;
import city.olooe.jsp.dao.ReplyDao;
import city.olooe.jsp.domain.Board;
import city.olooe.jsp.domain.Criteria;

public class BoardServiceImpl implements BoardService {
	
	ReplyDao replyDao = new ReplyDao();
	BoardDao dao = new BoardDao();
	
	@Override
	public Long register(Board board) {
		Long bno = (long)dao.insert(board);
		return bno;
	};

	@Override
	public Board get(Long bno) {
		dao.increaseHitCount(bno);
		return dao.selectOne(bno);
	};

	@Override
	public List<Board> list(Criteria cri) {
		return dao.selectList(cri);
	};
	
	@Override
	public int listCount(Criteria cri) {
		return dao.selectListCount(cri);
	};
	
	@Override
	public void modify(Board board) {
		dao.update(board);
	};
	
	@Override
	public void remove(Long bno) {
		replyDao.deleteAll(bno);
		dao.delete(bno);
	};
}
