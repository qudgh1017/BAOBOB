package spring.mvc.baobob.guest_movie.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import spring.mvc.baobob.vo.MovieResViewVO;

public interface Guest_movieService {

	//영화 메인
	public void movieMain(HttpServletRequest req, Model model);
	
	//영화리스트
	public void movieList(HttpServletRequest req, Model model);
	
	//HD-트레일러(movie_tbl)
	public void hd_Trailer(HttpServletRequest req, Model model);
	
	//상세영화 정보(+ 좋아요 갯수)
	public void movieInfo(HttpServletRequest req, Model model);
	
	//무비파인더 검색결과
	public void searchResult(HttpServletRequest req, Model model);
	
	//리뷰 리스트
	public void reviewList(HttpServletRequest req, Model model);
	
	//리뷰 썼었는지 체크
	public void movieReviewCheck(HttpServletRequest req, Model model);
	
	//리뷰작성처리
	public void movieReviewPro(HttpServletRequest req, Model model);
	
	//예매창에 띄울 영화리스트(상영종료인 거 빼고)
	public void reserveMovieList(HttpServletRequest req, Model model);
	
	//영화,상영관별 되는 날짜 
	public void reserveDateList(HttpServletRequest req, Model model);
	
	//영화 정보들(예매에서 Ajax로 받을 값들)
	public void reserveMovieResult(HttpServletRequest req, Model model);
	
	//스케줄 정보들(예매에서 Ajax로 받을 값들)
	public void reserveScheduleResult(HttpServletRequest req, Model model);

	//좌석도 보여주기
	public MovieResViewVO movieResView(HttpServletRequest req, Model model);
	
	//좌석도 선택
	public void seatSelect(HttpServletRequest req, Model model);
	
	//1 좌석 정보
	public void seatInfo(HttpServletRequest req, Model model);
	
	//선택된 좌석들의 정보를 3번째 결제창으로
	public void seatInfos(HttpServletRequest req, Model model);
	
	//예매 최종처리
	public void reservationPro(HttpServletRequest req, Model model);
}
