package spring.mvc.baobob.host_movie.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
}
