package spring.mvc.baobob.host_movie.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.vo.MovieResViewVO;

public interface Host_movieService {
	
	// 영화 목록
	public void hostMovieList(HttpServletRequest req, Model model);

	//영화 추가 처리
	public void hostMovieAddPro(MultipartHttpServletRequest req, Model model);
	
	// 영화 삭제
	public void hostMovieDel(HttpServletRequest req, Model model);
	
	// 영화 상세
	public void hostMovieDetail(HttpServletRequest req, Model model);
	
	// 영화 수정
	public void hostMovieModPro(MultipartHttpServletRequest req, Model model);
	
	// 상영관 리스트
	public void hostTheaterList(HttpServletRequest req, Model model);
	
	// 상영관 좌석 업데이트
	public void hostTheaterAddPro(HttpServletRequest req, Model model);
	
	// 상영관 상세
	public void hostTheaterDetail(HttpServletRequest req, Model model);
	
	// 상영관 수정 처리
	public void hostTheaterModPro(HttpServletRequest req, Model model);
	
	// 상영관 삭제 처리
	public void hostTheaterDel(HttpServletRequest req, Model model);
	
	// 스케줄 목록
	public void hostScheduleList(HttpServletRequest req, Model model);
	
	// 스케줄 검색
	public void hostScheduleSearch(HttpServletRequest req, Model model);
	
	// 스케줄 추가 폼 영화 정보와 상영관 정보 가져오기
	public void hostScheduleAddForm(HttpServletRequest req, Model model);
	
	// 상영가능한 상영관 확인
	public void checkPosTheater(HttpServletRequest req, Model model);
	
	// 상영관 추가 처리
	public void hostScheduleAddPro(HttpServletRequest req, Model model);
	
	// 스케줄 상세 정보 가져오기
	public void hostScheduleDetail(HttpServletRequest req, Model model);
	
	// 스케줄 수정 처리
	public void hostScheduleModPro(HttpServletRequest req, Model model);
	
	// 스케줄 삭제 처리
	public void hostScheduleDelPro(HttpServletRequest req, Model model);
	
	// 직원 목록
	public void hostMovieEmp(HttpServletRequest req, Model model);
	
	// 직원 고용 아이디 확인
	public void hostMovieEmpChkMemberId(HttpServletRequest req, Model model);
	
	// 직원 고용 처리
	public void hostMovieEmpAddPro(HttpServletRequest req, Model model);
	
	// 직원 해고
	public void hostMovieEmpDel(HttpServletRequest req, Model model);
	
	// 예매 상세
	public void hostTheaterScheduleDetail(HttpServletRequest req, Model model);
	
	// 예매 상세
	public MovieResViewVO hostMovieResView(HttpServletRequest req, Model model);
	
	// 장르별 영화 비울
	public void movieJanreCountChart(HttpServletRequest req, Model model);
	
	// 제한 연령별 매출
	public void movieAgeChart(HttpServletRequest req, Model model);

	// 관람객 성별 매출
	public void movieSexCountChart(HttpServletRequest req, Model model);
}
