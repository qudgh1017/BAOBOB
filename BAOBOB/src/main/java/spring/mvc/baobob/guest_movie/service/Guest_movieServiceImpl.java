package spring.mvc.baobob.guest_movie.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.baobob.guest_movie.persistence.Guest_movieDAO;
import spring.mvc.baobob.vo.MovieVO;

@Service
public class Guest_movieServiceImpl implements Guest_movieService{

	@Autowired
	Guest_movieDAO gmdao;

	//기본 영화리스트
	@Override
	public void movieList(HttpServletRequest req, Model model) {
		
	}

	//상영중인 영화리스트
	@Override
	public void playingMovieList(HttpServletRequest req, Model model) {
		
	}

	//HD-트레일러
	@Override
	public void hd_Trailer(HttpServletRequest req, Model model) {
		
		int pageSize = 8; 		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재 페이지 글의 시작번호
		int end = 0;			// 현재 페이지 글의 마지막번호
		int number = 0;			// 출력할 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작페이지
		int endPage = 0;		// 마지막 페이지
		
		// 영화 갯수 구하기
		cnt = gmdao.getMovieCnt();
		System.out.println("영화갯수: " + cnt);
		 
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) { //페이지가 없으면 
			pageNum = "1"; //첫페이지를 1페이지로 설정
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재페이지
		
		// pageCount = (12 / 5) + (1) // 나머지2건이 1페이지로 할당되므로 총 3페이지가 된다.
		pageCount = (cnt / pageSize) + ((cnt % pageSize > 0) ? 1 : 0); // 페이지 갯수(나머지가 있으면=> 페이지 갯수+1)
		
		start = ((currentPage-1) * pageSize) + 1; // 현재 페이지에  DB에서 뽑아올 시작번호
		
		end = start + pageSize - 1;// 현재 페이지에 DB에서 뽑아올 끝번호
		//end = currentPage * pageSize;
		
		/*System.out.println("start: " + start);
		System.out.println("end: " + end);*/
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호(삭제해도 글번호 나열되게).. 최신글 (큰페이지)가 1p 
		/*System.out.println("number: " + number);
		System.out.println("cnt: " + cnt);
		System.out.println("currentPage: " + currentPage);
		System.out.println("pageSize: " + pageSize);*/

		if(cnt > 0) {
			//게시글 목록 조회
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<MovieVO> movies = gmdao.getAllMovies(map);
			model.addAttribute("movies", movies); //큰 바구니 : 게시글 목록   cf)작은바구니: 게시글 1건
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1; //(5/3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock; // (5%3) == 0 
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);			// 글갯수
		model.addAttribute("number", number);		// 글번호
		model.addAttribute("pageNum", pageNum);	// 페이지번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage);// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);// 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);// 페이지 갯수
			model.addAttribute("currentPage", currentPage);// 현재 페이지
		}
	}

	@Override
	public void hd_TrailerPlaying(HttpServletRequest req, Model model) {
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		
		MovieVO movie = gmdao.getMovie(movie_index);
		
		System.out.println(movie.getMovie_trailer());
		if(movie != null) {
			model.addAttribute("movie",movie);
		}
		
		
	}
	
}
