package spring.mvc.baobob.guest_movie.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.baobob.guest_movie.service.Guest_movieService;
import spring.mvc.baobob.host_movie.service.Host_movieServiceImpl;
import spring.mvc.baobob.vo.MovieResViewVO;
import spring.mvc.baobob.vo.Theater_seatVO;

@Controller
public class Guest_movieController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	Guest_movieService gmservice;
	
	@Autowired
	Host_movieServiceImpl hmservice;
	
	// 영화관 메인화면
	@RequestMapping("guest_movie")
	public String guest_movie(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/guest_movie ======");
		
		gmservice.movieMain(req, model);
		
		return "/guest/guest_movie/movie_main";
	}
	
	//영화관 메인 Ajax
	@RequestMapping("gMovieMainRankUpdate")
	public String gMovieMainRankUpdate(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/gMovieMainRankUpdate ======");
		gmservice.movieMain(req, model);
		return "guest/guest_movie/movie_main_rank";
	}
	
	// 로그인이 필요한 서비스 일때
	@RequestMapping("loginCheck")
	public String loginCheck(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/guest_movie ======");
		
		return "/guest/guest_movie/movie/loginCheck";
	}
	
	//영화-무비차트
	@RequestMapping("movieChart")
	public String movieChart(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieChart ======");
		
		gmservice.movieList(req, model);

		return "/guest/guest_movie/movie/movieChart";
	}
	
	//영화-무비파인더
	@RequestMapping("movieFinder")
	public String movieFinder(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieFinder ======");
		
		gmservice.movieList(req, model);
		
		return "/guest/guest_movie/movie/movieFinder";
	}
	
	//영화-무비파인더
	@RequestMapping("searchResult")
	public String searchResult(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/searchResult ======");
		
		gmservice.searchResult(req, model);
		
		return "/guest/guest_movie/movie/searchResult";
	}
	
	//영화-HD-트레일러
	@RequestMapping("hdTrailer")
	public String hdTrailer(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/hdTrailer ======");

		gmservice.hd_Trailer(req, model);
		
		return "/guest/guest_movie/movie/hdTrailer";
	}
	
	//영화-HD트레일러 실행하는 상세 페이지
	@RequestMapping("hdTrailerPlaying")
	public String hdTrailerPlaying(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/hdTrailerPlaying ======");

		gmservice.movieInfo(req, model);
		
		return "/guest/guest_movie/movie/hdTrailerPlaying";
	}
	
	//상세영화
	//영화-HD트레일러 실행하는 상세 페이지
	@RequestMapping("movieDetail")
	public String movieDetail(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieDetail ======");

		gmservice.movieInfo(req, model);
		gmservice.reviewList(req, model);
		
		return "/guest/guest_movie/movie/movieDetail";
	}
	
	//영화-평점
	@RequestMapping("movieReview")
	public String movieReview(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieReview ======");
		
		return "/guest/guest_movie/movie/movieReview";
	}
	
	//영화-리뷰작성폼
	@RequestMapping("movieReviewWrite")
	public String reviewWrite(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieReviewWrite ======");
		
		gmservice.movieReviewCheck(req, model);
		gmservice.movieInfo(req, model);
		
		return "/guest/guest_movie/movie/movieReviewWrite";
	}
	
	//영화-리뷰수정폼
	@RequestMapping("movieReviewModify")
	public String movieReviewModify(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieReviewModify ======");
		
		int review_index = Integer.parseInt(req.getParameter("review_index"));
		System.out.println("review_index: "+review_index);
		model.addAttribute("review_index",review_index);
		gmservice.movieInfo(req, model);
		
		return "/guest/guest_movie/movie/movieReviewModify";
	}
	
	//영화-리뷰 작성, 수정, 삭제처리
	@RequestMapping("movieReviewPro")
	public String movieReviewPro(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieReviewPro ======");
		
		int pro = Integer.parseInt(req.getParameter("pro"));
		gmservice.movieReviewPro(req, model);
		if(pro == 1) {
			hmservice.wordAnalyzer(req, model);
		}
		
		return "/guest/guest_movie/movie/movieReviewPro";
	}
	
	//예매-빠른예매
	@RequestMapping("movieTicket")
	public String movieTicket(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieTicket ======");

		gmservice.reserveMovieList(req, model);
		
		return "/guest/guest_movie/reservation/movieTicket";
	}
	
	//예매-빠른예매(영화,날짜선택시 - ajax 처리 =>dateResult로 )
	@RequestMapping("dateResult")
	public String dateResult(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/dateResult ======");
		
		gmservice.reserveDateList(req, model);
		
		return "/guest/guest_movie/reservation/dateResult";
	}
	
	//예매선택한 영화정보
	@RequestMapping("reserveMovieInfo")
	public String reserveMovieInfo(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/reserveMovieInfo ======");
		
		gmservice.reserveMovieResult(req, model);
		
		return "/guest/guest_movie/reservation/reserveMovieInfo";
	}
	
	//예매선택한 영화정보
	@RequestMapping("reserveScheduleInfo")
	public String reserveScheduleInfo(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/reserveScheduleInfo ======");
		
		gmservice.reserveScheduleResult(req, model);
		
		return "/guest/guest_movie/reservation/reserveScheduleInfo";
	}
	
	//다음페이지 선택하는 버튼(movie_index, theater_schedule_index);
	@RequestMapping("nextSeatButton")
	public String nextSeatButton(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/nextSeatButton ======");
		
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index"));
		model.addAttribute("movie_index", movie_index);
		model.addAttribute("theater_schedule_index", theater_schedule_index);
		
		return "/guest/guest_movie/reservation/nextSeatButton";
	}
	
	//예매-빠른예매 2번째페이지 - 좌석 선택
	@RequestMapping("movieTicket2")
	public String movieTicket2(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieTicket2 ======");

		//예매 선택한 영화, 스케줄정보
		gmservice.reserveMovieResult(req, model);
		gmservice.reserveScheduleResult(req, model);
		
		return "/guest/guest_movie/reservation/movieTicket2";
	}
	
	//예매-빠른예매 2번째페이지 - 좌석도 정보 불러오기
	@RequestMapping("seatInfo")
	public @ResponseBody MovieResViewVO seatInfo(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/seatInfo ======");

		//좌석도 정보
		MovieResViewVO seatInfo = null;
		seatInfo = gmservice.movieResView(req, model);
		//ResponseBody로 자바 객체를 송신해준다. 
		
		return seatInfo;
	}
	
	//예매-빠른예매 2번째페이지 - 좌석 선택
	@RequestMapping("reserveSeatInfo")
	public String reserveSeatInfo(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/reserveSeatInfo ======");
 
		int allCnt = Integer.parseInt(req.getParameter("allCnt"));
		model.addAttribute("allCnt", allCnt);
		gmservice.seatSelect(req, model);
		
		return "/guest/guest_movie/reservation/reserveSeatInfo";
	}
	
	//예매-빠른예매 2번째페이지 - 선택한 좌석 정보
	@RequestMapping("selectSeatInfo")
	public String selectSeatInfo(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/selectSeatInfo ======");
 
		gmservice.seatInfo(req, model);
		
		return "/guest/guest_movie/reservation/selectSeatInfo";
	}
	
	
	//예매-빠른예매 2번째페이지 - 결제창
	@RequestMapping("movieTicket3")
	public String movieTicket3(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieTicket3 ======");
		
		gmservice.seatInfos(req, model);
		
		return "/guest/guest_movie/reservation/movieTicket3";
	}
	
	//예매-빠른예매 3번째페이지 - 포인트 사용 값 바꿔주기
	@RequestMapping("pointUse")
	public @ResponseBody int pointUse(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/pointUse ======");

		//사용가능한 포인트
		int pointSalePrice = Integer.parseInt(req.getParameter("point"));
		//ResponseBody로 자바 객체를 송신해준다. 
		
		return pointSalePrice;
	}
	
	//예매 최종 처리하는 곳
	@RequestMapping("reservationMoviePro")
	public String reservationMoviePro(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/reservationMoviePro ======");

		gmservice.reservationPro(req, model);
		
		return "/guest/guest_movie/reservation/reservationMoviePro";
	}
	
	//예매-상영시간표
	@RequestMapping("movieSchedule")
	public String movieSchedule(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieSchedule ======");

		return "/guest/guest_movie/reservation/movieSchedule";
	}
	
	//극장-특별관
	@RequestMapping("theaters")
	public String theaters(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/theaters ======");

		return "/guest/guest_movie/theater/theaters";
	}
	
}
