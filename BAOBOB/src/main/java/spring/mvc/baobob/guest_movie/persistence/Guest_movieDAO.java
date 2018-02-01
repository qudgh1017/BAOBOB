package spring.mvc.baobob.guest_movie.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieFinderVO;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.ReviewVO;
import spring.mvc.baobob.vo.TheaterVO;
import spring.mvc.baobob.vo.Theater_scheduleVO;
import spring.mvc.baobob.vo.Theater_seatVO;

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
	
	//리뷰 작성
	public int insertReview(ReviewVO review);
	
	//movieReview 추가
	public int insertMovieReview(Map<String,Object> map);
	
	//좋아요 누른 사람 수
	public String movieLike(int movie_index);
	
	//리뷰 수정
	public int updateReview(ReviewVO review);
	
	//movieReview 삭제
	public int deleteMovieReview(Map<String,Object> map);
	
	//리뷰 삭제
	public int deleteReview(int review_index);
	
	//예매 - 전체 영화 리스트(상영종료인 거 빼고)
	public ArrayList<MovieVO> getAllReserveMovies();
	
	//예매 되는 날짜 갯수
	public int getDateCnt(Map<String,Object> map);
	
	//예매 - 영화 되는 날짜, 상영관 정보
	public ArrayList<Theater_scheduleVO> getAllReserveSchedules(Map<String,Object> map);
	
	//상영관 갯수
	public int theaterCnt();
	
	//각 상영관 마다 총좌석 갯수구하기
	public int theaterSeats(int theater_index);
	
	//스케줄 정보
	public Theater_scheduleVO getSchedule(int theater_schedule_index);
	
	// 상영관 상세
	public TheaterVO theaterDetail(int theater_index);
	
	// 상영관 상세 좌석 정보
	public ArrayList<Theater_seatVO> theaterSeatDetail(Map<String,Integer> map);
	
	//선택된 한개 좌석의 정보
	public Theater_seatVO seatInfo(int seat_index);
	
	//메인 - 영화 순위
	public ArrayList<MovieVO> mainMovieRank();
	
	//메인 - 상영 중인 영화 갯수
	public int mainMovieTheaterCnt();
	
	//메인 - 상영 중인 영화
	public ArrayList<MovieVO> mainMovieTheater(Map<String, Object> map);
	
	//member 정보
	public Member getMemberInfo(String member_id);

//결제관련-----------------
	//1. 결제 테이블 추가
	public int insertHistory(String member_id);
	
	//2. 영화 결제테이블 추가
	public int insertMovieHistory(Map<String,Object> map);
	
	//3. 좌석 테이블의 seat_state 변경
	public int updateSeatState(Map<String,Object> map);
	
	//4. 스케줄테이블의 emtpy_seat 감소(결제한 만큼)
	public int updateEmptySeat(Map<String,Object> map);
	
	//5. Update movie_tbl  movie_count + totalCnt해주기(영화관람객수 증가)
	public int updateMovieCount(Map<String,Object> map);
	
	//6. Update member_tbl member_point, member_cumpoint (결제시 증가)
	public int updateIncreasePoint(Map<String,Object> map);
	
	//7. Update member_tbl member_point (포인트 사용했을시 감소)
	public int updateDecreasePoint(Map<String,Object> map);
	
	//8. SELECT member_tble에서 member_cumPoint확인
	public int getMemberCumPoint(String member_id);
	
	//9. UPDATE member_step(Service에서 if조건으로 조건 만족시 실행)
	public int updateMemberStep(Map<String,Object> map);
//결제 끝--------------
	
	//무비파인더 결과 갯수
	public int movieFinderResultCnt(MovieFinderVO movieFinderInfo);
	
	//무비파인더 결과
	public ArrayList<MovieVO> movieFinderResult(MovieFinderVO movieFinderInfo);
	
	//전체 영화 예매 수
	public int allMovieCount();
	
	//해당 영화 예매 수 
	public int indexMovieCount(int movie_index);
	
	//영화-상세정보의 wishList갯수 체크해서 하트색 결정
	public int checkWishCnt(Map<String,Object> map);
}