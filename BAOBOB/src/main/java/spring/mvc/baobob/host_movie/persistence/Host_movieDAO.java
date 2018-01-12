package spring.mvc.baobob.host_movie.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.TheaterVO;
import spring.mvc.baobob.vo.Theater_seatVO;

public interface Host_movieDAO {
	
	// 영화 갯수 구하기
	public int getMovieCnt();
	
	// 영화 전체 목록 조회(개봉일 순)
	public ArrayList<MovieVO> getMovieList(Map<String, Integer> map);
	
	// 영화 추가 처리
	public int hostMovieAddPro(MovieVO vo);
	
	// 영화 삭제 처리
	public int hostMovieDel(int movie_index);
	
	// 영화 상세
	public MovieVO hostMovieDetail(int movie_index);
	
	// 영화 수정 처리
	public int hostMovieModPro(MovieVO vo);
	
	// 상영관 존재 여부
	public int theater_index_check(int theater_index);
	
	// 상영관 추가하기
	public int insert_theater(Map<String, Object> map);
	
	// 상영관 좌석별 state 넣기
	public int insert_theater_seat(Map<String, Object> map);
	
	// 상영관 존재 여부
	public int getTheaterCnt();
	
	// 상영관 목록 조회
	public ArrayList<TheaterVO> getTheaterList(Map<String, Integer> map);
	
	// 상영관 상세
	public TheaterVO hostTheaterDetail(int theater_index);
	
	// 상영관 상세 좌석 정보
	public ArrayList<Theater_seatVO> hostTheaterSeatDetail(int theater_index);
	
	// 상영관 좌석 수정 처리
	public int modify_theater_seat(Map<String, Object> map);
	
	// 상영관 삭제 처리
	public int hostTheaterDel(int theater_index);
	
	// 상영관 좌석 삭제 처리
	public int hostTheaterSeatDel(int theater_index);
	
	
}
