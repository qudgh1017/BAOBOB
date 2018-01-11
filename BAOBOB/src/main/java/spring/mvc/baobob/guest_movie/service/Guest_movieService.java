package spring.mvc.baobob.guest_movie.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Guest_movieService {

	//기본 영화정보
	public void movieList(HttpServletRequest req, Model model);
	
	//상영중인 영화리스트(+예매정보)
	public void playingMovieList(HttpServletRequest req, Model model);
	
	//HD-트레일러(movie_tbl)
	public void hd_Trailer(HttpServletRequest req, Model model);
	
	//HD-트레일러(movie_tbl) 실행 
	public void hd_TrailerPlaying(HttpServletRequest req, Model model);
	
}
