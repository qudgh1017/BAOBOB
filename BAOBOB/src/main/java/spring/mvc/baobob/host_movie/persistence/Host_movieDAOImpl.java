package spring.mvc.baobob.host_movie.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.HostMovieChartVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.TheaterVO;
import spring.mvc.baobob.vo.Theater_scheduleVO;
import spring.mvc.baobob.vo.Theater_seatVO;
import spring.mvc.baobob.vo.WordVO;
import spring.mvc.baobob.vo.hostTChartVO;

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
	public ArrayList<MovieVO> getMovieList() {
		ArrayList<MovieVO> vos = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vos = dao.getMovieList();
		
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

	// 영화 상세
	@Override
	public MovieVO hostMovieDetail(int movie_index) {
		MovieVO vo = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vo = dao.hostMovieDetail(movie_index);
		
		return vo;
	}

	// 영화 수정 처리
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
	public ArrayList<TheaterVO> getTheaterList() {
		ArrayList<TheaterVO> vos = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vos = dao.getTheaterList();
		
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

	// 스케줄 목록 조회
	@Override
	public ArrayList<Theater_scheduleVO> hostScheduleList(Map<String, Object> map) {
		ArrayList<Theater_scheduleVO> vos = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vos = dao.hostScheduleList(map);
		
		return vos;
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
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.checkPosTheaterCnt(schedule_start);
	}

	// 상영가능한 상영관 정보
	@Override
	public ArrayList<TheaterVO> checkPosTheater(String schedule_start) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.checkPosTheater(schedule_start);
	}
	
	// 스케줄 추가 처리
	@Override
	public int hostScheduleAddPro(Map<String, Object> map) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.hostScheduleAddPro(map);
	}

	// 스케줄 상세
	@Override
	public Theater_scheduleVO hostScheduleDetail(int theater_schedule_index) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.hostScheduleDetail(theater_schedule_index);
	}

	// 스케줄 수정 - 선택한 시간에 다른 스케줄이 있는지 확인
	@Override
	public int chkCnt(Map<String, Object> map) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.chkCnt(map);
	}

	// 스케줄 수정 처리
	@Override
	public int updateSchedule(Map<String, Object> map) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.updateSchedule(map);
	}

	// 스케줄 삭제 처리
	@Override
	public int hostScheduleDelPro(int theater_schedule_index) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.hostScheduleDelPro(theater_schedule_index);
	}

	// 직원 수
	@Override
	public int hostMovieEmpCnt() {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.hostMovieEmpCnt();
	}
	
	// 직원 목록 가져오기
	@Override
	public ArrayList<Member> hostMovieEmpList() {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.hostMovieEmpList();
	}
	
	// 직원 고용 아이디 확인
	@Override
	public int hostMovieEmpChkMemberId(String member_id) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.hostMovieEmpChkMemberId(member_id);
	}

	// 아이디로 고용할 직원 정보 가져오기
	@Override
	public Member hostMovieEmpInfo(String member_id) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.hostMovieEmpInfo(member_id);
	}

	// 고용할 직원의 아이디 state 변경
	@Override
	public int memberChangeState(String member_id) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.memberChangeState(member_id);
	}

	// 영화 직원 목록에 추가하기
	@Override
	public int insertEmp(Map<String, Object> map) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.insertEmp(map);
	}

	// 종합 포인트 등급 가져오기
	@Override
	public int getMemberPoint(String member_id) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.getMemberPoint(member_id);
	}

	// 직원 목록에서 삭제
	@Override
	public int hostMovieEmpDel(String member_id) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.hostMovieEmpDel(member_id);
	}

	// 회원 step 변경하기
	@Override
	public int updateMemberStep(Member vo) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.updateMemberStep(vo);
	}

	// 상영관의 선택한 좌석 state 불러오기
	@Override
	public int getTheaterSeatState(Map<String, Integer> map) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.getTheaterSeatState(map);
	}
	
	// 상영관의 선택한 좌석 price 불러오기
	@Override
	public int getTheaterSeatPrice(Map<String, Integer> map) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.getTheaterSeatPrice(map);
	}

	// 스케줄에 해당하는 좌석 생성
	@Override
	public int TheaterScheduleSeatAddPro(Map<String, Integer> map) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.TheaterScheduleSeatAddPro(map);
	}

	// 스케줄에 해당하는 좌석 정보 가져오기
	@Override
	public ArrayList<Theater_seatVO> hostTheaterScheduleSeatDetail(Map<String, Integer> map) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.hostTheaterScheduleSeatDetail(map);
	}

	// 영화 스케줄에 빈좌석컬럼 업데이트하기
	@Override
	public int updateEmpty_seat(int empty_seat) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.updateEmpty_seat(empty_seat);
	}

	// 장르별 영화 관람객수
	@Override
	public List<HostMovieChartVO> getMovieCountChart() {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.getMovieCountChart();
	}

	// 제한연령별 매출
	@Override
	public List<hostTChartVO> movieAgeChart() {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.movieAgeChart();
	}

	// 관람객 성별 수
	@Override
	public List<HostMovieChartVO> movieSexCountChart() {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.movieSexCountChart();
	}

	// 워드클라우드 모델을 가져옴
	@Override
	public List<WordVO> getWordCloudModel() {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.getWordCloudModel();
	}

	// 워드클라우드 단어가 존재하는지 확인
	@Override
	public int checkWordCloud(Map<String, Object> map) { //String word
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.checkWordCloud(map);
	}

	// 워드클라우드 단어 추가
	@Override
	public int addWordCloud(WordVO vo) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.addWordCloud(vo);
	}

	// 워드클라우드 단어 카운트 업데이트
	@Override
	public int updateWordCloud(WordVO vo) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.updateWordCloud(vo);
	}

	// 워드클라우드 검색
	@Override
	public List<WordVO> searchWordcloud(Map<String, Object> map) {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.searchWordcloud(map);
	}

	// 직원 고용하기 전 모든 회원 정보 불러오기
	@Override
	public ArrayList<Member> getMemberList() {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.getMemberList();
	}

	// 직원고용하기 전 회원이 1명이라도 존재하는지 체크
	@Override
	public int getMemberCnt() {
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		return dao.getMemberCnt();
	}
		
}
