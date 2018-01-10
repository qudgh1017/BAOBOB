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
}
