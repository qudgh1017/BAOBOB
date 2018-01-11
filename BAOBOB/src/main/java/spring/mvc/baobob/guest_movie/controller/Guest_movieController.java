package spring.mvc.baobob.guest_movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.baobob.guest_movie.service.Guest_movieService;

@Controller
public class Guest_movieController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	Guest_movieService gmservice;
	
	// 영화관 메인화면
	@RequestMapping("guest_movie")
	public String guest_movie(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/guest_movie ======");
		
		return "/guest/guest_movie/movie_main";
	}
	
	//영화-무비차트
	@RequestMapping("movieChart")
	public String movieChart(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieChart ======");

		return "/guest/guest_movie/movie/movieChart";
	}
	
	//영화-무비파인더
	@RequestMapping("movieFinder")
	public String movieFinder(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieFinder ======");

		return "/guest/guest_movie/movie/movieFinder";
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
			
			return "/guest/guest_movie/movie/movieDetail";
		}
	
	
	//영화-평점
	@RequestMapping("movieReview")
	public String movieReview(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieReview ======");
		
		return "/guest/guest_movie/movie/movieReview";
	}
	
	//예매-빠른예매
	@RequestMapping("movieTicket")
	public String movieTicket(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/movieTicket ======");

		return "/guest/guest_movie/reservation/movieTicket";
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
	
	//이벤트-멤버쉽
	@RequestMapping("eventMembership")
	public String eventMembership(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/eventMembership ======");

		return "/guest/guest_movie/event/eventMembership";
	}
	
	//이벤트-할인/제휴
	@RequestMapping("eventSale")
	public String eventSale(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/eventSale ======");

		return "/guest/guest_movie/event/eventSale";
	}
	
	//이벤트-무대인사
	@RequestMapping("eventPreview")
	public String eventPreview(HttpServletRequest req, Model model) {
		log.debug("====== Guest_movieController/eventPreview ======");

		return "/guest/guest_movie/event/eventPreview";
	}
}
