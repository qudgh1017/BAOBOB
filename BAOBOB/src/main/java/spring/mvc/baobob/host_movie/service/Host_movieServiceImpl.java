package spring.mvc.baobob.host_movie.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.host_movie.persistence.Host_movieDAO;
import spring.mvc.baobob.host_movie.persistence.Host_movieDAOImpl;
import spring.mvc.baobob.vo.MovieVO;

@Service
public class Host_movieServiceImpl implements Host_movieService{
	
	@Autowired
	Host_movieDAO dao = new Host_movieDAOImpl();

	// 영화 목록
	@Override
	public void hostMovieList(HttpServletRequest req, Model model) {
		int pageSize = 10;		//한 페이지당 출력할 게시글 갯수
		int pageBlock = 3;		//한 블럭당 페이지 갯수
		
		int cnt = 0;			// 게시글 갯수
		int start = 0;			// 현재 페이지 게시글 시작 번호
		int end = 0;			// 현재 페이지 게시글 마지막 번호
		int number = 0;			// 출력할 게시글 번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작페이지
		int endPage = 0;		// 마지막 페이지
		
		// 글갯수 구하기
		cnt = dao.getMovieCnt();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; //첫페이지를 1페이지로 설정
		}
		
		currentPage = Integer.parseInt(pageNum);// 현재페이지
		System.out.println("currentPage : "+ currentPage);
		
		// pageCnt = 12 / 5 + 1; //나머지 2건이 1페이지로 할당되므로 3페이지
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 갯수
		System.out.println("pageCount : "+ pageCount);
		
		// 1 = (1-1) * 5 + 1
		// 6 = (2-1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;// 현재 페이지 게시글 시작 번호
	
		// 5 = (1 + 5 - 1)
		end = start + pageSize -1;//현재 페이지 게시글 마지막 번호
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		if(end > cnt) end = cnt;
		
		//  = 25 - (5-1) * 5;
		number = cnt - (currentPage - 1) * pageSize;// 출력할 게시글 번호
		
		System.out.println("number : " + number);
		System.out.println("cnt : " + cnt);
		System.out.println("currentPage : " + currentPage);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			// 게시글 목록 조회
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			ArrayList<MovieVO> vos = dao.getMovieList(map);
			model.addAttribute("vos", vos); //큰바구니 : 게시글목록 cf)작은바구니 : 게시글1건
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 4 = (5/3)*3+1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock; // (5%3) == 0
		System.out.println("startPage : " + startPage);
		
