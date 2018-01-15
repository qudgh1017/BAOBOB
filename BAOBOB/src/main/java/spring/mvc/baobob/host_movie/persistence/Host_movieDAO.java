package spring.mvc.baobob.host_movie.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.TheaterVO;
import spring.mvc.baobob.vo.Theater_scheduleVO;
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
	
	// 스케줄 목록 조회
	public ArrayList<Theater_scheduleVO> hostScheduleList(Map<String, Object> map);
	
	// 상영중인 영화 정보
	public ArrayList<MovieVO> getMovieING();
	
	// 모든 상영관 정보
	public ArrayList<TheaterVO> getTheaterAllList();
	
	// 상영 가능 상영관 count
	public int checkPosTheaterCnt(String schedule_start);
	
	// 선택한시간에 정보가 없는 상영 가능한 상영관 가져오기
	public ArrayList<TheaterVO> checkPosTheater(String schedule_start);
	
	// 스케줄 추가 처리
	public int hostScheduleAddPro(Map<String, Object> map);
	
	// 스케줄 상세
	public Theater_scheduleVO hostScheduleDetail(int theater_schedule_index);
	
	// 스케줄 수정 - 선택한 시간에 다른 스케줄이 있는지 확인
	public int chkCnt(Map<String, Object> map);
	
	// 스케줄 수정 처리
	public int updateSchedule(Map<String, Object> map);
	
	// 스케줄 삭제 처리
	public int hostScheduleDelPro(int theater_schedule_index);
	
	// 직원 고용 아이디 확인
	public int hostMovieEmpChkMemberId(String member_id);
	
	// 아이디로 고용할 직원 정보 가져오기
	public Member hostMovieEmpInfo(String member_id);
	
	// 고용학 직원 아이디의 state 변경
	public int memberChangeState(String member_id);
	
	// 영화 직원 목록에 추가하기
	public int insertEmp(Map<String, Object> map);
}
