package city.olooe.jsp.service;

import java.util.List;

import city.olooe.jsp.domain.Member;

public interface MemberService {
	// 회원가입
	public void register(Member member);
	
	// 로그인
	public int login(String id, String pw);
	
	// 회원단일조회
	public Member get(String id);
	public Member get(String name, String email);
	public Member get(String id, String name, String email);
	
	// 회원목록 조회
//	public List<Member> getList();
	
	// 회원 정보 수정
	public void modify(Member member);
	
	// 탈퇴
	public void delete(String id);

}