		endPage = startPage + pageBlock - 1; // 6 = 4 + 3 - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		
		model.addAttribute("cnt", cnt);// 글갯수
		model.addAttribute("number", number);// 글번호
		model.addAttribute("pageNum", pageNum);// 페이지번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage);// 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);// 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);// 페이지 갯수
			model.addAttribute("currentPage", currentPage);// 현재 페이지
			
		}
		
		System.out.println("hostMovieList 정상 종료");
		
	}
	
	//영화 추가 처리
	@Override
	public void hostMovieAddPro(MultipartHttpServletRequest req, Model model) {
		MultipartFile file = req.getFile("movie_poster");
		
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/phc/");
		
		String realDir = "C:\\Dev\\workspace_baobob\\BAOBOB\\BAOBOB\\src\\main\\webapp\\resources\\images\\phc\\";
		
		try {
			file.transferTo(new File(saveDir+file.getOriginalFilename()));
			
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
			
			int data = 0;
			
			while((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
			
			String movie_title = req.getParameter("movie_title");
			String movie_content = req.getParameter("movie_content");
			int movie_janre = Integer.parseInt(req.getParameter("movie_janre"));
			int movie_age = Integer.parseInt(req.getParameter("movie_age"));
			String movie_rel_date = req.getParameter("movie_rel_date");
			String movie_director = req.getParameter("movie_director");
			String movie_star = req.getParameter("movie_star");
			String movie_country = req.getParameter("movie_country");
			int movie_runTime = Integer.parseInt(req.getParameter("movie_runTime"));
			String movie_poster = file.getOriginalFilename();
			String movie_trailer = req.getParameter("movie_trailer");
			int movie_state = Integer.parseInt(req.getParameter("movie_state"));
			
			MovieVO vo = new MovieVO();
			
			vo.setMovie_title(movie_title);
			vo.setMovie_content(movie_content);
			vo.setMovie_janre(movie_janre);
			vo.setMovie_age(movie_age);
			vo.setMovie_rel_date(movie_rel_date);
			vo.setMovie_age(movie_age);
			vo.setMovie_director(movie_director);
			vo.setMovie_star(movie_star);
			vo.setMovie_country(movie_country);
			vo.setMovie_runTime(movie_runTime);
			vo.setMovie_poster(movie_poster);
			vo.setMovie_trailer(movie_trailer);
			vo.setMovie_state(movie_state);
			
			int cnt = dao.hostMovieAddPro(vo);
			
			model.addAttribute("cnt", cnt);
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}

	// 영화 삭제
	@Override
	public void hostMovieDel(HttpServletRequest req, Model model) {
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		
		int cnt = dao.hostMovieDel(movie_index);
		
		model.addAttribute("cnt", cnt);
	}

	// 영화 상세
	@Override
	public void hostMovieDetail(HttpServletRequest req, Model model) {
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		
		MovieVO vo = dao.hostMovieDetail(movie_index);
		
		if(vo!=null) {
			model.addAttribute("vo", vo);
		}
		
	}

	// 영화 수정
	@Override
	public void hostMovieModPro(MultipartHttpServletRequest req, Model model) {
		String movie_poster = null;
		System.out.println("movie_poster : " + req.getFile("movie_poster").getOriginalFilename());
		try {
			if(req.getFile("movie_poster").getOriginalFilename()!="") {
				MultipartFile file = req.getFile("movie_poster");
				String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/phc/");
				String realDir = "C:\\Dev\\workspace_baobob\\BAOBOB\\BAOBOB\\src\\main\\webapp\\resources\\images\\phc\\";
				file.transferTo(new File(saveDir+file.getOriginalFilename()));
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
				
				int data = 0;
				
				while((data = fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
				movie_poster = file.getOriginalFilename();
			} else {
				movie_poster = req.getParameter("movie_posterDefault");
			}
			
			int movie_index = Integer.parseInt(req.getParameter("movie_index"));
			String movie_title = req.getParameter("movie_title");
			String movie_content = req.getParameter("movie_content");
			int movie_janre = Integer.parseInt(req.getParameter("movie_janre"));
			int movie_age = Integer.parseInt(req.getParameter("movie_age"));
			String movie_rel_date = req.getParameter("movie_rel_date");
			String movie_director = req.getParameter("movie_director");
			String movie_star = req.getParameter("movie_star");
			String movie_country = req.getParameter("movie_country");
			int movie_runTime = Integer.parseInt(req.getParameter("movie_runTime"));
			String movie_trailer = req.getParameter("movie_trailer");
			int movie_state = Integer.parseInt(req.getParameter("movie_state"));
			
			MovieVO vo = new MovieVO();
			
			vo.setMovie_index(movie_index);
			vo.setMovie_title(movie_title);
			vo.setMovie_content(movie_content);
			vo.setMovie_janre(movie_janre);
			vo.setMovie_age(movie_age);
			vo.setMovie_rel_date(movie_rel_date);
			vo.setMovie_age(movie_age);
			vo.setMovie_director(movie_director);
			vo.setMovie_star(movie_star);
			vo.setMovie_country(movie_country);
			vo.setMovie_runTime(movie_runTime);
			vo.setMovie_poster(movie_poster);
			vo.setMovie_trailer(movie_trailer);
			vo.setMovie_state(movie_state);
			
			int cnt = dao.hostMovieModPro(vo);
			
			model.addAttribute("cnt", cnt);
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		
	}

	
	
}

