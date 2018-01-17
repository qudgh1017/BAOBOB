package spring.mvc.baobob.host_total.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.member_mypage.persistence.Member_mypageDAO;
import spring.mvc.baobob.vo.Member;

@Repository
public class Host_totalDAOImpl implements Host_totalDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
/*----------------------------------------------------------------------------*/
	
	//회원수 구하기
	public int getMemCnt() {
		int cnt = 0;
		
		Host_totalDAO dao = sqlSession.getMapper(Host_totalDAO.class);
		cnt = dao.getMemCnt();
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원 목록 구하기
	public ArrayList<Member> getMemList(Map<String, Integer> map){
		ArrayList<Member> dtos = null;
		
		Host_totalDAO dao = sqlSession.getMapper(Host_totalDAO.class);
		dtos = dao.getMemList(map);
		
		return dtos;
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원 추가
	public int insertMember(Member vo) {
		int cnt = 0;
		
		Host_totalDAO dao = sqlSession.getMapper(Host_totalDAO.class);
		cnt = dao.insertMember(vo);
				
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	// 아이디 중복 확인
	@Override
	public int confirmId(String id) {
		int cnt = 0;
		
		Host_totalDAO dao = sqlSession.getMapper(Host_totalDAO.class);
		cnt = dao.confirmId(id);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원정보 가져오기
	public Member getMemberInfo(String strId) {
		Member vo = new Member();
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		vo = dao.getMemberInfo(strId);
		
		return vo;
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원정보 수정 처리
	public int hostTMemModifyPro(Member vo) {
		int cnt = 0;
		
		Host_totalDAO dao = sqlSession.getMapper(Host_totalDAO.class);
		cnt = dao.hostTMemModifyPro(vo);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원삭제 처리
	public int hostTMemDelPro(String strId) {
		int cnt = 0;
		
		Host_totalDAO dao = sqlSession.getMapper(Host_totalDAO.class);
		cnt = dao.hostTMemDelPro(strId);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//영화관 결산 총액 구하기
	public int getMovieSale() {
		System.out.println("결산다오");
		int cnt = 0;
		
		Host_totalDAO dao = sqlSession.getMapper(Host_totalDAO.class);
		cnt = dao.getMovieSale();
		
		System.out.println("총액:" + cnt);
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//영화관 결산페이지(챠트)
	public Map<String,Integer> getMovieChart(){
		Map<String,Integer> m = null;
		
		Host_totalDAO dao = sqlSession.getMapper(Host_totalDAO.class);
		
		m = new HashMap<String,Integer>();
		m.put("janre1",0);
		m.put("janre2",0);
		m.put("janre3",0);
		m.put("janre4",0);
		m.put("janre5",0);
		m.put("janre6",0);
		m.put("janre7",0);
		m.put("janre8",0);
		m.put("janre9",0);
		m.put("janre10",0);
		
		m = dao.getMovieChart();
		
		System.out.println("챠트:" + m);
		return m;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
