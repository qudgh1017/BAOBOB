package spring.mvc.baobob.persistence;

import spring.mvc.baobob.vo.Member;

public interface MainDAO {

	//아이디 중복 확인
	public int confirmId(String id);
	
	//가입 처리
	public int memberInsert(Member m);
}
