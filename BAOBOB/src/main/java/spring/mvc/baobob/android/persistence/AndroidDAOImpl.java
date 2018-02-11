package spring.mvc.baobob.android.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.guest_movie.persistence.Guest_movieDAO;
import spring.mvc.baobob.vo.Android;
import spring.mvc.baobob.vo.BoardVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.Restaurant_scheduleVO;
import spring.mvc.baobob.vo.TableVO;

@Repository
public class AndroidDAOImpl implements AndroidDAO {

	@Autowired
	SqlSession sqlSession;

	// 영화 이용 건수
	@Override
	public int getUseMovieCnt(String id) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int cnt = mapper.getUseMovieCnt(id);
		return cnt;
	}

	// 식당 이용 건수
	@Override
	public int getUseRestaurantCnt(String id) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int cnt = mapper.getUseRestaurantCnt(id);
		return cnt;
	}

	// 주차장 이용 건수
	@Override
	public int getUseParkingCnt(String id) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int cnt = mapper.getUseParkingCnt(id);
		return cnt;
	}

	// 최근 10일간의 문의 내역
	@Override
	public ArrayList<BoardVO> getBoardList(String id) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		ArrayList<BoardVO> list = mapper.getBoardList(id);
		return list;
	}

	// 영화 예매 내역
	@Override
	public ArrayList<Android> getMemberMovieTicketing(String id) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		ArrayList<Android> list = mapper.getMemberMovieTicketing(id);
		;
		return list;
	}

	// 식당 이용 내역
	@Override
	public ArrayList<Android> getUseRestaurantList(String id) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		ArrayList<Android> list = mapper.getUseRestaurantList(id);
		return list;
	}

	// 주차 이용 내역
	@Override
	public ArrayList<Android> getMemberParking(String id) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		ArrayList<Android> list = mapper.getMemberParking(id);
		return list;
	}

	// 회원 정보 수정
	@Override
	public int anMemberUpdate(Member m) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int cnt = mapper.anMemberUpdate(m);
		return cnt;
	}

	// 영화 정보
	@Override
	public MovieVO androidMovieInfo(String movie_title) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		MovieVO movie = mapper.androidMovieInfo(movie_title);
		return movie;
	}

	// 메인 - 영화 목록
	@Override
	public ArrayList<Android> getMovieList() {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		ArrayList<Android> list = mapper.getMovieList();
		return list;
	}

	// 메인 - 식당 목록(index)
	@Override
	public ArrayList<Android> getRestaurantList() {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		ArrayList<Android> list = mapper.getRestaurantList();
		return list;
	}

	// 예매) 해당 날짜 상영하는 영화
	@Override
	public ArrayList<Android> getMovieSchedule(String day) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		ArrayList<Android> list = mapper.getMovieSchedule(day);
		return list;
	}

	// 회원의 소지 포인트
	@Override
	public int getMemberPoint(String id) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int point = mapper.getMemberPoint(id);
		return point;
	}

	// 영화 결제) seat 변경
	@Override
	public int updateSeatState(Map<String, Object> map) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int cnt = mapper.updateSeatState(map);
		return cnt;
	}

	// 영화 결제) 영화 관람객수 증가
	@Override
	public int movieCountUpdate(Map<String, Object> map) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int cnt = mapper.movieCountUpdate(map);
		return cnt;
	}

	// 식당 메뉴
	public ArrayList<Android> getRestaurantMenu(int restaurant_index) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		ArrayList<Android> list = mapper.getRestaurantMenu(restaurant_index);
		return list;
	}

	// 식당 좌석 상태
	public ArrayList<Android> getRestaurantSeatState(int restIndex) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		ArrayList<Android> list = mapper.getRestaurantSeatState(restIndex);
		return list;
	}

	// 식당 좌석
	public ArrayList<Android> getRestaurantSeat(Map<String, Object> map) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		ArrayList<Android> list = mapper.getRestaurantSeat(map);
		return list;
	}

	// 식당 예약 1) 스케줄 등록
	public int setRestaurantSchedule(Restaurant_scheduleVO rest) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int cnt = mapper.setRestaurantSchedule(rest);
		return cnt;
	}

	// 식당 예약 2) 스케줄 등록
	public int restaurantTableUpdate(TableVO restTable) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int cnt = mapper.restaurantTableUpdate(restTable);
		return cnt;
	}

	// 식당 예약 3) 히스토리
	public int setRestaurantMainHistory(String member_id) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int cnt = mapper.setRestaurantMainHistory(member_id);
		return cnt;
	}

	// 식당 예약 4) 식당 히스토리
	public int setRestaurantHistory(int restTableIndex) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int cnt = mapper.setRestaurantHistory(restTableIndex);
		return cnt;
	}
}
