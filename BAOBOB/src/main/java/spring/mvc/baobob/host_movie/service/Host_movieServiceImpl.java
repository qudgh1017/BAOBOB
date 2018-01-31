package spring.mvc.baobob.host_movie.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
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
	
	private Logger log = Logger.getLogger(this.getClass());

	// 영화 목록
	@Override
	public void hostMovieList(HttpServletRequest req, Model model) {
		int cnt = 0;			// 영화 갯수
		cnt = dao.getMovieCnt(); // 영화 갯수 구하기
		if(cnt > 0) {
			ArrayList<MovieVO> vos = dao.getMovieList(); // 영화 목록 조회
			model.addAttribute("vos", vos);
			model.addAttribute("cnt", cnt);
		}
		model.addAttribute("cnt", cnt);
	}
	
	//영화 추가 처리
	@Override
	public void hostMovieAddPro(MultipartHttpServletRequest req, Model model) {
		MultipartFile file = req.getFile("movie_poster"); // hostMovieAddForm.jsp의 <input type="file"> 형태를 가져옴
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/phc/"); // 임시 저장할 경로
		String realDir = "C:\\Dev\\workspace_baobob\\BAOBOB\\BAOBOB\\src\\main\\webapp\\resources\\images\\phc\\"; // 저장할 경로
		
		try {
			file.transferTo(new File(saveDir+file.getOriginalFilename())); // 업로드 한 파일 데이터를 지정한 경로 파일에 저장한다.
			
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename()); // 읽어올 파일경로 설정
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename()); // 쓸 파일 경로
			
			int data = 0;
			
			while((data = fis.read()) != -1) { // 임시 저장 경로에 저장한 파일을 read해서 저장할 파일 경로에 write
				fos.write(data);
			}
			fis.close(); // FileInputStream 종료
			fos.close(); // FileOutputStream 종료
			
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
			
			int cnt = dao.hostMovieAddPro(vo); // 영화 추가 처리
			
			model.addAttribute("cnt", cnt);
			
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	// 영화 삭제
	@Override
	public void hostMovieDel(HttpServletRequest req, Model model) {
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		
		int cnt = dao.hostMovieDel(movie_index); // movie_index로 영화정보를 삭제
		
		model.addAttribute("cnt", cnt);
	}

	// 영화 상세
	@Override
	public void hostMovieDetail(HttpServletRequest req, Model model) {
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		
		MovieVO vo = dao.hostMovieDetail(movie_index); // movie_index에 해당하는 영화 상세 정보를 MovieVO에 담음
		
		if(vo!=null) {						// 담은 정보가 null이 아니면
			model.addAttribute("vo", vo);
		}
		
	}

	// 영화 수정
	@Override
	public void hostMovieModPro(MultipartHttpServletRequest req, Model model) {
		String movie_poster = null;
		try {
			if(req.getFile("movie_poster").getOriginalFilename()!="") { // 포스터를 수정한다면
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
			} else { // 포스터를 수정하지 않다면
				movie_poster = req.getParameter("movie_posterDefault"); // 원래의 포스터 정보 가져옴
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
			
			int cnt = dao.hostMovieModPro(vo); // 영화 정보 수정 처리
			
			model.addAttribute("cnt", cnt);
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		
	}

	// 상영관 추가 처리
	@Override
	public void hostTheaterAddPro(HttpServletRequest req, Model model) {
		int theater_index = Integer.parseInt(req.getParameter("theater_index")); // n관
		int theater_col = Integer.parseInt(req.getParameter("col")); // 상영관 전체 열
		int theater_row = Integer.parseInt(req.getParameter("row")); // 상영관 전체 행
		String status = req.getParameter("state"); // 전체 좌석 상태
		String[] state = status.split(","); // 전체 좌석별 좌석 상태
		
		int indexChkCnt = dao.theater_index_check(theater_index); // 추가하려는 상영관이 중복되는지 체크
		if(indexChkCnt == 0) { // 추가하려는 상영관이 중복이 아니라면 상영관을 새로 추가
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("theater_index", theater_index); // 상영관 n관
			map.put("theater_col", theater_col); // 상영관 전체 열
			map.put("theater_row", theater_row); // 상영관 전체 행
			int insertCnt = dao.insert_theater(map); // 상영관 추가 처리
			if(insertCnt == 1) { // 상영관 추가를 성공하면
				map.put("state", 0); // 좌석상태 초기 선언
				map.put("col", 0); // 열 초기 선언
				map.put("row", 0); // 행 초기 선언
				map.put("price", 0); // 좌석별 가격 초기 선언
				
				for(int row = 1; row<=theater_row; row++) { // 1부터 전체 행까지 for문 적용
					for(int col = 1; col<=theater_col; col++) { // 1부터 전체 열까지 for문 적용
						map.replace("state", Integer.parseInt(state[(row-1)*theater_col-1+col])); // 행과 열에 해당하는 좌석 상태 설정
						map.replace("col", col); // 열
						map.replace("row", row); // 행
						if(Integer.parseInt(state[(row-1)*theater_col-1+col])==3)  // 좌석상태가 일반석 9000원
							map.replace("price", 9000);
						else if(Integer.parseInt(state[(row-1)*theater_col-1+col])==4) // 좌석상태가 프리미엄석 11000원
							map.replace("price", 11000);
						else if(Integer.parseInt(state[(row-1)*theater_col-1+col])==5) // 좌석 상태가 커플석 15000원
							map.replace("price", 15000);
						else map.replace("price", 0); // 나머지는 0원으로 설정
							
						dao.insert_theater_seat(map); // 행과 열에 해당하는 state와 가격을 INSERT
					}
				}
				model.addAttribute("cnt", 1); // 좌석 등록 후
			}
		}
	}
	
	// 상영관 리스트
	@Override
	public void hostTheaterList(HttpServletRequest req, Model model) {
		int cnt = 0; // 상영관 수
		cnt = dao.getTheaterCnt(); // 상영관 수 구하기
		if(cnt > 0) {
			ArrayList<TheaterVO> vos = dao.getTheaterList(); // 상영관 목록 조회
			model.addAttribute("vos", vos);
		}
		model.addAttribute("cnt", cnt);
	}
	
	// 상영관 상세
	@Override
	public void hostTheaterDetail(HttpServletRequest req, Model model) {
		TheaterVO vo = null;
		ArrayList<Theater_seatVO> seat_vos = null;
		
		int theater_index = Integer.parseInt(req.getParameter("theater_index")); // 상영관 index
		ArrayList<Integer> state = new ArrayList<Integer>(); // 전체 좌석 상태
		
		vo = dao.hostTheaterDetail(theater_index); // 상영관 index에 해당하는 상영관 정보를 TheaterVO에 담음
		seat_vos = dao.hostTheaterSeatDetail(theater_index); // 상영관 index에 해당하는 좌석정보를 ArrayList<Theater_seatVO>에 담음
		for(Theater_seatVO seat_vo : seat_vos) { // 배열로 받아온 seat 정보를  전체 좌석 상테에 저장
			state.add(seat_vo.getSeat_state());
		}

		model.addAttribute("vo", vo);
		model.addAttribute("seat_vos", seat_vos);
		model.addAttribute("state", state);
	}
	
	// 상영관 수정 처리
	@Override
	public void hostTheaterModPro(HttpServletRequest req, Model model) {
		int theater_index = Integer.parseInt(req.getParameter("theater_index")); // 상영관 index (n관)
		int theater_col = Integer.parseInt(req.getParameter("col")); // 상영관 전체 열
		int theater_row = Integer.parseInt(req.getParameter("row")); // 상영관 전체 행
		String status = req.getParameter("state"); // 전체 좌석 상태
		String[] state = status.split(","); // 전체 좌석별 좌석 상태
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theater_index", theater_index); // n관
		map.put("theater_col", theater_col); // 상영관 전체 열
		map.put("theater_row", theater_row); // 상영관 전체 행
		map.put("state", 0); // 좌석 상태
		map.put("col", 0); // 열
		map.put("row", 0); // 행
		map.put("price", 0); // 좌석 가격 
		for(int row = 1; row<=theater_row; row++) { // 1부터 전체 행까지 for문 적용
			for(int col = 1; col<=theater_col; col++) { // 1부터 전체 열까지 for문 적용
				map.replace("state", Integer.parseInt(state[(row-1)*theater_col-1+col])); // 행과 열에 해당하는 좌석 상태 설정
				map.replace("col", col); // 열
				map.replace("row", row); // 행
				if(Integer.parseInt(state[(row-1)*theater_col-1+col])==3)  //일반석이면 9000원
					map.replace("price", 9000);
				else if(Integer.parseInt(state[(row-1)*theater_col-1+col])==4) // 프리미엄석이면 11000원
					map.replace("price", 11000);
				else if(Integer.parseInt(state[(row-1)*theater_col-1+col])==5) // 커플석이면 15000원
					map.replace("price", 15000);
				else map.replace("price", 0); // 나머지 0원
					
				int cnt = dao.modify_theater_seat(map); // 좌석 정보 UPDATE
				
				if(cnt >= 1)
					model.addAttribute("cnt", 1);
			}
		}
			
	}

	// 상영관 삭제 처리
	@Override
	public void hostTheaterDel(HttpServletRequest req, Model model) {
		int theater_index = Integer.parseInt(req.getParameter("theater_index")); // 삭제할 상영관 index
		
		int deleteCnt = dao.hostTheaterSeatDel(theater_index);  // theater_index에 Forign key가 걸려있는 자식 테이블인 seat테이블을 먼저 삭제 처리
		
		if(deleteCnt >= 1) { // 상영관에 해당하는 좌석 정보를 삭제 성공하면
			int cnt = dao.hostTheaterDel(theater_index); // 상영관 정보 삭제
			model.addAttribute("cnt", cnt);
		}
		
	}
	
	// 스케줄 조회
	@Override
	public void hostScheduleList(HttpServletRequest req, Model model) {
		SimpleDateFormat date = new SimpleDateFormat ( "yy-MM-dd", Locale.KOREA ); // 날짜를 yy-MM-dd형태로 변환하는 simpleDateFormat 선언
		Date sysdate = new Date(); // 현재 시간
		String today = date.format ( sysdate ); // Date형태로 선언한 현재시간을 문자열 yy-MM-dd 형태로 변환  
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theater_index", 1); // 처음 조회시 상영관 1을 조회하기위한 설정
		map.put("startDate", today+"-00:00"); // yy-MM-dd-00:00으로 설정
		map.put("endDate", today+"-23:59"); // yy-MM-dd-23:59으로 설정
		ArrayList<Theater_scheduleVO> vos1 = dao.hostScheduleList(map); // 선택날짜 스케줄 조회
		model.addAttribute("day0", today);

		// 1일 후 스케줄 조회
		sysdate.setDate(sysdate.getDate()+1); // 현재날짜 + 1일
		today = date.format ( sysdate ); //+1일 한 날짜를 문자열 yy-MM-dd형으로 변환
		map.replace("startDate", today+"-00:00"); // yy-MM-dd-00:00으로 설정
		map.replace("endDate", today+"-23:59"); // yy-MM-dd-23:59으로 설정
		model.addAttribute("day1", today);
		ArrayList<Theater_scheduleVO> vos2 = dao.hostScheduleList(map); // 선택날짜 스케줄 조회

		// 2일 후 스케줄 조회
		sysdate.setDate(sysdate.getDate()+1);
		today = date.format ( sysdate ); //+1일
		map.replace("startDate", today+"-00:00");
		map.replace("endDate", today+"-23:59");
		model.addAttribute("day2", today);
		ArrayList<Theater_scheduleVO> vos3 = dao.hostScheduleList(map);
		
		// 3일 후 스케줄 조회
		sysdate.setDate(sysdate.getDate()+1);
		today = date.format ( sysdate ); //+1일
		map.replace("startDate", today+"-00:00");
		map.replace("endDate", today+"-23:59");
		model.addAttribute("day3", today);
		ArrayList<Theater_scheduleVO> vos4 = dao.hostScheduleList(map);
		
		// 4일 후 스케줄 조회
		sysdate.setDate(sysdate.getDate()+1);
		today = date.format ( sysdate ); //+1일
		map.replace("startDate", today+"-00:00");
		map.replace("endDate", today+"-23:59");
		model.addAttribute("day4", today);
		ArrayList<Theater_scheduleVO> vos5 = dao.hostScheduleList(map);
		
		ArrayList<TheaterVO> theaterVOS = dao.getTheaterAllList(); // 모든 상영관 정보
		
		ArrayList<MovieVO> movieVOS = dao.getMovieList(); // 모든 영화 정보
		
		model.addAttribute("vos1", vos1);
		model.addAttribute("vos2", vos2);
		model.addAttribute("vos3", vos3);
		model.addAttribute("vos4", vos4);
		model.addAttribute("vos5", vos5);
		
		model.addAttribute("movieVOS", movieVOS);
		model.addAttribute("theaterVOS", theaterVOS);

		
	}
	
	// 스케줄 검색 목록 조회
	@Override
	public void hostScheduleSearch(HttpServletRequest req, Model model) {
		String selDate = req.getParameter("date"); // 선택한 날짜
		int theater_index = Integer.parseInt(req.getParameter("theater_index")); // 선택한 상영관
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // yyyy-MM-dd HH:mm:ss 형태로 변환하는 SimpleDateFormat 설정
		SimpleDateFormat dateForm2 = new SimpleDateFormat("yy-MM-dd"); //yyyy-MM-dd 형태로 변환하는 SimpleDateFormat 설정
		try {
			Date sysdate = dateForm.parse("20"+selDate+" 00:00:00"); // 문자열 yy-MM-dd을 Date형태 20yy-MM-dd 00:00:00으로 변환하여 변수에 담음
			
			String date = dateForm2.format(sysdate); // Date형태를 문자열 yy-MM-dd형으로 변환
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("theater_index", theater_index); // 선택한 상영관
			map.put("startDate", date+"-00:00"); // 선택한 날짜의 yy-MM-dd-00:00
			map.put("endDate", date+"-23:59"); // 선택한 날짜의 yy-MM-dd-23:59
			ArrayList<Theater_scheduleVO> vos1 = dao.hostScheduleList(map); // 선택 날짜 스케줄 조회
			model.addAttribute("day0", date);
			
			// 1일 후 스케줄 조회
			sysdate.setDate(sysdate.getDate()+1); // 선택한 날짜 +1일
			date = dateForm2.format ( sysdate ); // yy-MM-dd 형태로 변환
			map.replace("startDate", date+"-00:00"); // +1일 날짜의 yy-MM-dd-00:00
			map.replace("endDate", date+"-23:59"); // +1일 날짜의 yy-MM-dd- 23:59
			model.addAttribute("day1", date);
			ArrayList<Theater_scheduleVO> vos2 = dao.hostScheduleList(map);  // +1일 날짜 스케줄 조회
			
			// 2일 후 스케줄 조회
			sysdate.setDate(sysdate.getDate()+1); // 선택한 날짜 +1일 +1일
			date = dateForm2.format ( sysdate ); // yy-MM-dd 형태로 변환
			map.replace("startDate", date+"-00:00"); // +1+1일 날짜의 yy-MM-dd-00:00
			map.replace("endDate", date+"-23:59"); // +1+1일 날짜의 yy-MM-dd- 23:59
			model.addAttribute("day2", date);
			ArrayList<Theater_scheduleVO> vos3 = dao.hostScheduleList(map); // +1일 +1일 날짜 스케줄 조회
						
			// 3일 후 스케줄 조회
			sysdate.setDate(sysdate.getDate()+1); // 선택한 날짜 +1일 +1일 +1일
			date = dateForm2.format ( sysdate ); // yy-MM-dd 형태로 변환
			map.replace("startDate", date+"-00:00"); // +1+1+1일 날짜의 yy-MM-dd-00:00
			map.replace("endDate", date+"-23:59"); // +1+1+1일 날짜의 yy-MM-dd- 23:59
			model.addAttribute("day3", date);
			ArrayList<Theater_scheduleVO> vos4 = dao.hostScheduleList(map); // +1일 +1일 +1일 날짜 스케줄 조회
			
			// 4일 후 스케줄 조회
			sysdate.setDate(sysdate.getDate()+1); // 선택한 날짜 +1일 +1일 +1일 +1일
			date = dateForm2.format ( sysdate ); // yy-MM-dd 형태로 변환
			map.replace("startDate", date+"-00:00"); // +1+1일 날짜의 yy-MM-dd-00:00
			map.replace("endDate", date+"-23:59"); // +1+1일 날짜의 yy-MM-dd- 23:59
			model.addAttribute("day4", date);
			ArrayList<Theater_scheduleVO> vos5 = dao.hostScheduleList(map); // +1일 +1일 +1일 +1일 날짜 스케줄 조회
			
			ArrayList<TheaterVO> theaterVOS = dao.getTheaterAllList(); // 모든 상영관 정보
			
			ArrayList<MovieVO> movieVOS = dao.getMovieList(); // 모든 영화 정보
			
			model.addAttribute("date", selDate);
			model.addAttribute("theater_index", theater_index);
			model.addAttribute("vos1", vos1);
			model.addAttribute("vos2", vos2);
			model.addAttribute("vos3", vos3);
			model.addAttribute("vos4", vos4);
			model.addAttribute("vos5", vos5);
			
			model.addAttribute("movieVOS", movieVOS);
			model.addAttribute("theaterVOS", theaterVOS);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}

	// 상영관 추가 폼 영화 정보와 상영관 정보 가져오기
	@Override
	public void hostScheduleAddForm(HttpServletRequest req, Model model) {
		ArrayList<MovieVO> movieVOS = dao.getMovieING(); // 상영중인 영화 정보
		
		ArrayList<TheaterVO> theaterVOS = dao.getTheaterAllList(); // 모든 상영관 정보
		
		model.addAttribute("movieVOS", movieVOS);
		model.addAttribute("theaterVOS", theaterVOS);
	}

	// 상영가능한 상영관 조회
	@Override
	public void checkPosTheater(HttpServletRequest req, Model model) {
		String schedule_startDate = req.getParameter("schedule_startDate"); // 선택한 날짜
		String schedule_startTime = req.getParameter("schedule_startTime"); // 선택한 시간
		
		ArrayList<TheaterVO> theaterVOS = null;
		
		String schedule_start = schedule_startDate +"-"+ schedule_startTime; // 선택한 날짜와 시간
		
		int cnt = dao.checkPosTheaterCnt(schedule_start); // 상영 가능한 상영관
		if(cnt == 0) { // 선택시간에 모든 상영관이 스케줄이 없다면
			theaterVOS = dao.getTheaterAllList(); // 모든 상영관 정보를 가져옴
		} else { // 선택한 시간에 1개이상의 상영관이 스케줄이 있다면
			theaterVOS = dao.checkPosTheater(schedule_start); //선택한 시간대에 상영 가능한 상영관을 가져옴
		}
		
		ArrayList<MovieVO> movieVOS = dao.getMovieING(); // 상영중인 영화 정보
		
		model.addAttribute("confirm", 1);
		model.addAttribute("movieVOS", movieVOS);
		model.addAttribute("theaterVOS", theaterVOS);
	}
	
	// 스케줄 추가 처리
	@Override
	public void hostScheduleAddPro(HttpServletRequest req, Model model) {
		String schedule_startDate = req.getParameter("schedule_startDate"); // 스케줄 시작 날짜
		String schedule_startTime = req.getParameter("schedule_startTime"); // 스케줄 시작 시간
		int movie_index = Integer.parseInt(req.getParameter("movie_index")); // 영화
		int theater_index = Integer.parseInt(req.getParameter("theater_index")); // 상영관
		int schedule_MDNstate = 1; // 조조, 일반, 심야 state
		
		int time = Integer.parseInt(schedule_startTime.split(":")[0]);
		if(22<=time && time<=23 || 00<=time && time<=03) { // 스케줄 시간이 심야시간이면
			schedule_MDNstate = 2; // state = 심야
		} else if(04<=time && time<=10) { // 스케줄 시간이 조조 시간이면
			schedule_MDNstate = 0; // state = 조조
		}
		
		String schedule_start = schedule_startDate +"-"+ schedule_startTime; // 스케줄 시작 날짜와 시간
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schedule_start", schedule_start); // 스케줄 시작 날짜와 시간
		map.put("movie_index", movie_index); // 영화
		map.put("theater_index", theater_index); // 상영관
		map.put("schedule_MDNstate", schedule_MDNstate); // 조조, 일반, 심야 state
		int cnt = dao.hostScheduleAddPro(map); // 스케줄 추가 처리
		
		TheaterVO theaterVO = dao.hostTheaterDetail(theater_index); // 상영관의 총 행과 총 열을 가져옴
		
		// 가져온 총 행과 총 열을 가지고 2중 for문을 돌려서 2차배열에 좌석state 저장
		int totalCol = theaterVO.getTheater_col(); // 총 열
		int totalRow = theaterVO.getTheater_row(); // 총 행
		int[][] seatState = new int[totalRow][totalCol]; // 좌석별 상태 2차배열 크기를 총 열과 총 행으로 설정
		int[][] seatPrice = new int[totalRow][totalCol]; // 좌석별 가격 2차배열 크기를 총 열과 총 행으로 설정

		Map<String, Integer> map2 = new HashMap<String, Integer>();
		map2.put("theater_index", theater_index); // 상영관
		map2.put("row", 0); // 행 초기 설정
		map2.put("col", 0); // 열 초기 설정
		
		int empty_seat = 0; // 일반석, 프리미엄석, 커플석의 빈좌석 초기 설정
		for(int row = 1; row<=totalRow; row++) { // 1부터 전체 행까지 for문 적용
			for(int col = 1; col<=totalCol; col++) { // 1부터 전체 열까지 for문 적용
				map2.replace("row", row); // 행 설정
				map2.replace("col", col); // 열 설정
				seatState[row-1][col-1] = dao.getTheaterSeatState(map2); //상영관index, 행과 열에 해당하는 좌석 state를 가져옴 
				seatPrice[row-1][col-1] = dao.getTheaterSeatPrice(map2); //상영관index, 행과 열에 해당하는 좌석 가격정보를 가져옴 
				
				if(seatState[row-1][col-1] == 3 || seatState[row-1][col-1] == 4 || seatState[row-1][col-1] == 5) { // 좌석state가 일반, 프리미엄, 커플석이면
					empty_seat += 1; // 빈좌석 +1
				}
			}
		}
		dao.updateEmpty_seat(empty_seat); // 빈좌석 업데이트
		
		// 2중 for문을 이용하여 스케줄 시트 테이블에 insert
		map2.put("seatState", 0); // 좌석상태 초기설정
		map2.put("seatPrice", 0); // 좌석 가격 초기설정
		for(int row = 1; row<=totalRow; row++) { // 1부터 전체 행까지 for문 적용
			for(int col = 1; col<=totalCol; col++) { // 1부터 전체 열까지 for문 적용
				map2.replace("row", row); // 행 설정
				map2.replace("col", col); // 열 설정
				map2.replace("seatState", seatState[row-1][col-1]); // 행과 열에 해당하는 좌석 정보를 설정
				map2.replace("seatPrice", seatPrice[row-1][col-1]); // 행과 열에 해당하는 좌석 가격 설정
				dao.TheaterScheduleSeatAddPro(map2); // 좌석 테이블에 해당 상영관index로 좌석 정보 추가 처리
			}
		}
		model.addAttribute("cnt", cnt);
	}

	// 스케줄 상세 정보 가져오기
	@Override
	public void hostScheduleDetail(HttpServletRequest req, Model model) {
		int theater_index = Integer.parseInt(req.getParameter("theater_index")); // 상영관
		int movie_index = Integer.parseInt(req.getParameter("movie_index")); // 영화
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index")); // 스케줄
		
		TheaterVO theaterVO = dao.hostTheaterDetail(theater_index); // 상영관 상세 정보 가져오기
		MovieVO movieVO = dao.hostMovieDetail(movie_index); // 영화 상세 정보 가져오기
		Theater_scheduleVO scheduleVO = dao.hostScheduleDetail(theater_schedule_index); // 스케줄 상세 정보 가져오기
		
		ArrayList<MovieVO> movieVOS = dao.getMovieING(); // 상영중인 영화 정보
		
		ArrayList<TheaterVO> theaterVOS = dao.getTheaterAllList(); // 모든 상영관 정보
		
		model.addAttribute("theaterVO", theaterVO);
		model.addAttribute("movieVO", movieVO);
		model.addAttribute("scheduleVO", scheduleVO);
		model.addAttribute("movieVOS", movieVOS);
		model.addAttribute("theaterVOS", theaterVOS);
	}

	// 스케줄 수정 처리
	@Override
	public void hostScheduleModPro(HttpServletRequest req, Model model) {
		String startDate = req.getParameter("startDate"); // ~으로 바꿀 스케줄 날짜
		String startTime = req.getParameter("startTime"); // ~으로 바꿀 스케줄 시간
		int theater_index = Integer.parseInt(req.getParameter("theater_index")); // 상영관
		int movie_index = Integer.parseInt(req.getParameter("movie_index")); // 영화
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index")); // 스케줄
		
		String schedule_startTime = startDate+"-"+startTime; // ~으로 바꿀 스케줄 날짜와 시간
		
		int cnt = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schedule_startTime", schedule_startTime); // ~으로 바꿀 스케줄 날짜와 시간
		map.put("theater_schedule_index", theater_schedule_index); // 스케줄
		map.put("theater_index", theater_index); // 상영관
		int sche_chkCnt = dao.chkCnt(map); // 수정하려는 시간에 다른 스케줄이 있는지 확인
		
		if(sche_chkCnt == 0) { // 선택한 시간으로 스케줄 수정이 가능 하면
			map.put("movie_index", movie_index); // 영화
			
			int schedule_MDNstate = 1; // 조조 일반 심야 state
			
			int time = Integer.parseInt(startTime.split(":")[0]); // 시작시간 시:분에서 시 정보만 담음
			if(22<=time && time<=23 || 00<=time && time<=03) { // 스케줄 시간이 심야시간이면
				schedule_MDNstate = 2; // state = 심야
			} else if(04<=time && time<=10) { // 스케줄 시간이 조조시간이면
				schedule_MDNstate = 0; // state = 조조
			}
			map.put("schedule_MDNstate", schedule_MDNstate);
			
			cnt = dao.updateSchedule(map);//스케줄 수정 처리
		}
		model.addAttribute("cnt", cnt);
	}

	// 스케줄 삭제 처리
	@Override
	public void hostScheduleDelPro(HttpServletRequest req, Model model) {
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index")); // 삭제할 스케줄
		int cnt = dao.hostScheduleDelPro(theater_schedule_index); // 스케줄 삭제처리
		
		model.addAttribute("cnt", cnt); 
	}
	
	// 직원 목록
	@Override
	public void hostMovieEmp(HttpServletRequest req, Model model) {
		int cnt = dao.hostMovieEmpCnt(); // 직원 수 확인하기
		
		if(cnt > 0) { // 직원 목록이 존재하면
			ArrayList<Member> vos = dao.hostMovieEmpList(); // 직원 목록을 ArrayList<Member>에 담음
			model.addAttribute("vos", vos);
		}
		model.addAttribute("cnt", cnt);
	}
	
	// 직원 고용 아이디 확인
	@Override
	public void hostMovieEmpChkMemberId(HttpServletRequest req, Model model) {
		String member_id = req.getParameter("member_id"); // 고용할 아이디
		
		int idCnt = dao.hostMovieEmpChkMemberId(member_id); // 고용할 아이디에 해당하는 정보가 있는지 확인 
		
		if(idCnt != 0) { // 고용할 아이디 정보가 있다면
			Member vo = dao.hostMovieEmpInfo(member_id); 	// 아이디로 고용할 직원 정보 가져오기
			vo.setMember_birth(vo.getMember_birth().substring(2,8));
			model.addAttribute("vo", vo);
		}
		model.addAttribute("member_id", member_id);
		model.addAttribute("idCnt", idCnt);
	}

	// 직원 고용 처리
	@Override
	public void hostMovieEmpAddPro(HttpServletRequest req, Model model) {
		String member_id = req.getParameter("member_id"); // 고용할 직원 아이디
		String employee_jumin2 = req.getParameter("employee_jumin2"); // 고용할 직원 주민등록번호 뒷자리
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("employee_jumin2", employee_jumin2);
		
		int cnt = dao.memberChangeState(member_id); // 고용할 직원 아이디의 state를 영화 직원으로 변경
		
		if(cnt == 1) { // 고용할 직원 아이디의 state를 영화 직원으로 변경 성공시
			int insertCnt = dao.insertEmp(map); // 직원목록에 추가 처리
			if(insertCnt==1) {
				cnt = 1;
			}else {
				cnt = 0;
			}
		}
		model.addAttribute("cnt", cnt);
	}

	// 직원 해고
	@Override
	public void hostMovieEmpDel(HttpServletRequest req, Model model) {
		String member_id = req.getParameter("member_id"); // 해고할 직원 아이디
		
		int point = dao.getMemberPoint(member_id); // 회원으로 돌아가기 전 종합포인트 등급 확인
		int member_step = 9; // member step 초기 설정
		
		if(point <= 15000 ) { // 일반회원으로 설정
			member_step = 9;
		}else if(point <= 30000) { // VIP회원으로 설정
			member_step = 10;
		}else if(point <= 45000) { // VVIP회원으로 설정
			member_step = 11;
		}else { //SVIP 회원으로 설정
			member_step = 12;
		}
		
		int cnt = dao.hostMovieEmpDel(member_id); // 직원 목록에서 삭제 처리
		
		if(cnt > 0) { // 직원 목록에서 삭제 처리 성공하면
			Member vo = new Member();
			vo.setMember_id(member_id);
			vo.setMember_step(member_step);
			
			cnt = dao.updateMemberStep(vo); // 해고한 직원 아이디의 step을 변경
		}
		model.addAttribute("cnt", cnt);
	}

	// 예매 상세
	@Override
	public void hostTheaterScheduleDetail(HttpServletRequest req, Model model) {
		TheaterVO vo = null; // 상영관 상세
		ArrayList<Theater_seatVO> seat_vos = null; // 좌석 상세
		
		int theater_index = Integer.parseInt(req.getParameter("theater_index")); // 선택한 상영관
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index")); // 선택한 스케줄
		
		ArrayList<Integer> state = new ArrayList<Integer>(); // 좌석 상태
		
		vo = dao.hostTheaterDetail(theater_index); // 상영관 상세 정보를 담음
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("theater_index", theater_index); // 상영관
		map.put("theater_schedule_index", theater_schedule_index); // 스케줄
		seat_vos = dao.hostTheaterScheduleSeatDetail(map); // 스케줄에 해당하는 좌석 상세 정보를 가져옴
		
		for(Theater_seatVO seat_vo : seat_vos) {  // 좌석 상세정보에서 좌석상태를 state에 배열형태로 담음
			state.add(seat_vo.getSeat_state());
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("seat_vos", seat_vos);
		model.addAttribute("state", state);
		
	}

	// 예매 상세
	@Override
	public MovieResViewVO hostMovieResView(HttpServletRequest req, Model model) {
		MovieResViewVO viewVO = new MovieResViewVO(); // 리턴할 예매정보
		
		TheaterVO vo = null; // 상영관 상세
		ArrayList<Theater_seatVO> seat_vos = null; // 좌석 상세
		
		int theater_index = Integer.parseInt(req.getParameter("theater_index")); // 선택한 상영관
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index")); // 선택한 스케줄
		
		ArrayList<Integer> state = new ArrayList<Integer>(); // 좌석 상태
		
		vo = dao.hostTheaterDetail(theater_index); // 상영관 상세 정보를 담음
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("theater_index", theater_index); // 상영관
		map.put("theater_schedule_index", theater_schedule_index); // 스케줄
		seat_vos = dao.hostTheaterScheduleSeatDetail(map); // 스케줄에 해당하는 좌석 상세 정보를 가져옴
		
		for(Theater_seatVO seat_vo : seat_vos) { // 좌석 상세정보에서 좌석상태를 state에 배열형태로 담음
			state.add(seat_vo.getSeat_state());
		}
		
		viewVO.setTotalRow(vo.getTheater_row()); // 전체 행
		viewVO.setTotalCol(vo.getTheater_col()); // 전체 열
		viewVO.setState(state); // 좌석 상태(배열 형태)
		
		return viewVO;
	}

	// 장르별 영화 관람객 수
	@Override
	public void movieJanreCountChart(HttpServletRequest req, Model model) {
		Map<String , Object> map = new HashMap<String,Object>();
		String[] janre = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}; 
		//mapper에서 불러온 kind와 value가 다건이기때문에 vo형태의 List형으로 받아준다.
		List<HostMovieChartVO> voList = dao.getMovieCountChart(); 
		
		//vo데이터타입 i 에 List데이터들을 한건씩 빼와서 map에 담는다.
		//(map의 key값이 String이기때문에 int형인 kind를 String으로 형변환 한다.
		for (HostMovieChartVO i : voList) {
			map.put(i.getKind() , i.getValue());
		}
		
		// 키 값에 없는 장르의 value는 0으로 초기화 준다.
		for (String s : janre) {
			int chk = 0;
			for(Entry<String, Object> m : map.entrySet()) {
				if(s.equals(m.getKey())) {
					chk = 1;
				}
			}
			if(chk == 0) {
				map.put(s, 0);
			}
		}
		
		model.addAttribute("movieJanreCountChart",map);
		
		map.forEach((k,v)->{
			log.debug(k + " : " + v);
		});
	}

	// 제한 연령별 매출
	@Override
	public void movieAgeChart(HttpServletRequest req, Model model) {
		Map<String , Object> map = new HashMap<String,Object>();
		String[] age = {"0", "12", "15", "19"};
		//mapper에서 불러온 kind와 sum가 다건이기때문에 vo형태의 List형으로 받아준다.
		List<hostTChartVO> voList = dao.movieAgeChart(); 
		
		//vo데이터타입 i 에 List데이터들을 한건씩 빼와서 map에 담아준다.
		//(map의 key값이 String이기때문에 int형인 kind를 String으로 형변환 해준다.
		for (hostTChartVO i : voList) {
			map.put(Integer.toString(i.getKind()) , i.getSum());
		}
		
		// 키 값에 없는 제한연령의 value는 0으로 초기화 준다.
		for (String s : age) {
			int chk = 0;
			for(Entry<String, Object> m : map.entrySet()) {
				if(s.equals(m.getKey())) {
					chk = 1;
				}
			}
			if(chk == 0) {
				map.put(s, 0);
			}
		}
		
		
		model.addAttribute("movieAgeChart",map);
		
		map.forEach((k,v)->{
			log.debug(k + " : " + v);
		});
	}

	// 관람객 성별 수
	@Override
	public void movieSexCountChart(HttpServletRequest req, Model model) {
		Map<String , Object> map = new HashMap<String,Object>();
		String[] sex = {"남", "여"};
		//mapper에서 불러온 kind와 value가 다건이기때문에 vo형태의 List형으로 받아준다.
		List<HostMovieChartVO> voList = dao.movieSexCountChart(); 
		
		//vo데이터타입 i 에 List데이터들을 한건씩 빼와서 map에 담아준다.
		//(map의 key값이 String이기때문에 int형인 kind를 String으로 형변환 해준다.
		for (HostMovieChartVO i : voList) {
			map.put(i.getKind() , i.getValue());
		}
		
		// 키 값에 없는 성별의 value는 0으로 초기화 준다.
		for (String s : sex) {
			int chk = 0;
			for(Entry<String, Object> m : map.entrySet()) {
				if(s.equals(m.getKey())) {
					chk = 1;
				}
			}
			if(chk == 0) {
				map.put(s, 0);
			}
		}
		
		model.addAttribute("movieSexCountChart",map);
		
		map.forEach((k,v)->{
			log.debug(k + " : " + v);
		});
	}

	
	// 워드 클라우드
	// 워드클라우드 리스트
	private static List<WordVO> wordVos;
	
	// 단어 형태소 분석을 처리하는 메서드 (영화 리뷰등록시 같이 적용)
	@Override
	public void wordAnalyzer(HttpServletRequest req, Model model) {
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		StringBuilder sb = new StringBuilder(req.getParameter("review_content"));
		wordExtractAndAnalyze(sb.toString(), movie_index);
	}

	// 형태소 분석된 결과를 데이터베이스에 저장하는 프로세스
	@Override
	public void wordExtractAndAnalyze(String text, int movie_index) {
		log.debug("WordCloud analyze");
		new Runnable() {
			public void run() {

				List<WordVO> wordMap = KoreanParser.getWordsMap(text);
				if(wordMap.isEmpty())return;
				Timestamp time = new Timestamp(System.currentTimeMillis());
				for(WordVO dto : wordMap) {
					
					// 기존에 있는 단어일 경우 카운트 업데이트
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("word", dto.getWord());
					map.put("movie_index", movie_index);
					if(dao.checkWordCloud(map) == 1) {
						dto.setUpdate_date(time);
						dto.setMovie_index(movie_index);
						dao.updateWordCloud(dto);
						// 기존에 없는 단어일 경우 단어와 카운트 추가	
					} else {
						dto.setUpdate_date(time);
						dto.setReg_date(time);
						dto.setMovie_index(movie_index);
						dao.addWordCloud(dto);
					}
				}
				// 워드 클라우드 모델을 refresh 해줌
				setWordList();
				log.debug("WordCloud 분석 종료");
			}
		}.run();
	}

	// 워드클라우드 단어를 가져옴
	public synchronized void setWordList() {
		log.debug("Word Cloud word set request");
		wordVos = dao.getWordCloudModel();
	}
	
	// 영화 리뷰 워드 클라우드
	@Override
	public void movieWordcloud(HttpServletRequest req, Model model) {
		int movie_index = Integer.parseInt(req.getParameter("movie_index")); // get방식으로 영화index를 가져옴
		int countOfWords = 30; // 30개의 워드클라우드 단어를 가져옴
		if(req.getParameter("count")!=null) {
			countOfWords = Integer.parseInt(req.getParameter("count"));
		}
		
		String type = "";
		type = req.getParameter("type");
		
		Map<String, Object> map = new HashMap<>();
		map.put("countOfWords", countOfWords);
		map.put("movie_index", movie_index);
		map.put("type", type);
		
		List<WordVO> wordList = null;
		wordList = dao.searchWordcloud(map);

		model.addAttribute("type", type);
		model.addAttribute("movie_index", movie_index);
		model.addAttribute("wordList", wordList);
		model.addAttribute("listSize", wordList.size());
		model.addAttribute("countOfWords", countOfWords);
	}

	// 직원 고용하기 전 모든 회원 정보 불러오기
	@Override
	public void getMemberList(HttpServletRequest req, Model model) {
		if(dao.getMemberCnt()>0) { // 직원고용하기 전 회원이 1명이라도 존재하는지 체크
			ArrayList<Member> vos = dao.getMemberList(); // 직원 고용하기 전 모든 회원 정보 불러오기
			model.addAttribute("vos", vos);
			model.addAttribute("cnt", 1);
		}else {
			model.addAttribute("cnt", 0);
		}
	}
}

