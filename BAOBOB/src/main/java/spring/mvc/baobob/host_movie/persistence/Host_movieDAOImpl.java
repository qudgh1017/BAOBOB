package spring.mvc.baobob.host_movie.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.TheaterVO;
import spring.mvc.baobob.vo.Theater_seatVO;

@Repository
public class Host_movieDAOImpl implements Host_movieDAO {
	
	@Autowired
	public SqlSession sqlSession;
	
	// 영화 갯수 구하기
	@Override
	public int getMovieCnt() {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.getMovieCnt();
		
		return cnt;
	}
	
	// 영화 전체 목록 조회(개봉일 순)
	@Override
	public ArrayList<MovieVO> getMovieList(Map<String, Integer> map) {
		ArrayList<MovieVO> vos = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vos = dao.getMovieList(map);
		
		System.out.println("vos : " + vos);
		
		return vos;
	}
	
	// 영화 추가 처리
	@Override
	public int hostMovieAddPro(MovieVO vo) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.hostMovieAddPro(vo);
		
		return cnt;
	}

	// 영화 삭제 처리
	@Override
	public int hostMovieDel(int movie_index) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.hostMovieDel(movie_index);
		
		return cnt;
	}

	@Override
	public MovieVO hostMovieDetail(int movie_index) {
		MovieVO vo = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vo = dao.hostMovieDetail(movie_index);
		
		return vo;
	}

	@Override
	public int hostMovieModPro(MovieVO vo) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.hostMovieModPro(vo);
		
		return cnt;
	}

	// 상영관 존재 여부
	@Override
	public int theater_index_check(int theater_index) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.theater_index_check(theater_index);
		
		return cnt;
	}

	// 상영관 추가
	@Override
	public int insert_theater(Map<String, Object> map) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.insert_theater(map);
		
		return cnt;
	}

	// 상영관 좌석별 state
	@Override
	public int insert_theater_seat(Map<String, Object> map) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.insert_theater_seat(map);
		
		return cnt;
	}

	// 상영관 존재 여부
	@Override
	public int getTheaterCnt() {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.getTheaterCnt();
		
		return cnt;
	}

	// 상영관 리스트
	@Override
	public ArrayList<TheaterVO> getTheaterList(Map<String, Integer> map) {
		ArrayList<TheaterVO> vos = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vos = dao.getTheaterList(map);
		
		return vos;
	}

	// 상영관 상세
	@Override
	public TheaterVO hostTheaterDetail(int theater_index) {
		TheaterVO vo = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vo = dao.hostTheaterDetail(theater_index);
		
		return vo;
	}

	// 상영관 상세 좌석 정보
	@Override
	public ArrayList<Theater_seatVO> hostTheaterSeatDetail(int theater_index) {
		ArrayList<Theater_seatVO> vos = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vos = dao.hostTheaterSeatDetail(theater_index);
		
		return vos;
	}
	
	// 상영관 좌석 수정 처리
	@Override
	public int modify_theater_seat(Map<String, Object> map) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.modify_theater_seat(map);
		
		return cnt;
	}

	// 상영관 삭제 처리
	@Override
	public int hostTheaterDel(int theater_index) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.hostTheaterDel(theater_index);
		
		return cnt;
	}

	// 상영관 좌석 삭제 처리
	@Override
	public int hostTheaterSeatDel(int theater_index) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.hostTheaterSeatDel(theater_index);
		
		return cnt;
	}

	// 상영중인 영화 정보
	@Override
	public ArrayList<MovieVO> getMovieING() {
		ArrayList<MovieVO> vos = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vos = dao.getMovieING();
		
		return vos;
	}

	// 모든 상영관 정보
	@Override
	public ArrayList<TheaterVO> getTheaterAllList() {
		ArrayList<TheaterVO> vos = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vos = dao.getTheaterAllList();
		
		return vos;
	}
	
	// 상영가능한 상영관 count
	@Override
	public int checkPosTheaterCnt(String schedule_start) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.checkPosTheaterCnt(schedule_start);
		
		return cnt;
	}

	// 상영가능한 상영관 정보
	@Override
	public ArrayList<TheaterVO> checkPosTheater(String schedule_start) {
		ArrayList<TheaterVO> vos = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vos = dao.checkPosTheater(schedule_start);
		
		return vos;
	}
	
	// 스케줄 추가 처리
	@Override
	public int hostScheduleAddPro(Map<String, Object> map) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.hostScheduleAddPro(map);
		
		return cnt;
	}

	

	



	

	
}
