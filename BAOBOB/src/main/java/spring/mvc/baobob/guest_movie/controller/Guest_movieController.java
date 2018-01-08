package spring.mvc.baobob.guest_movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Guest_movieController {

	@RequestMapping("movie_mainG")
	public String movie_mainG() {
		System.out.println("movie_mainG");
		
		return "/guest/guest_movie/movie_main";
	}
}
