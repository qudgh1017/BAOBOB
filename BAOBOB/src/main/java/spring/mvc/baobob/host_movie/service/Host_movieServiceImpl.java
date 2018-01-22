package spring.mvc.baobob.host_movie.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.host_movie.persistence.Host_movieDAO;
import spring.mvc.baobob.host_movie.persistence.Host_movieDAOImpl;
import spring.mvc.baobob.twitterKoreanParser.KoreanParser;
import spring.mvc.baobob.vo.HostMovieChartVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieResViewVO;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.TheaterVO;
import spring.mvc.baobob.vo.Theater_scheduleVO;
import spring.mvc.baobob.vo.Theater_seatVO;
import spring.mvc.baobob.vo.WordVO;
import spring.mvc.baobob.vo.hostTChartVO;

@Service
public class Host_movieServiceImpl implements Host_movieService{
	
	@Autowired
	Host_movieDAO dao = new Host_movieDAOImpl();

	// 영화 목록
	@Override
	public void hostMovieList(HttpServletRequest req, Model model) {
//		int pageSize = 10;		//한 페이지당 출력할 게시글 갯수
//		int pageBlock = 3;		//한 블럭당 페이지 갯수
//		
		int cnt = 0;			// 게시글 갯수
//		int start = 0;			// 현재 페이지 게시글 시작 번호
//		int end = 0;			// 현재 페이지 게시글 마지막 번호
//		int number = 0;			// 출력할 게시글 번호
//		String pageNum = null;	// 페이지 번호
//		int currentPage = 0;	// 현재 페이지
//		
//		int pageCount = 0;		// 페이지 갯수
//		int startPage = 0;		// 시작페이지
//		int endPage = 0;		// 마지막 페이지
//		
//		// 글갯수 구하기
		cnt = dao.getMovieCnt();
		
//		pageNum = req.getParameter("pageNum");
		
//		if(pageNum == null) {
//			pageNum = "1"; //첫페이지를 1페이지로 설정
//		}
		
//		currentPage = Integer.parseInt(pageNum);// 현재페이지
//		System.out.println("currentPage : "+ currentPage);
		
		// pageCnt = 12 / 5 + 1; //나머지 2건이 1페이지로 할당되므로 3페이지
//		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);// 페이지 갯수
//		System.out.println("pageCount : "+ pageCount);
		
		// 1 = (1-1) * 5 + 1
		// 6 = (2-1) * 5 + 1
//		start = (currentPage - 1) * pageSize + 1;// 현재 페이지 게시글 시작 번호
	
		// 5 = (1 + 5 - 1)
//		end = start + pageSize -1;//현재 페이지 게시글 마지막 번호
		
//		System.out.println("start : " + start);
//		System.out.println("end : " + end);
		
//		if(end > cnt) end = cnt;
		
		//  = 25 - (5-1) * 5;
//		number = cnt - (currentPage - 1) * pageSize;// 출력할 게시글 번호
		
//		System.out.println("number : " + number);
//		System.out.println("cnt : " + cnt);
//		System.out.println("currentPage : " + currentPage);
//		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			// 게시글 목록 조회
//			Map<String, Integer> map = new HashMap<String, Integer>();
//			map.put("start", start);
//			map.put("end", end);
			ArrayList<MovieVO> vos = dao.getMovieList();
			model.addAttribute("vos", vos); //큰바구니 : 게시글목록 cf)작은바구니 : 게시글1건
			model.addAttribute("cnt", cnt);
		}
		
//		startPage = (currentPage / pageBlock) * pageBlock + 1; // 4 = (5/3)*3+1;
//		if(currentPage % pageBlock == 0) startPage -= pageBlock; // (5%3) == 0
//		System.out.println("startPage : " + startPage);
//		
//		endPage = startPage + pageBlock - 1; // 6 = 4 + 3 - 1;
//		if(endPage > pageCount) endPage = pageCount;
//		System.out.println("endPage : " + endPage);
		
		model.addAttribute("cnt", cnt);// 글갯수
//		model.addAttribute("number", number);// 글번호
//		model.addAttribute("pageNum", pageNum);// 페이지번호
		
//		if(cnt > 0) {
//			model.addAttribute("startPage", startPage); // 시작페이지
//			model.addAttribute("endPage", endPage);// 마지막 페이지
//			model.addAttribute("pageBlock", pageBlock);// 출력할 페이지 갯수
//			model.addAttribute("pageCount", pageCount);// 페이지 갯수
//			model.addAttribute("currentPage", currentPage);// 현재 페이지
			
//		}
		
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

