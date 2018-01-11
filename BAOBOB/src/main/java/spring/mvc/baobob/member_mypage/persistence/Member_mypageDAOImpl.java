package spring.mvc.baobob.member_mypage.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.BoardVO;

@Repository
public class Member_mypageDAOImpl implements Member_mypageDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//1:1문의 글갯수 구하기
	public int getArticleCnt() {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.getArticleCnt();
		
		return cnt;
	}
	
	//1:1문의글 목록 조회
	public ArrayList<BoardVO> getArticleList(Map<String, Integer> map){
		ArrayList<BoardVO> dtos = null;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		dtos = dao.getArticleList(map);
		
		return dtos;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
