package spring.mvc.baobob.guest_movie.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Guest_movieController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping("movie_mainG")
	public String movie_mainG() {
		log.debug("====== Guest_movieController/movie_mainG ======");
		
		return "/guest/guest_movie/movie_main";
	}
}
