package spring.mvc.baobob.android.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.Android;
import spring.mvc.baobob.vo.BoardVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieVO;

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

	// 영화 결제) 영화 관람객수 증가
	@Override
	public int movieCountUpdate(Map<String, Object> map) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int cnt = mapper.movieCountUpdate(map);
		return cnt;
	}
}
