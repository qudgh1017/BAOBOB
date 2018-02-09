package spring.mvc.baobob.android.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.Android;
import spring.mvc.baobob.vo.BoardVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieVO;

public interface AndroidDAO {

	//영화 이용 건수
	public int getUseMovieCnt(String id);
	
	//식당 이용 건수
	public int getUseRestaurantCnt(String id);
	
	//주차장 이용 건수
	public int getUseParkingCnt(String id);
	
	//최근 10일간의 문의 내역
	public ArrayList<BoardVO> getBoardList(String id);
	
	//영화 예매 내역
	public ArrayList<Android> getMemberMovieTicketing(String id);


	//식당 이용 내역
	public ArrayList<Android> getUseRestaurantList(String id);

	
	//주차 이용 내역
	public ArrayList<Android> getMemberParking(String id);
	
	//회원 정보 수정
	public int anMemberUpdate(Member m);
	
	//영화 정보
	public MovieVO androidMovieInfo(String movie_title);

	//영화 목록
	public ArrayList<Android> getMovieList();
	
	//식당 목록
	public ArrayList<Android> getRestaurantList();
	
	//예매) 해당 날짜 상영하는 영화
	public ArrayList<Android> getMovieSchedule(String day);
	
	//회원의 소지 포인트
	public int getMemberPoint(String id);
	
	// 영화 결제) 영화 관람객수 증가
	public int movieCountUpdate(Map<String, Object> map);
}