	// 상영관 추가 처리
	@Override
	public void hostTheaterAddPro(HttpServletRequest req, Model model) {
		int theater_index = Integer.parseInt(req.getParameter("theater_index"));
		int theater_col = Integer.parseInt(req.getParameter("col"));
		int theater_row = Integer.parseInt(req.getParameter("row"));
		String status = req.getParameter("state");
		String[] state = status.split(",");
		
		
		
		
		int indexChkCnt = dao.theater_index_check(theater_index);
		if(indexChkCnt == 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("theater_index", theater_index);
			map.put("theater_col", theater_col);
			map.put("theater_row", theater_row);
			int insertCnt = dao.insert_theater(map);
			if(insertCnt == 1) {
				map.put("state", 0);
				map.put("col", 0);
				map.put("row", 0);
				map.put("price", 0);
				for(int row = 1; row<=theater_row; row++) {
					for(int col = 1; col<=theater_col; col++) {
						map.replace("state", Integer.parseInt(state[(row-1)*theater_col-1+col]));
						map.replace("col", col);
						map.replace("row", row);
						if(Integer.parseInt(state[(row-1)*theater_col-1+col])==3)  //(row-1)*theater_col-1+col
							map.replace("price", 9000);
						else if(Integer.parseInt(state[(row-1)*theater_col-1+col])==4)
							map.replace("price", 11000);
						else map.replace("price", 0);
							
						dao.insert_theater_seat(map);
					}
				}
				model.addAttribute("cnt", 1);
			}
		}
		
	}
	
