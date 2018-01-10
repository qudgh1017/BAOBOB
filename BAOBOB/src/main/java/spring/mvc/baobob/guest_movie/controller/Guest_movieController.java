package spring.mvc.baobob.guest_movie.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Guest_movieController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping("guest_movie")
	public String guest_movie() {
		log.debug("====== Guest_movieController/guest_movie ======");
		
		return "/guest/guest_movie/movie_main";
	}
	
	@RequestMapping("movieChart")
	public String movieChart() {
		log.debug("====== Guest_movieController/movieChart ======");

		return "/guest/guest_movie/movie/movieChart";
	}
	
	@RequestMapping("movieFinder")
	public String movieFinder() {
		log.debug("====== Guest_movieController/movieFinder ======");

		return "/guest/guest_movie/movie/movieFinder";
	}
	
	@RequestMapping("hdTrailer")
	public String hdTrailer() {
		log.debug("====== Guest_movieController/hdTrailer ======");

		return "/guest/guest_movie/movie/hdTrailer";
	}
	
	@RequestMapping("movieReview")
	public String movieReview() {
		log.debug("====== Guest_movieController/movieReview ======");

		return "/guest/guest_movie/movie/movieReview";
	}
	
	@RequestMapping("movieTicket")
	public String movieTicket() {
		log.debug("====== Guest_movieController/movieTicket ======");

		return "/guest/guest_movie/reservation/movieTicket";
	}
	
	@RequestMapping("movieSchedule")
	public String movieSchedule() {
		log.debug("====== Guest_movieController/movieSchedule ======");

		return "/guest/guest_movie/reservation/movieSchedule";
	}
	
	@RequestMapping("theaters")
	public String theaters() {
		log.debug("====== Guest_movieController/theaters ======");

		return "/guest/guest_movie/theater/theaters";
	}
	
	@RequestMapping("eventMembership")
	public String eventMembership() {
		log.debug("====== Guest_movieController/eventMembership ======");

		return "/guest/guest_movie/event/eventMembership";
	}
	
	@RequestMapping("eventSale")
	public String eventSale() {
		log.debug("====== Guest_movieController/eventSale ======");

		return "/guest/guest_movie/event/eventSale";
	}
	
	@RequestMapping("eventPreview")
	public String eventPreview() {
		log.debug("====== Guest_movieController/eventPreview ======");

		return "/guest/guest_movie/event/eventPreview";
	}
}
