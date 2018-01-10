package spring.mvc.baobob.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.Member;

@Repository
public class MainDAOImpl implements MainDAO {

	@Autowired
	SqlSession sqlSession;

	//아이디 중복 확인
	@Override
	public int confirmId(String id) {
		System.out.println("confirmId 시작");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		int cnt = dao.confirmId(id);
		System.out.println("confirmId 종료");
		return cnt;
	}

	//가입처리
	@Override
	public int memberInsert(Member m) {
		System.out.println("memberInsert 시작");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		int cnt = dao.memberInsert(m);
		System.out.println("memberInsert 종료");
		return cnt;
	}

}
