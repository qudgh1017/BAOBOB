package spring.mvc.baobob.host_total.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.ParkingFee;
import spring.mvc.baobob.vo.ParkingHistory;
import spring.mvc.baobob.vo.hostTChartVO;

public interface Host_totalDAO {
	
	//회원수 구하기
	public int getMemCnt();
	
	//회원 목록 구하기
	public ArrayList<Member> getMemList(Map<String, Integer> map);
	
	//회원 추가
	public int insertMember(Member vo);
	
	// 아이디 중복 확인
	public int confirmId(String id);
	
	//회원정보 가져오기
	public Member getMemberInfo(String strId);
	
	//회원정보 수정 처리
	public int hostTMemModifyPro(Member vo);
	
	//회원삭제 처리
	public int hostTMemDelPro(String strId);
	
	//영화관 결산 총액 구하기
	public int getMovieSale();
	
	//영화관 결산페이지(챠트)
	public List<hostTChartVO> getMovieChart();
	
	//식당 결산 총액 구하기
	public int getRestaurantSale();
	
	//식당 결산페이지(챠트)
	public List<hostTChartVO> getRestaurantChart();
	
	//주차 기본 요금
	public ParkingFee getParkingFee();
	
	//올해 납부 내역
	public ArrayList<ParkingHistory> getThisYearPayList();
		
}
