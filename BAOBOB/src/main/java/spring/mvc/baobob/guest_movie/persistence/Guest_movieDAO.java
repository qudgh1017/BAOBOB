package spring.mvc.baobob.guest_movie.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.ReviewVO;

public  interface Guest_movieDAO {

	//전체 영화갯수
	public int getMovieCnt();
	
	//movie_state에 따른 영화갯수
	public int getMovieStateCnt(Map<String,Object> map);
	
	//기본영화정보리스트
	public ArrayList<MovieVO> getAllMovies(Map<String,Object> map);
	
	//movie_state에 따른 영화리스트
	public ArrayList<MovieVO> getMovieStateMovies(Map<String,Object> map);
	
	//영화 상세정보
	public MovieVO getMovie(int movie_index);
	
	//movie_index에 따른 리뷰 갯수
	public int getMovieReviewCnt(int movie_index);
	
	//movie_index에 따른 리뷰 리스트
	public ArrayList<ReviewVO> getAllMovieReviews(Map<String,Object> map);
	
	//한아이디로 한영화에 한 리뷰만 쓸수 있음 - 썼었는지 확인
	public int movieReviewCheck(Map<String,Object> map);
	
	//review_index 불러오기
	//public String getReviewIndex(Map<String,Object> map);
	
	//리뷰 작성
	public int insertReview(ReviewVO review);
	
	//movieReview 추가
	public int insertMovieReview(Map<String,Object> map);
	
}
