package spring.mvc.baobob.guest_movie.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.ReviewVO;
import spring.mvc.baobob.vo.Theater_scheduleVO;

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
	
	//review_index 불러오기
	/*@Override
	public String getReviewIndex(Map<String,Object> map) {
		String review_index = null;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		//review_index = gmdao.getReviewIndex(map);
		
		if(gmdao.getReviewIndex(map)==null) {
			review_index="0";
		}else {
			review_index = gmdao.getReviewIndex(map);
		}
		
		return review_index;
	}*/

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

	//메인 - 영화 순위
	public ArrayList<String> mainMovieRank(){
		Guest_movieDAO mapper = sqlSession.getMapper(Guest_movieDAO.class);
		ArrayList<String> list = mapper.mainMovieRank();
		return list;
	}

	//메인 - 상영 중인 영화 갯수
	public int mainMovieTheaterCnt() {
		Guest_movieDAO mapper = sqlSession.getMapper(Guest_movieDAO.class);
		int cnt = mapper.mainMovieTheaterCnt();
		return cnt;
	}
	
	//메인 - 예매 영화
	@Override
	public ArrayList<String> mainMovieTheater(Map<String, Object> map) {
		Guest_movieDAO mapper = sqlSession.getMapper(Guest_movieDAO.class);
		ArrayList<String> list = mapper.mainMovieTheater(map);
		return list;
	}
	

	

	
}
