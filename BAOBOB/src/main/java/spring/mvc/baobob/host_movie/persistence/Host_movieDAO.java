package spring.mvc.baobob.host_movie.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;

import spring.mvc.baobob.vo.HostMovieChartVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.TheaterVO;
import spring.mvc.baobob.vo.Theater_scheduleVO;
import spring.mvc.baobob.vo.Theater_seatVO;
import spring.mvc.baobob.vo.WordVO;
import spring.mvc.baobob.vo.hostTChartVO;

public interface Host_movieDAO {
	
	// 영화 갯수 구하기
	public int getMovieCnt();
	
	// 영화 전체 목록 조회(개봉일 순)
	public ArrayList<MovieVO> getMovieList();
	
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
	public ArrayList<TheaterVO> getTheaterList();
	
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
	
	// 직원 수
	public int hostMovieEmpCnt();
	
	// 직원 목록 가져오기
	public ArrayList<Member> hostMovieEmpList();
	
	// 직원 고용 아이디 확인
	public int hostMovieEmpChkMemberId(String member_id);
	
	// 아이디로 고용할 직원 정보 가져오기
	public Member hostMovieEmpInfo(String member_id);
	
	// 고용학 직원 아이디의 state 변경
	public int memberChangeState(String member_id);
	
	// 영화 직원 목록에 추가하기
	public int insertEmp(Map<String, Object> map);
	
	// 종합포인트 가져오기
	public int getMemberPoint(String member_id);
	
	// 직원 목록에서 삭제
	public int hostMovieEmpDel(String member_id);
	
	// 회원 step 수정하기
	public int updateMemberStep(Member vo);
	
	// 상영관의 선택한 좌석 state 불러오기
	public int getTheaterSeatState(Map<String, Integer> map);
	
	// 상영관의 선택한 좌석 price 불러오기
	public int getTheaterSeatPrice(Map<String, Integer> map);
	
	// 스케줄에 해당하는 좌석 생성
	public int TheaterScheduleSeatAddPro(Map<String, Integer> map);
	
	// 스케줄에 해당하는 좌석 정보 가져오기
	public ArrayList<Theater_seatVO> hostTheaterScheduleSeatDetail(Map<String, Integer> map);
	
	// 영화 스케줄에 빈좌석 업데이트하기
	public int updateEmpty_seat(int empty_seat);
	
	// 장르별 영화 관람객 수
	@MapKey("kind")
	public List<HostMovieChartVO> getMovieCountChart();
	
	// 제한 연령별 매출
	@MapKey("kind")
	public List<hostTChartVO> movieAgeChart();

	// 관람객 성별 수
	@MapKey("kind")
	public List<HostMovieChartVO> movieSexCountChart();
	
	// 워드 클라우드
	// 워드클라우드 단어가 이미 존재하는지 확인
	public int checkWordCloud(Map<String, Object> map);
	
	// 워드클라우드 단어 모델을 가져옴
	public List<WordVO> getWordCloudModel();
	
	// 분석된 워드 클라우드 단어를 추가
	public int addWordCloud(WordVO vo);
	
	// 분석된 워드 클라우드 단어수 업데이트
	public int updateWordCloud(WordVO vo);
	
	// 워드카운트 검색
	public List<WordVO> searchWordcloud(Map<String, Object> map);
}
