package spring.mvc.baobob.guest_movie.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.host_movie.persistence.Host_movieDAO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieFinderVO;
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

	//메인 - 영화 순위
	public ArrayList<MovieVO> mainMovieRank(){
		Guest_movieDAO mapper = sqlSession.getMapper(Guest_movieDAO.class);
		ArrayList<MovieVO> list = mapper.mainMovieRank();
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
	public ArrayList<MovieVO> mainMovieTheater(Map<String, Object> map) {
		Guest_movieDAO mapper = sqlSession.getMapper(Guest_movieDAO.class);
		ArrayList<MovieVO> list = mapper.mainMovieTheater(map);
		return list;
	}
	
	//멤버정보
	@Override
	public Member getMemberInfo(String member_id) {
		Member member = null;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		member = gmdao.getMemberInfo(member_id);
		
		return member;
	}
//결제------------
	//1. Insert history_tbl
	@Override
	public int insertHistory(String member_id) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.insertHistory(member_id);
		
		return cnt;
	}
	
	//2. Insert movie_history_tbl
	@Override
	public int insertMovieHistory(Map<String, Object> map) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.insertMovieHistory(map);
		
		return cnt;
	}

	//3. Update theater_seat_tbl 해당 seat_index의 seat_state=6 변경(좌석 상태 예약석으로 변경)
	@Override
	public int updateSeatState(Map<String,Object> map) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.updateSeatState(map);
		
		return cnt;
	}

	//4. Update theater_schedule_tbl schedule_empty_seat= -totalCnt해주기(빈자리수 감소)
	@Override
	public int updateEmptySeat(Map<String, Object> map) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.updateEmptySeat(map);
		
		return cnt;
	}

	//5. Update movie_tbl  movie_count + totalCnt해주기(영화관람객수 증가)
	@Override
	public int updateMovieCount(Map<String, Object> map) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.updateMovieCount(map);
		
		return cnt;
	}

	//6. Update member_tbl member_point, member_cumpoint (결제시 증가)
	@Override
	public int updateIncreasePoint(Map<String, Object> map) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.updateIncreasePoint(map);
		
		return cnt;
	}

	//7. Update member_tbl member_point (포인트 사용했을시 감소)
	@Override
	public int updateDecreasePoint(Map<String, Object> map) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.updateDecreasePoint(map);
		
		return cnt;
	}

	//8. SELECT member_tble에서 member_cumPoint확인
	@Override
	public int getMemberCumPoint(String member_id) {
		int member_cumPoint = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		member_cumPoint = gmdao.getMemberCumPoint(member_id);
		
		return member_cumPoint;
	}

	//9. UPDATE member_step 8번 확인해서 if문으로 체크해서 등업!!
	@Override
	public int updateMemberStep(Map<String, Object> map) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.updateMemberStep(map);
		
		return cnt;
	}
// 결제끝

	//무비파인더 검색 결과 갯수
	@Override
	public int movieFinderResultCnt(MovieFinderVO movieFinderInfo) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.movieFinderResultCnt(movieFinderInfo);
		
		return cnt;
	}
	
	//무비파인더 검색 결과
	@Override
	public ArrayList<MovieVO> movieFinderResult(MovieFinderVO movieFinderInfo) {
		ArrayList<MovieVO> movies;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		movies = gmdao.movieFinderResult(movieFinderInfo);
		
		return movies;
	}

	//전체 영화 예매 수
	@Override
	public int allMovieCount() {
		int sum = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		sum = gmdao.allMovieCount();
		
		return sum;
	}

	//해당 영화 예매 수
	@Override
	public int indexMovieCount(int movie_index) {
		int cnt = 0;
		
		Guest_movieDAO gmdao = sqlSession.getMapper(Guest_movieDAO.class);
		cnt = gmdao.indexMovieCount(movie_index);
		
		return cnt;
	}

	
}
