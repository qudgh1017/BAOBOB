package spring.mvc.baobob.android.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.guest_movie.persistence.Guest_movieDAO;
import spring.mvc.baobob.vo.Android;
import spring.mvc.baobob.vo.BoardVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.Restaurant_scheduleVO;
import spring.mvc.baobob.vo.TableVO;

public interface AndroidDAO {

	// 영화 이용 건수
	public int getUseMovieCnt(String id);

	// 식당 이용 건수
	public int getUseRestaurantCnt(String id);

	// 주차장 이용 건수
	public int getUseParkingCnt(String id);

	// 최근 10일간의 문의 내역
	public ArrayList<BoardVO> getBoardList(String id);

	// 영화 예매 내역
	public ArrayList<Android> getMemberMovieTicketing(String id);

	// 식당 이용 내역
	public ArrayList<Android> getUseRestaurantList(String id);

	// 주차 이용 내역
	public ArrayList<Android> getMemberParking(String id);

	// 회원 정보 수정
	public int anMemberUpdate(Member m);

	// 영화 정보
	public MovieVO androidMovieInfo(String movie_title);

	// 영화 목록
	public ArrayList<Android> getMovieList();

	// 식당 목록
	public ArrayList<Android> getRestaurantList();

	// 예매) 해당 날짜 상영하는 영화
	public ArrayList<Android> getMovieSchedule(String day);

	// 회원의 소지 포인트
	public int getMemberPoint(String id);

	//영화 결제) seat 변경
	public int updateSeatState(Map<String,Object> map);
	
	// 영화 결제) 영화 관람객수 증가
	public int movieCountUpdate(Map<String, Object> map);

	// 식당 메뉴 ) MainList에서
	public ArrayList<Android> getRestaurantMenu(int restaurant_index);
	
	// 식당 메뉴 ) MainPage에서
	public ArrayList<Android> getRestaurantTitleMenu(String restaurant_name);
	
	//식당 좌석 상태
	public ArrayList<Android> getRestaurantSeatState(int restIndex);
	
	//식당 예약된 좌석
	public ArrayList<Android> getRestaurantTicketSeat(Map<String, Object> map);
	
	//식당 예약 1) 스케줄 등록
	public int setRestaurantSchedule(Restaurant_scheduleVO rest);
	
	//식당 예약 2) 스케줄 등록
	public int setRestaurantTable(Map<String, Object> map);

	//식당 예약 3) 히스토리
	public int setRestaurantMainHistory(String member_id);

	//식당 예약 4) 식당 히스토리
	public int setRestaurantHistory(int restTableIndex);
}