	// 상영관 리스트
	@Override
	public void hostTheaterList(HttpServletRequest req, Model model) {
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
		cnt = dao.getTheaterCnt();
		
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
			ArrayList<TheaterVO> vos = dao.getTheaterList(map);
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
	
	// 상영관 상세
	@Override
	public void hostTheaterDetail(HttpServletRequest req, Model model) {
		TheaterVO vo = null;
		ArrayList<Theater_seatVO> seat_vos = null;
		
		int theater_index = Integer.parseInt(req.getParameter("theater_index"));
		ArrayList<Integer> state = new ArrayList<Integer>();
		
		vo = dao.hostTheaterDetail(theater_index);
		seat_vos = dao.hostTheaterSeatDetail(theater_index);
		for(Theater_seatVO seat_vo : seat_vos) {
			state.add(seat_vo.getSeat_state());
		}
		
		System.out.println("=========================");
		System.out.println("state : " + state);
		System.out.println("=========================");
		
		model.addAttribute("vo", vo);
		model.addAttribute("seat_vos", seat_vos);
		model.addAttribute("state", state);
	}
	
	// 상영관 수정 처리
	@Override
	public void hostTheaterModPro(HttpServletRequest req, Model model) {
		int theater_index = Integer.parseInt(req.getParameter("theater_index"));
		int theater_col = Integer.parseInt(req.getParameter("col"));
		int theater_row = Integer.parseInt(req.getParameter("row"));
		String status = req.getParameter("state");
		String[] state = status.split(",");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theater_index", theater_index);
		map.put("theater_col", theater_col);
		map.put("theater_row", theater_row);
		map.put("state", 0);
		map.put("col", 0);
		map.put("row", 0);
		map.put("price", 0);
		for(int row = 1; row<=theater_row; row++) {
			for(int col = 1; col<=theater_col; col++) {
				map.replace("state", Integer.parseInt(state[(row-1)*theater_col-1+col]));
				map.replace("col", col);
				map.replace("row", row);
				if(Integer.parseInt(state[(row-1)*theater_col-1+col])==3)  //(row-1)*theater_col-1+col
					map.replace("price", 9000);
				else if(Integer.parseInt(state[(row-1)*theater_col-1+col])==4)
					map.replace("price", 11000);
				else map.replace("price", 0);
					
				int cnt = dao.modify_theater_seat(map);
				if(cnt >= 1)
					model.addAttribute("cnt", 1);
			}
		}
			
	}

	// 상영관 삭제 처리
	@Override
	public void hostTheaterDel(HttpServletRequest req, Model model) {
		int theater_index = Integer.parseInt(req.getParameter("theater_index"));
		
		int deleteCnt = dao.hostTheaterSeatDel(theater_index); 
		System.out.println("deleteCnt:" + deleteCnt);
		
		if(deleteCnt >= 1) {
			int cnt = dao.hostTheaterDel(theater_index);
			model.addAttribute("cnt", cnt);
		}
		
	}
	
	// 스케줄 조회
	@Override
	public void hostScheduleList(HttpServletRequest req, Model model) {
		SimpleDateFormat date = new SimpleDateFormat ( "yy-MM-dd", Locale.KOREA );
		Date sysdate = new Date();
		String today = date.format ( sysdate ); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theater_index", 1);
		map.put("startDate", today+"-00:00");
		map.put("endDate", today+"-23:59");
		
		// 선택날짜 스케줄 조회
		ArrayList<Theater_scheduleVO> vos1 = dao.hostScheduleList(map);
		
		model.addAttribute("day0", today);

		
		// 1일 후 스케줄 조회
		sysdate.setDate(sysdate.getDate()+1);
		today = date.format ( sysdate ); //1일 후
		map.replace("startDate", today+"-00:00");
		map.replace("endDate", today+"-23:59");
		model.addAttribute("day1", today);
		ArrayList<Theater_scheduleVO> vos2 = dao.hostScheduleList(map);

		// 2일 후 스케줄 조회
		sysdate.setDate(sysdate.getDate()+1);
		today = date.format ( sysdate ); //1일 후
		map.replace("startDate", today+"-00:00");
		map.replace("endDate", today+"-23:59");
		model.addAttribute("day2", today);
		ArrayList<Theater_scheduleVO> vos3 = dao.hostScheduleList(map);
		
		// 3일 후 스케줄 조회
		sysdate.setDate(sysdate.getDate()+1);
		today = date.format ( sysdate ); //1일 후
		map.replace("startDate", today+"-00:00");
		map.replace("endDate", today+"-23:59");
		model.addAttribute("day3", today);
		ArrayList<Theater_scheduleVO> vos4 = dao.hostScheduleList(map);
		
		// 4일 후 스케줄 조회
		sysdate.setDate(sysdate.getDate()+1);
		today = date.format ( sysdate ); //1일 후
		map.replace("startDate", today+"-00:00");
		map.replace("endDate", today+"-23:59");
		model.addAttribute("day4", today);
		ArrayList<Theater_scheduleVO> vos5 = dao.hostScheduleList(map);
		
		// 모든 상영관 정보
		ArrayList<TheaterVO> theaterVOS = dao.getTheaterAllList();
		
		model.addAttribute("vos1", vos1);
		model.addAttribute("vos2", vos2);
		model.addAttribute("vos3", vos3);
		model.addAttribute("vos4", vos4);
		model.addAttribute("vos5", vos5);



		model.addAttribute("theaterVOS", theaterVOS);

		
	}
	
	// 스케줄 검색 목록 조회
	@Override
	public void hostScheduleSearch(HttpServletRequest req, Model model) {
		String selDate = req.getParameter("date");
		int theater_index = Integer.parseInt(req.getParameter("theater_index"));
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateForm2 = new SimpleDateFormat("yy-MM-dd");
		try {
			Date sysdate = dateForm.parse("20"+selDate+" 00:00:00");
			System.out.println("selectDate = " + sysdate);
			
			String date = dateForm2.format(sysdate);
			
			System.out.println("111111111111111111111111111111111");
			System.out.println("selectDate = " + selDate);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("theater_index", theater_index);
			map.put("startDate", date+"-00:00");
			map.put("endDate", date+"-23:59");
			
			// 선택 날짜 스케줄 조회
			ArrayList<Theater_scheduleVO> vos1 = dao.hostScheduleList(map);
			
			model.addAttribute("day0", date);
			
			// 1일 후 스케줄 조회
			sysdate.setDate(sysdate.getDate()+1);
			date = dateForm2.format ( sysdate ); //1일 후
			map.replace("startDate", date+"-00:00");
			map.replace("endDate", date+"-23:59");
			model.addAttribute("day1", date);

			ArrayList<Theater_scheduleVO> vos2 = dao.hostScheduleList(map);
			
			// 2일 후 스케줄 조회
			sysdate.setDate(sysdate.getDate()+1);
			date = dateForm2.format ( sysdate ); //1일 후
			map.replace("startDate", date+"-00:00");
			map.replace("endDate", date+"-23:59");
			model.addAttribute("day2", date);

			ArrayList<Theater_scheduleVO> vos3 = dao.hostScheduleList(map);
						
			// 3일 후 스케줄 조회
			sysdate.setDate(sysdate.getDate()+1);
			date = dateForm2.format ( sysdate ); //1일 후
			map.replace("startDate", date+"-00:00");
			map.replace("endDate", date+"-23:59");
			model.addAttribute("day3", date);

			ArrayList<Theater_scheduleVO> vos4 = dao.hostScheduleList(map);
			
			// 4일 후 스케줄 조회
			sysdate.setDate(sysdate.getDate()+1);
			date = dateForm2.format ( sysdate ); //1일 후
			map.replace("startDate", date+"-00:00");
			map.replace("endDate", date+"-23:59");
			model.addAttribute("day4", date);

			ArrayList<Theater_scheduleVO> vos5 = dao.hostScheduleList(map);
			
			// 모든 상영관 정보
			ArrayList<TheaterVO> theaterVOS = dao.getTheaterAllList();
			
			
			
			model.addAttribute("date", selDate);
			model.addAttribute("theater_index", theater_index);
			model.addAttribute("vos1", vos1);
			model.addAttribute("vos2", vos2);
			model.addAttribute("vos3", vos3);
			model.addAttribute("vos4", vos4);
			model.addAttribute("vos5", vos5);
			model.addAttribute("theaterVOS", theaterVOS);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}

	// 상영관 추가 폼 영화 정보와 상영관 정보 가져오기
	@Override
	public void hostScheduleAddForm(HttpServletRequest req, Model model) {
		// 상영중인 영화 정보
		ArrayList<MovieVO> movieVOS = dao.getMovieING();
		
		// 모든 상영관 정보
		ArrayList<TheaterVO> theaterVOS = dao.getTheaterAllList();
		
		model.addAttribute("movieVOS", movieVOS);
		model.addAttribute("theaterVOS", theaterVOS);
	}

	// 상영가능한 상영관 조회
	@Override
	public void checkPosTheater(HttpServletRequest req, Model model) {
		String schedule_startDate = req.getParameter("schedule_startDate");
		String schedule_startTime = req.getParameter("schedule_startTime");
		
		ArrayList<TheaterVO> theaterVOS = null;
		
		String schedule_start = schedule_startDate +"-"+ schedule_startTime;
		
		// 상영 가능한 상영관
		int cnt = dao.checkPosTheaterCnt(schedule_start);
		System.out.println("cnt : " + cnt);
		if(cnt == 0) {
			theaterVOS = dao.getTheaterAllList();
		} else {
			theaterVOS = dao.checkPosTheater(schedule_start);
		}
		
		// 상영중인 영화 정보
		ArrayList<MovieVO> movieVOS = dao.getMovieING();
		
		model.addAttribute("confirm", 1);
		model.addAttribute("movieVOS", movieVOS);
		model.addAttribute("theaterVOS", theaterVOS);
	}
	
	// 스케줄 추가 처리
	@Override
	public void hostScheduleAddPro(HttpServletRequest req, Model model) {
		String schedule_startDate = req.getParameter("schedule_startDate");
		String schedule_startTime = req.getParameter("schedule_startTime");
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		int theater_index = Integer.parseInt(req.getParameter("theater_index"));
		int schedule_MDNstate = 1;
		
		int time = Integer.parseInt(schedule_startTime.split(":")[0]);
		if(22<=time && time<=23 || 00<=time && time<=03) { //22<=time && time<=23 || 00<=time && time<=03
			schedule_MDNstate = 2;
		} else if(04<=time && time<=10) { // 04<=time && time<=10
			schedule_MDNstate = 0;
		}
		
		String schedule_start = schedule_startDate +"-"+ schedule_startTime;
		System.out.println("schedule_start = " +schedule_start);
		System.out.println("movie_index = " +movie_index);
		System.out.println("theater_index = " +theater_index);
		System.out.println("schedule_MDNstate = " +schedule_MDNstate);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schedule_start", schedule_start);
		map.put("movie_index", movie_index);
		map.put("theater_index", theater_index);
		map.put("schedule_MDNstate", schedule_MDNstate);
		int cnt = dao.hostScheduleAddPro(map);
		
		// 스케줄에 상영관 인덱스로 스케줄 좌석 테이블에 복사 붙여넣기
		// 상영관의 총 행과 총 열을 가져옴
		TheaterVO theaterVO = dao.hostTheaterDetail(theater_index);
		
		// 가져온 총 행과 총 열을 가지고 2중 for문을 돌려서 2차배열에 좌석state 저장
		int totalCol = theaterVO.getTheater_col(); // 총 열
		int totalRow = theaterVO.getTheater_row(); // 총 행
		System.out.println("totalCol : " + totalCol);
		System.out.println("totalRow : " + totalRow);
		
		int[][] seatState = new int[totalRow][totalCol];
		int[][] seatPrice = new int[totalRow][totalCol];

		Map<String, Integer> map2 = new HashMap<String, Integer>();
		map2.put("theater_index", theater_index);
		map2.put("row", 0);
		map2.put("col", 0);
		
		int empty_seat = 0;
		for(int row = 1; row<=totalRow; row++) {
			for(int col = 1; col<=totalCol; col++) {
				System.out.println("row : " + row);
				System.out.println("col : " + col);
				map2.replace("row", row);
				map2.replace("col", col);
				seatState[row-1][col-1] = dao.getTheaterSeatState(map2);
				seatPrice[row-1][col-1] = dao.getTheaterSeatPrice(map2);
				
				if(seatState[row-1][col-1] == 3 || seatState[row-1][col-1] == 4 || seatState[row-1][col-1] == 5) {
					empty_seat += 1;
				}
			}
		}
		// 빈좌석 업데이트하기
		dao.updateEmpty_seat(empty_seat);
		System.out.println("===============================================");
		System.out.println("seatState : " + seatState);
		
		// 2중 for문을 이용하여 스케줄 시트 테이블에 insert
		map2.put("seatState", 0);
		map2.put("seatPrice", 0);
		for(int row = 1; row<=totalRow; row++) {
			for(int col = 1; col<=totalCol; col++) {
				map2.replace("row", row);
				map2.replace("col", col);
				map2.replace("seatState", seatState[row-1][col-1]);
				map2.replace("seatPrice", seatPrice[row-1][col-1]);
				System.out.println("seatPrice : " + seatPrice[row-1][col-1]);
				dao.TheaterScheduleSeatAddPro(map2);
				
			}
		}
				
						
		
		model.addAttribute("cnt", cnt);
		
	}

	// 스케줄 상세 정보 가져오기
	@Override
	public void hostScheduleDetail(HttpServletRequest req, Model model) {
		int theater_index = Integer.parseInt(req.getParameter("theater_index"));
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index"));
		
		TheaterVO theaterVO = dao.hostTheaterDetail(theater_index);
		MovieVO movieVO = dao.hostMovieDetail(movie_index);
		Theater_scheduleVO scheduleVO = dao.hostScheduleDetail(theater_schedule_index);
		
		// 상영중인 영화 정보
		ArrayList<MovieVO> movieVOS = dao.getMovieING();
		
		// 모든 상영관 정보
		ArrayList<TheaterVO> theaterVOS = dao.getTheaterAllList();
		
		model.addAttribute("theaterVO", theaterVO);
		model.addAttribute("movieVO", movieVO);
		model.addAttribute("scheduleVO", scheduleVO);
		model.addAttribute("movieVOS", movieVOS);
		model.addAttribute("theaterVOS", theaterVOS);
	}

	// 스케줄 수정 처리
	@Override
	public void hostScheduleModPro(HttpServletRequest req, Model model) {
		String startDate = req.getParameter("startDate");
		String startTime = req.getParameter("startTime");
		int theater_index = Integer.parseInt(req.getParameter("theater_index"));
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index"));
		
		String schedule_startTime = startDate+"-"+startTime;
		
		int cnt = 0;
		// 수정하려는 시간에 다른 스케줄이 있는지 확인
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schedule_startTime", schedule_startTime);
		map.put("theater_schedule_index", theater_schedule_index);
		map.put("theater_index", theater_index);
		int sche_chkCnt = dao.chkCnt(map); // 1이상이면 수정못함, 0이면 수정 가능
		
		System.out.println("=============================");
		System.out.println("=============================");
		System.out.println("sche_chkCnt : " + sche_chkCnt);
		System.out.println("=============================");
		System.out.println("=============================");
		
		if(sche_chkCnt == 0) { // 수정가능
			map.put("movie_index", movie_index);
			
			int schedule_MDNstate = 1;
			
			int time = Integer.parseInt(startTime.split(":")[0]);
			if(22<=time && time<=23 || 00<=time && time<=03) { //22<=time && time<=23 || 00<=time && time<=03
				schedule_MDNstate = 2;
			} else if(04<=time && time<=10) { // 04<=time && time<=10
				schedule_MDNstate = 0;
			}
			map.put("schedule_MDNstate", schedule_MDNstate);
			
			cnt = dao.updateSchedule(map);//기존 정보 수정
		}
		
		System.out.println("=============================");
		System.out.println("cnt : " + cnt);
		System.out.println("=============================");
		
		model.addAttribute("cnt", cnt);
	}

	// 스케줄 삭제 처리
	@Override
	public void hostScheduleDelPro(HttpServletRequest req, Model model) {
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index"));
		
		int cnt = dao.hostScheduleDelPro(theater_schedule_index);
		
		model.addAttribute("cnt", cnt);
	}
	
	// 직원 목록
	@Override
	public void hostMovieEmp(HttpServletRequest req, Model model) {
		int cnt = dao.hostMovieEmpCnt();
		
		if(cnt > 0) { // 직원 목록이 존재하면
			ArrayList<Member> vos = dao.hostMovieEmpList();
			model.addAttribute("vos", vos);
			
		}
		model.addAttribute("cnt", cnt);
		
	}
	
	// 직원 고용 아이디 확인
	@Override
	public void hostMovieEmpChkMemberId(HttpServletRequest req, Model model) {
		String member_id = req.getParameter("member_id");
		
		int idCnt = dao.hostMovieEmpChkMemberId(member_id);
		
		if(idCnt != 0) {
			Member vo = dao.hostMovieEmpInfo(member_id); 	// 아이디로 고용할 직원 정보 가져오기
			model.addAttribute("vo", vo);
		}
		
		model.addAttribute("member_id", member_id);
		model.addAttribute("idCnt", idCnt);
	}

	// 직원 고용 처리
	@Override
	public void hostMovieEmpAddPro(HttpServletRequest req, Model model) {
		String member_id = req.getParameter("member_id");
		String employee_jumin2 = req.getParameter("employee_jumin2");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("employee_jumin2", employee_jumin2);
		
		int cnt = dao.memberChangeState(member_id);
		
		if(cnt == 1) {
			int insertCnt = dao.insertEmp(map);
			if(insertCnt==1) {
				cnt = 1;
			}else {
				cnt = 0;
			}
		}
		model.addAttribute("cnt", cnt);
		
	}

	// 직원 하고
	@Override
	public void hostMovieEmpDel(HttpServletRequest req, Model model) {
		String member_id = req.getParameter("member_id");
		
		// 회원으로 돌아가기 전 종합포인트 등급 확인
		int point = dao.getMemberPoint(member_id);
		
		int member_step = 9;
		
		if(point <= 15000 ) {
			member_step = 9;
		}else if(point <= 30000) {
			member_step = 10;
		}else if(point <= 45000) {
			member_step = 11;
		}else {
			member_step = 12;
		}
		
		int cnt = dao.hostMovieEmpDel(member_id); // 직원 목록에서 삭제
		
		if(cnt > 0) {
			Member vo = new Member();
			vo.setMember_id(member_id);
			vo.setMember_step(member_step);
			
			cnt = dao.updateMemberStep(vo);
		}
		
		model.addAttribute("cnt", cnt);
		
	}

	// 예매 상세
	@Override
	public void hostTheaterScheduleDetail(HttpServletRequest req, Model model) {
		
		TheaterVO vo = null;
		ArrayList<Theater_seatVO> seat_vos = null;
		
		int theater_index = Integer.parseInt(req.getParameter("theater_index"));
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index"));
		
		ArrayList<Integer> state = new ArrayList<Integer>();
		
		vo = dao.hostTheaterDetail(theater_index);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("theater_index", theater_index);
		map.put("theater_schedule_index", theater_schedule_index);
		seat_vos = dao.hostTheaterScheduleSeatDetail(map);
		for(Theater_seatVO seat_vo : seat_vos) {
			state.add(seat_vo.getSeat_state());
		}
		
		System.out.println("=========================");
		System.out.println("state : " + state);
		System.out.println("=========================");
		
		model.addAttribute("vo", vo);
		model.addAttribute("seat_vos", seat_vos);
		model.addAttribute("state", state);
		
	}

	// 예매 상세
	@Override
	public MovieResViewVO hostMovieResView(HttpServletRequest req, Model model) {
		MovieResViewVO viewVO = new MovieResViewVO();
		
		TheaterVO vo = null;
		ArrayList<Theater_seatVO> seat_vos = null;
		
		int theater_index = Integer.parseInt(req.getParameter("theater_index"));
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index"));
		
		ArrayList<Integer> state = new ArrayList<Integer>();
		
		vo = dao.hostTheaterDetail(theater_index);
		System.out.println("theater_col " + vo.getTheater_col());
		System.out.println("theater_row " + vo.getTheater_row());

		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("theater_index", theater_index);
		map.put("theater_schedule_index", theater_schedule_index);
		seat_vos = dao.hostTheaterScheduleSeatDetail(map);
		for(Theater_seatVO seat_vo : seat_vos) {
			state.add(seat_vo.getSeat_state());
		}
		
		viewVO.setTotalRow(vo.getTheater_row());
		viewVO.setTotalCol(vo.getTheater_col());
		viewVO.setState(state);
		
		System.out.println("=========================");
		System.out.println("state : " + state);
		System.out.println("=========================");
		
//		model.addAttribute("vo", vo);
//		model.addAttribute("seat_vos", seat_vos);
//		model.addAttribute("state", state);
		
		
		return viewVO;
	}

	// 장르별 영화 관람객 수
	@Override
	public void movieJanreCountChart(HttpServletRequest req, Model model) {
		Map<String , Object> map = new HashMap<String,Object>();

		//mapper에서 불러온 kind와 value가 다건이기때문에 vo형태의 List형으로 받아준다.
		List<HostMovieChartVO> voList = dao.getMovieCountChart(); 
		
		//vo데이터타입 i 에 List데이터들을 한건씩 빼와서 map에 담아준다.
		//(map의 key값이 String이기때문에 int형인 kind를 String으로 형변환 해준다.
		for (HostMovieChartVO i : voList) {
			map.put(i.getKind() , i.getValue());
		}
		
		model.addAttribute("movieJanreCountChart",map);
		
		map.forEach((k,v)->{
			System.out.println(k + " : " + v);
		});
	}

	// 제한 연령별 매출
	@Override
	public void movieAgeChart(HttpServletRequest req, Model model) {
		Map<String , Object> map = new HashMap<String,Object>();

		//mapper에서 불러온 kind와 sum가 다건이기때문에 vo형태의 List형으로 받아준다.
		List<hostTChartVO> voList = dao.movieAgeChart(); 
		
		//vo데이터타입 i 에 List데이터들을 한건씩 빼와서 map에 담아준다.
		//(map의 key값이 String이기때문에 int형인 kind를 String으로 형변환 해준다.
		for (hostTChartVO i : voList) {
			map.put(Integer.toString(i.getKind()) , i.getSum());
		}
		
		model.addAttribute("movieAgeChart",map);
		
		map.forEach((k,v)->{
			System.out.println(k + " : " + v);
		});
	}

	// 관람객 성별 수
	@Override
	public void movieSexCountChart(HttpServletRequest req, Model model) {
		Map<String , Object> map = new HashMap<String,Object>();

		//mapper에서 불러온 kind와 value가 다건이기때문에 vo형태의 List형으로 받아준다.
		List<HostMovieChartVO> voList = dao.movieSexCountChart(); 
		
		//vo데이터타입 i 에 List데이터들을 한건씩 빼와서 map에 담아준다.
		//(map의 key값이 String이기때문에 int형인 kind를 String으로 형변환 해준다.
		for (HostMovieChartVO i : voList) {
			map.put(i.getKind() , i.getValue());
		}
		
		model.addAttribute("movieSexCountChart",map);
		
		map.forEach((k,v)->{
			System.out.println(k + " : " + v);
		});
	}

	
	/////////////////////////////////////////////
	////////////////////////////////////////////
	// 워드 클라우드
	
	// 워드클라우드 리스트
		private static List<WordVO> wordVos;
	
	// 단어 형태소 분석을 처리하는 메서드
		@Override
		public void wordAnalyzer(String title, String content, String tag) {
			StringBuilder sb = new StringBuilder(title);
			if(content != null) {
				if(!content.equals("")){
					sb.append(" " + content);
				}
			}
			if(tag != null) {
				String[] tags = tag.split(",");
				for(String ta : tags) {
					ta = " #"+ta.replaceAll(" ", "");
					sb.append(ta);
				}
				System.out.println("sb : " + sb.toString());
			}
			wordExtractAndAnalyze(sb.toString());
		}

		// 형태소 분석된 결과를 데이터베이스에 저장하는 프로세스
		@Override
		public void wordExtractAndAnalyze(String text) {
			System.out.println("WordCloud analyze");
			new Runnable() {
				public void run() {

					List<WordVO> wordMap = KoreanParser.getWordsMap(text);
					if(wordMap.isEmpty())return;
					Timestamp time = new Timestamp(System.currentTimeMillis());
					for(WordVO dto : wordMap) {

						// 기존에 있는 단어일 경우 카운트 업데이트
						if(dao.checkWordCloud(dto.getWord()) == 1) {
							dto.setUpdate_date(time);
							dao.updateWordCloud(dto);
							// 기존에 없는 단어일 경우 단어와 카운트 추가	
						} else {
							dto.setUpdate_date(time);
							dto.setReg_date(time);
							dao.addWordCloud(dto);
						}
					}
					// 워드 클라우드 모델을 refresh 해줌
					setWordList();
					System.out.println("WordCloud 분석 종료");
				}
			}.run();
		}

		// 워드클라우드 단어를 가져옴
		public synchronized void setWordList() {
			System.out.println("Word Cloud word set request");
			wordVos = dao.getWordCloudModel();
		}
	
	
	
	// 워드클라우드 재검색 요청
	@Override
	public String wordcloudRefresh(HttpServletRequest req, Model model) {
		String strDate = req.getParameter("strDate");
		String endDate = req.getParameter("endDate");
		String[] wordOps = req.getParameter("wordOps").split(",");
		String printMsg = "";
		String cow = req.getParameter("countOfWords");
		if(cow == null)cow = "30";
		int countOfWords = Integer.parseInt(req.getParameter("countOfWords"));
		Map<String, Object> map = new HashMap<>();

		printMsg = "strDate : " + strDate + ", endDate : " + endDate +", 요청단어수 : " + countOfWords;

		int type = 0;

		if(wordOps != null) {
			List<String> list = Arrays.asList(wordOps);
			if(list.contains("Noun") && list.contains("Verb") && list.contains("Hashtag")){
				type = 6;
				printMsg += ", | 명사, 동사, 해시태그 검색요청";
			} else if(list.contains("Noun") && list.contains("Verb")) {
				type = 4;
				printMsg += ", | 명사, 동사 검색요청";
			} else if(list.contains("Noun") && list.contains("Hashtag")) {
				type = 7;
				printMsg += ", | 명사, 해시태그 검색요청";
			} else if(list.contains("Hashtag") && list.contains("Verb")) {
				type = 5;
				printMsg += ", | 해시태그, 동사 검색요청";
			} else if(list.contains("Noun")) {
				type = 1;
				printMsg += ", | 명사 검색요청";
			} else if(list.contains("Verb")) {
				type = 2;
				printMsg += ", | 동사 검색요청";
			} else if(list.contains("Hashtag")) {
				type = 3;
				printMsg += ", | 해시태그 검색요청";
			}
		} else {
			type = 6;
			printMsg += ", | 명사, 동사, 해시태그 전체검색 요청";
		}

		map.put("type", type);
		map.put("countOfWords", countOfWords);

		List<WordVO> wordList = null;

		if(strDate != null && endDate != null){
			if(!strDate.equals("")) {
				strDate = strDate + " 00:00:01.000000";
				endDate = endDate + " 23:59:59.000000";
				Timestamp stp = Timestamp.valueOf(strDate);
				Timestamp etp = Timestamp.valueOf(endDate);
				map.put("strDate", stp);
				map.put("endDate", etp);
				wordList = dao.searchWordcloud2(map);
			} else {
				wordList = dao.searchWordcloud(map);
			}
		} else {
			wordList = dao.searchWordcloud(map);
		}

		System.out.println(printMsg);

		String resultMsg = "<ul>";
		System.out.println(wordList);
		for(WordVO vo : wordList) {
			if(vo.getType_of_speech().equals("Hashtag")){
				resultMsg += "<li><a href='/moyeo/two/wordCloudSearchByTag?search_keyword=" + vo.getWord().replaceAll("#", "") + "' >" + vo.getWord() + "</a></li>";
			} else {
				resultMsg += "<li><a href='/moyeo/two/wordCloudSearch?search_keyword=" + vo.getWord() + "' >" + vo.getWord() + "</a></li>";
			}
		}
		if(wordList.isEmpty())resultMsg += "<li><a href='#' target='_blank'>단어가 없습니다.</a></li>";
		resultMsg += "</ul>";

		System.out.println(resultMsg);

		//		model.addAttribute("wordList", wordList);
		//		model.addAttribute("listSize", wordList.size());

		return resultMsg;
	}



		
	////////////////////////////////////////
	///////////////////////////////////////

	

	
	
}

