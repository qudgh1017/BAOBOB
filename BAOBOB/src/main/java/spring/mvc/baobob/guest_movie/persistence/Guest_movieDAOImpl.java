package spring.mvc.baobob.guest_movie.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.host_movie.persistence.Host_movieDAO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.ReviewVO;
import spring.mvc.baobob.vo.TheaterVO;
import spring.mvc.baobob.vo.Theater_scheduleVO;
import spring.mvc.baobob.vo.Theater_seatVO;

@Repository
public class Guest_movieDAOImpl implements Guest_movieDAO{

	@Autowired
	public SqlSession sqlSession;

	//전체 영화갯수
	@Override
	public int getMovieCnt() {
		int cnt = 0;

		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.getMovieCnt();
		
		return cnt;
	}
	
	//movie_state에 따른 영화갯수
	@Override
	public int getMovieStateCnt(Map<String, Object> map) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.getMovieStateCnt(map);
		
		return cnt;
	}

	//기본영화정보
	@Override
	public ArrayList<MovieVO> getAllMovies(Map<String,Object> map) {
		ArrayList<MovieVO> movies = null;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		movies = gmdao.getAllMovies(map);
		
		return movies;
	}
	
	//movie_state에 따른 영화리스트
	@Override
	public ArrayList<MovieVO> getMovieStateMovies(Map<String, Object> map) {
		ArrayList<MovieVO> movies = null;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		movies = gmdao.getMovieStateMovies(map);
		
		return movies;
	}

	//영화상세정보
	@Override
	public MovieVO getMovie(int movie_index) {
		MovieVO movie = null;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		movie = gmdao.getMovie(movie_index);
		
		return movie;
	}
	
	//movie_index에 따른 리뷰 갯수
	@Override
	public int getMovieReviewCnt(int movie_index) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.getMovieReviewCnt(movie_index);
		
		return cnt;
	}

	//movie_index에 따른 리뷰 리스트
	@Override
	public ArrayList<ReviewVO> getAllMovieReviews(Map<String, Object> map) {
		ArrayList<ReviewVO> reviews = null;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		reviews = gmdao.getAllMovieReviews(map);
		
		return reviews;
	}

	//한아이디로 한영화에 한 리뷰만 쓸수 있음 - 썼었는지 확인
	@Override
	public int movieReviewCheck(Map<String, Object> map) {
		int cnt =0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.movieReviewCheck(map);
		
		return cnt;
	}
	
	//review 추가
	@Override
	public int insertReview(ReviewVO review) {
		int cnt = 0;

		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.insertReview(review);
		
		return cnt;
	}

	//movieReview 추가
	@Override
	public int insertMovieReview(Map<String,Object> map) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.insertMovieReview(map);
		
		return cnt;
	}

	//좋아요 누른 사람 수
	@Override
	public String movieLike(int movie_index) {
		String likeCnt = "0";
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		likeCnt = gmdao.movieLike(movie_index);
		
		return likeCnt;
	}

	//리뷰수정
	@Override
	public int updateReview(ReviewVO review) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.updateReview(review);
		
		return cnt;
	}

	// movieReview 삭제 
	@Override
	public int deleteMovieReview(Map<String, Object> map) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.deleteMovieReview(map);
		return cnt;
	}

	//리뷰 삭제
	@Override
	public int deleteReview(int review_index) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.deleteReview(review_index);
		
		return cnt;
	}

	//예매 - 전체 영화 리스트(상영종료인 거 빼고)
	@Override
	public ArrayList<MovieVO> getAllReserveMovies() {
		ArrayList<MovieVO> movies = null;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		movies = gmdao.getAllReserveMovies();
		
		return movies;
	}

	//예매되는 날짜
	@Override
	public int getDateCnt(Map<String,Object> map) {
		int cnt = 0;

		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.getDateCnt(map);
		
		return cnt;
	}

	//예매 - 영화 되는 날짜, 상영관 정보
	@Override
	public ArrayList<Theater_scheduleVO> getAllReserveSchedules(Map<String,Object> map) {
		ArrayList<Theater_scheduleVO> schedules = null;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		schedules = gmdao.getAllReserveSchedules(map);
		
		return schedules;
	}

	//상영관 갯수
	@Override
	public int theaterCnt() {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.theaterCnt();
		
		return cnt;
	}
	
	//각 상영관 마다의 총좌석 갯수 구하기
	@Override
	public int theaterSeats(int theater_index) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.theaterSeats(theater_index);
		
		return cnt;
	}

	//스케줄 정보
	@Override
	public Theater_scheduleVO getSchedule(int theater_schedule_index) {
		Theater_scheduleVO schedule = null;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		schedule = gmdao.getSchedule(theater_schedule_index);
		
		return schedule;
	}

	// 상영관 상세
	@Override
	public TheaterVO theaterDetail(int theater_index) {
		TheaterVO theater = null;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		theater = gmdao.theaterDetail(theater_index);
		
		return theater;
	}
	
	// 상영관 상세 좌석 정보
	@Override
	public ArrayList<Theater_seatVO> theaterSeatDetail(Map<String,Integer> map) {
		ArrayList<Theater_seatVO> seats = null;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		seats = gmdao.theaterSeatDetail(map);
		
		return seats;
	}

	//선택된 한개의 좌석 정보
	@Override
	public Theater_seatVO seatInfo(int seat_index) {
		Theater_seatVO seat = null;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		seat = gmdao.seatInfo(seat_index);
		
		return seat;
	}
	


	

	

	
}
