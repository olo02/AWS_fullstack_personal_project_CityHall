package city.olooe.jsp.service;


import org.mindrot.bcrypt.BCrypt;

import city.olooe.jsp.dao.BoardDao;
import city.olooe.jsp.dao.MemberDao;
import city.olooe.jsp.dao.ReplyDao;
import city.olooe.jsp.domain.Member;

public class MemberServiceImpl implements MemberService {
	
	private MemberDao dao = new MemberDao();
	private BoardDao boardDao = new BoardDao();
	private ReplyDao replyDao = new ReplyDao();
	
	// 회원가입
	@Override
	public void register(Member member) {
		member.setPw(BCrypt.hashpw(member.getPw(), BCrypt.gensalt()));
		dao.insert(member);
	}
	
	// 로그인
	@Override
	public int login(String id, String pw) {
		Member member = dao.selectOne(id);
		
		if(member == null) {
			return 2; // 아이디 없음
		}
		else if(!BCrypt.checkpw(pw, member.getPw())) {
			return 3; // 비밀번호 틀림
		}
		else {
			return 1; // 성공
		}
	}
	
	// 회원단일조회
	@Override
	public Member get(String id) {
		return dao.selectOne(id);
	};
	
	@Override
	public Member get(String name, String email) {
		return dao.selectOne(name, email);
	};

	@Override
	public Member get(String id, String name, String email) {
		return dao.selectOne(id, name, email);
	};
	
	// 회원목록 조회
//	public List<Member> getList() {
//		return list;
//	};
	
	
	//회원정보 수정
	@Override
	public void modify(Member member) {
		member.setPw(BCrypt.hashpw(member.getPw(), BCrypt.gensalt()));;
		dao.update(member);
	}
	
	
	
	// 탈퇴
	@Override
	public void delete(String id) {
		
//		작성한 게시글 아이디 변경
		boardDao.update(id);
		
//		작성한 댓글 아이디 변경
		replyDao.update(id);

//		회원 테이블 내에서 삭세
		dao.delete(id);
		
		
	};
	
	
	
	
	
	
	
	
	public static void main(String[] args) {
		MemberDao dao = new MemberDao();

		dao.selectList().forEach(member -> {
			member.setPw(BCrypt.hashpw(member.getPw(), BCrypt.gensalt()));
			dao.updatePw(member);
		});
	}

}
