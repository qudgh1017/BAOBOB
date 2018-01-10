package spring.mvc.baobob.host_movie.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface Host_movieService {
	
	// 영화 목록
	public void hostMovieList(HttpServletRequest req, Model model);

	//영화 추가 처리
	public void hostMovieAddPro(MultipartHttpServletRequest req, Model model);
}
