package spring.mvc.baobob.host_total.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.member_mypage.persistence.Member_mypageDAO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.ParkingFee;
import spring.mvc.baobob.vo.ParkingHistory;
import spring.mvc.baobob.vo.hostTChartVO;

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
		int cnt = 0;
		
		Host_totalDAO dao = sqlSession.getMapper(Host_totalDAO.class);
		cnt = dao.getMovieSale();
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//영화관 결산페이지(챠트)
	public List<hostTChartVO> getMovieChart(){
		List<hostTChartVO> voList = null;
		
		Host_totalDAO dao = sqlSession.getMapper(Host_totalDAO.class);
		voList =  dao.getMovieChart();
		
		return voList;
	}
	
/*----------------------------------------------------------------------------*/
	
	//식당 결산 총액 구하기
	public int getRestaurantSale() {
		int cnt = 0;
		
		Host_totalDAO dao = sqlSession.getMapper(Host_totalDAO.class);
		cnt = dao.getRestaurantSale();
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//식당 결산페이지(챠트)
	public List<hostTChartVO> getRestaurantChart(){
		List<hostTChartVO> voList = null;
		
		Host_totalDAO dao = sqlSession.getMapper(Host_totalDAO.class);
		voList = dao.getRestaurantChart();
		
		return voList;
	}
	
/*----------------------------------------------------------------------------*/

	//주차 기본 요금
	public ParkingFee getParkingFee() {
		Host_totalDAO mapper = sqlSession.getMapper(Host_totalDAO.class);
		
		ParkingFee pf =  mapper.getParkingFee();
		
		return pf;
	}
	
/*----------------------------------------------------------------------------*/
	
	//올해 납부 내역
	public ArrayList<ParkingHistory> getThisYearPayList(){
		Host_totalDAO mapper = sqlSession.getMapper(Host_totalDAO.class);
		
		ArrayList<ParkingHistory> list = mapper.getThisYearPayList();
		
		return list;
	}
	
	
	
	
	
	
	
	

}
