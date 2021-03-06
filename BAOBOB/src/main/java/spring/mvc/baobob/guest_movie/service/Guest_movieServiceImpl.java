package spring.mvc.baobob.guest_movie.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.baobob.guest_movie.persistence.Guest_movieDAO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieFinderVO;
import spring.mvc.baobob.vo.MovieResViewVO;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.ReviewVO;
import spring.mvc.baobob.vo.TheaterVO;
import spring.mvc.baobob.vo.Theater_scheduleVO;
import spring.mvc.baobob.vo.Theater_seatVO;

@Service
public class Guest_movieServiceImpl implements Guest_movieService{

	@Autowired
	Guest_movieDAO gmdao;

	//영화 메인
	@Override
	public void movieMain(HttpServletRequest req, Model model) {
		ArrayList<MovieVO> rankList = gmdao.mainMovieRank();
		model.addAttribute("rank", rankList);
		
		int movieCnt = gmdao.mainMovieTheaterCnt();
		if(movieCnt > 0) {
			String pageNum = req.getParameter("pageNum");
			if(pageNum == null) {pageNum = "1";}
			int current = Integer.parseInt(pageNum);
			
			int postSize = 5;
			int start = (current - 1) * postSize + 1;
			int end = start + postSize - 1;
			if(end > movieCnt) { end = movieCnt; }
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end",  end);
			ArrayList<MovieVO> movieList = gmdao.mainMovieTheater(map);
			model.addAttribute("start", start);
			model.addAttribute("end", end);
			model.addAttribute("movieList", movieList);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("movieCnt", movieCnt);
			model.addAttribute("postSize", postSize);
		}
	}
	
	//영화리스트
	@Override
	public void movieList(HttpServletRequest req, Model model) {
		
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
		
		int movie_state = 1;
		
		movie_state = Integer.parseInt(req.getParameter("movie_state"));
		
		// movie_state(상영예정:0, 상영 중:1, 상영종료:2)
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movie_state", movie_state);
		
		// movie_state에 따른 영화 갯수 구하기
		if(movie_state == 0) { //상영예정
			cnt = gmdao.getMovieStateCnt(map);
		}else if(movie_state == 1){ //movie_state == 1 상영중
			cnt = gmdao.getMovieStateCnt(map);
		}else { //movie_state == 2 상영종료
			cnt = gmdao.getMovieStateCnt(map);
		}
		System.out.println("영화갯수: " + cnt);
		 
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) { //페이지가 없으면 
			pageNum = "1"; //첫페이지를 1페이지로 설정
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재페이지
		pageCount = (cnt / pageSize) + ((cnt % pageSize > 0) ? 1 : 0); // 페이지 갯수(나머지가 있으면=> 페이지 갯수+1)
		start = ((currentPage-1) * pageSize) + 1; // 현재 페이지에  DB에서 뽑아올 시작번호
		end = start + pageSize - 1;// 현재 페이지에 DB에서 뽑아올 끝번호
		
		if(end > cnt) end = cnt;
		
		number = (currentPage - 1) * pageSize; // 출력할 글번호(삭제해도 글번호 나열되게).. 최신글 (큰페이지)가 1p 

		if(cnt > 0) {
			//게시글 목록 조회
			map.put("start", start);
			map.put("end", end);
			ArrayList<MovieVO> movies = null;
			// movie_state에 따른 영화 리스트 구하기
			if(movie_state == 0) { //상영예정
				movies = gmdao.getMovieStateMovies(map);
			}else if(movie_state == 1){ //movie_state == 1 상영중
				movies = gmdao.getMovieStateMovies(map);
			}else { //movie_state == 2 상영종료
				movies = gmdao.getMovieStateMovies(map);
			}
			
			model.addAttribute("movies", movies); //큰 바구니 : 게시글 목록   cf)작은바구니: 게시글 1건
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1; //(5/3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock; // (5%3) == 0 
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);			// 글갯수
		model.addAttribute("number", number);	// 글번호
		model.addAttribute("pageNum", pageNum);	// 페이지번호
		
		if(cnt > 0) {
			model.addAttribute("movie_state", movie_state);// 영화상태
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage);// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);// 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);// 페이지 갯수
			model.addAttribute("currentPage", currentPage);// 현재 페이지
		}
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
		pageCount = (cnt / pageSize) + ((cnt % pageSize > 0) ? 1 : 0); // 페이지 갯수(나머지가 있으면=> 페이지 갯수+1)
		start = ((currentPage-1) * pageSize) + 1; // 현재 페이지에  DB에서 뽑아올 시작번호
		end = start + pageSize - 1;// 현재 페이지에 DB에서 뽑아올 끝번호
		
		if(end > cnt) end = cnt;
		
		//number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호(삭제해도 글번호 나열되게).. 최신글 (큰페이지)가 1p 

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

	//movie정보 이용(+ 좋아요 갯수 + 예매율)
	@Override
	public void movieInfo(HttpServletRequest req, Model model) {
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		
		MovieVO movie = gmdao.getMovie(movie_index);
		
		if(movie != null) {
			model.addAttribute("movie",movie);
			//전체예매수, 해당 index예매수, 예매율 구하기
			int sumReservation = 0;
			int reservation = 0;
			float reservationPercent = 0;
			
			if(gmdao.allMovieCount()!=0) {
				sumReservation = gmdao.allMovieCount();
				reservation = gmdao.indexMovieCount(movie_index);
				reservationPercent = reservation*100/sumReservation;
			}
			String str_reservationPercent = String.format("%.2f", reservationPercent);
			model.addAttribute("reservationPercent", str_reservationPercent);
			
			String strLikeCnt = gmdao.movieLike(movie_index);
			if(strLikeCnt != null) {
				//좋아요 퍼센트 구하기
				int reviewCnt = gmdao.getMovieReviewCnt(movie_index);
				int likeCnt = Integer.parseInt(strLikeCnt);
				int likePercent = 0;
				if(reviewCnt == 0) {
					likePercent = 0;
				}else {
					likePercent = (int)((likeCnt*100)/reviewCnt);
				}
				
				System.out.println("likePercent:" + likePercent);
				model.addAttribute("likePercent", likePercent);
			}
		}
	}

	//검색결과 리스트
	@Override
	public void searchResult(HttpServletRequest req, Model model) {
		//정보 받기
		String keyword = req.getParameter("keyword");
		String sel = req.getParameter("sel");
		System.out.println("keyword키워드!!!!!!!!!"+ keyword);
		String[] str_movie_janre_arr = req.getParameterValues("movie_janre");
		String[] str_movie_age_arr = req.getParameterValues("movie_age");
		String[] movie_country = req.getParameterValues("movie_country");
		
//		String str_movie_janre_info = "";
//		String str_movie_age_info = "";
//		String str_movie_country_info = "";
		
		//장르 int형으로 바꿔주기
		int[] movie_janre = new int[str_movie_janre_arr.length];
		for(int i =0; i<movie_janre.length; i++){
			movie_janre[i]=Integer.parseInt(str_movie_janre_arr[i]);
//			if(str_movie_janre_arr[i]!="-1") {
//				if(i == (movie_janre.length-1)) {
//					str_movie_janre_info += str_movie_janre_arr[i];
//				}else {
//					str_movie_janre_info += str_movie_janre_arr[i] + ",";
//				}
//			}
		};
		//나이 int형으로 바꿔주기
		int[] movie_age = new int[str_movie_age_arr.length];
		for(int i =0; i<movie_age.length; i++){
			movie_age[i]=Integer.parseInt(str_movie_age_arr[i]);
//			if(str_movie_age_arr[i]!="-1") {
//				if(i == (str_movie_age_arr.length-1)) {
//					str_movie_age_info += str_movie_age_arr[i];
//				}else {
//					str_movie_age_info += str_movie_age_arr[i] + ",";
//				}
//			}
		};
		//country_info만들기
//		for(int i =0; i<movie_country.length; i++){
//			if(movie_country[i]!="-1") {
//				if(i == (movie_country.length-1)) {
//					str_movie_country_info += movie_country[i];
//				}else {
//					str_movie_country_info += movie_country[i] + ",";
//				}
//			}
//		};
		
//		model.addAttribute("str_movie_janre_info",str_movie_janre_info);
//		model.addAttribute("str_movie_age_info",str_movie_age_info);
//		model.addAttribute("str_movie_country_info",str_movie_country_info);
		
		//검색결과 리스트 관련 변수
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
		
		//검색 정보 보낼 곳
		MovieFinderVO movieFinderInfo = new MovieFinderVO();
		movieFinderInfo.setKeyword(keyword);
		movieFinderInfo.setSel(sel);
		movieFinderInfo.setMovie_janre(movie_janre);
		movieFinderInfo.setMovie_age(movie_age);
		movieFinderInfo.setMovie_country(movie_country);

		// 영화 갯수 구하기
		cnt = gmdao.movieFinderResultCnt(movieFinderInfo);
		System.out.println("영화갯수: " + cnt);
		 
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) { //페이지가 없으면 
			pageNum = "1"; //첫페이지를 1페이지로 설정
		}
		currentPage = Integer.parseInt(pageNum); // 현재페이지
		pageCount = (cnt / pageSize) + ((cnt % pageSize > 0) ? 1 : 0); // 페이지 갯수(나머지가 있으면=> 페이지 갯수+1)
		start = ((currentPage-1) * pageSize) + 1; // 현재 페이지에  DB에서 뽑아올 시작번호
		end = start + pageSize - 1;// 현재 페이지에 DB에서 뽑아올 끝번호
		if(end > cnt) {
			end = cnt;
		}
		number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호(삭제해도 글번호 나열되게).. 최신글 (큰페이지)가 1p 

		if(cnt > 0) {
			movieFinderInfo.setStart(start);
			movieFinderInfo.setEnd(end);
			//검색결과 받을 곳
			ArrayList<MovieVO> movies = gmdao.movieFinderResult(movieFinderInfo);
			model.addAttribute("movies", movies); //큰 바구니 : 게시글 목록   cf)작은바구니: 게시글 1건
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1; //(5/3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock; // (5%3) == 0 
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);			// 글갯수
		model.addAttribute("number", number);		// 글번호
		model.addAttribute("pageNum", pageNum);	// 페이지번호
		model.addAttribute("movieFinder", movieFinderInfo);// 검색조건
		
		if(cnt > 0) {
			//검색 조건
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage);// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);// 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);// 페이지 갯수
			model.addAttribute("currentPage", currentPage);// 현재 페이지
		}
		
	}

	//리뷰 리스트
	@Override
	public void reviewList(HttpServletRequest req, Model model) {
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
		
		
		// 해당 영화 리뷰 갯수 구하기
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		cnt = gmdao.getMovieReviewCnt(movie_index);
		System.out.println("리뷰갯수: " + cnt);
		 
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) { //페이지가 없으면 
			pageNum = "1"; //첫페이지를 1페이지로 설정
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재페이지
		
		// pageCount = (12 / 5) + (1) // 나머지2건이 1페이지로 할당되므로 총 3페이지가 된다.
		pageCount = (cnt / pageSize) + ((cnt % pageSize > 0) ? 1 : 0); // 페이지 갯수(나머지가 있으면=> 페이지 갯수+1)
		start = ((currentPage-1) * pageSize) + 1; // 현재 페이지에  DB에서 뽑아올 시작번호
		end = start + pageSize - 1;// 현재 페이지에 DB에서 뽑아올 끝번호
		
		if(end > cnt) end = cnt;
		number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호(삭제해도 글번호 나열되게).. 최신글 (큰페이지)가 1p 

		if(cnt > 0) {
			//게시글 목록 조회
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("movie_index", movie_index);
			
			ArrayList<ReviewVO> movieReviews = gmdao.getAllMovieReviews(map);
			model.addAttribute("reviews", movieReviews); //큰 바구니 : 게시글 목록   cf)작은바구니: 게시글 1건
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
		
	//영화 리뷰작성처리
	@Override
	public void movieReviewPro(HttpServletRequest req, Model model) {
		ReviewVO review = new ReviewVO();
		
		//dao나눠서 처리하기 위해 pro로 구분(1일땐 작성/ 2일땐 수정 / 3일때 삭제)
		int pro = Integer.parseInt(req.getParameter("pro"));
		
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		int cnt = 0;
		
		if(pro==1) { //작성일시
			String review_grade = req.getParameter("review_grade");
			String member_id = req.getParameter("member_id");
			String review_content = req.getParameter("review_content");
			
			//1. 영화에 한사람이 하나의 리뷰만 가능
			Map<String,Object> map1 = new HashMap<String,Object>();
			map1.put("member_id", member_id);
			map1.put("movie_index", movie_index);
			
			//2. review_tbl insert
			review.setReview_content(review_content);
			review.setReview_grade(review_grade);
			review.setMember_id(member_id);
			review.setReview_state(1);
			cnt = gmdao.insertReview(review);
			
			//3. movie_review_tbl insert
			if(cnt==1) {//review 입력 성공하면 reviewIndex currval
				Map<String,Object> map2 = new HashMap<String,Object>();
				map2.put("movie_index", movie_index);
				cnt = gmdao.insertMovieReview(map2);
				
			}else {// 실패
				cnt = 0;
			}
			
		}else{// 수정,삭제 일시
			int review_index = Integer.parseInt(req.getParameter("review_index"));
			
			if(pro==2) { //수정일때
				String review_grade = req.getParameter("review_grade");
				String member_id = req.getParameter("member_id");
				String review_content = req.getParameter("review_content");
				
				//1. review_tbl update
				review.setReview_index(review_index);
				review.setReview_content(review_content);
				review.setReview_grade(review_grade);
				review.setMember_id(member_id);
				review.setReview_state(1);
				cnt = gmdao.updateReview(review);
				
			}else {//pro==3 삭제일때
				//1. movie_review_tbl 먼저 삭제
				Map<String,Object> map2 = new HashMap<String,Object>();
				map2.put("movie_index", movie_index);
				map2.put("review_index", review_index);
				cnt = gmdao.deleteMovieReview(map2);
				
				//2. review_tbl 삭제(pk인 review_index만 있으면 됨) 
				if(cnt==1) {//review 입력 성공하면 
					cnt = gmdao.deleteReview(review_index);
					
				}else {// 실패
					cnt = 0;
				}
						
			}
		}
		
		model.addAttribute("pro", pro);
		model.addAttribute("cnt", cnt);
		
	}

	//리뷰 썼었는지 체크
	@Override
	public void movieReviewCheck(HttpServletRequest req, Model model) {
		String member_id = (String) req.getSession().getAttribute("memId");
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		System.out.println("member_id: "+ member_id);
		int cnt = 0;
		System.out.println("movie_index: "+ movie_index);
		
		//1. 영화에 한사람이 하나의 리뷰만 가능
		Map<String,Object> map1 = new HashMap<String,Object>();
		map1.put("member_id", member_id);
		map1.put("movie_index", movie_index);
		cnt = gmdao.movieReviewCheck(map1);
		
		if(cnt>0) { //이미 해당영화에 리뷰를 적은경우
			cnt = 0;
		}else { //리뷰 안적은 경우
			cnt = 1;
		}
		model.addAttribute("cnt", cnt);
	}

	//예매창에 띄울 영화리스트(상영종료인 거 빼고)
	@Override
	public void reserveMovieList(HttpServletRequest req, Model model) {
		
		int cnt = 0;// 영화 갯수
		
		//전체 영화 갯수
		cnt = gmdao.getMovieCnt();
		
		if(cnt > 0) {
			//상영관 갯수
			int theaterCnt = gmdao.theaterCnt();
			int[] theaterSeats = new int[theaterCnt+1];
			
			//각 상영관 마다의 총좌석 갯수 구하기
			for(int i=1; i<=theaterCnt; i++) {
				theaterSeats[i] = gmdao.theaterSeats(i);
			}
			model.addAttribute("theaterSeats", theaterSeats);
			
			//게시글 목록 조회
			ArrayList<MovieVO> movies = null;
			// movie_state에 따른 영화 리스트 구하기
			movies = gmdao.getAllReserveMovies();
			model.addAttribute("movies", movies); 
		}
		
		model.addAttribute("cnt", cnt);//전체 영화갯수
		
	}

	//영화 되는 날짜, 상영관 정보
	@Override
	public void reserveDateList(HttpServletRequest req, Model model) {
		int cnt = 0;// 날짜 갯수
		
		int movie_index = Integer.parseInt(req.getParameter("movie"));
		int plusDay = Integer.parseInt(req.getParameter("plusDay"));
		
		//영화,날짜별 스케줄 갯수
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movie_index", movie_index);
		map.put("plusDay", plusDay);
		cnt = gmdao.getDateCnt(map);
		
		if(cnt > 0) {
			
			//영화별 되는 날짜, 상영관 정보 담을 곳
			ArrayList<Theater_scheduleVO> schedules = null;
			schedules = gmdao.getAllReserveSchedules(map);
			model.addAttribute("schedules", schedules); 
		}
		
		model.addAttribute("cnt", cnt);//전체 영화갯수
	}

	//영화 정보들(예매에서 Ajax로 받을 값들)
	@Override
	public void reserveMovieResult(HttpServletRequest req, Model model) {
		
		//#movieInfo로 갈 정보
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		MovieVO movie = gmdao.getMovie(movie_index);
		model.addAttribute("movie", movie);
	}

	//스케줄 정보들(예매에서 Ajax로 받을 값들)
	@Override
	public void reserveScheduleResult(HttpServletRequest req, Model model) {

		//#scheduleInfo로 갈정보
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index"));
		Theater_scheduleVO schedule = gmdao.getSchedule(theater_schedule_index);
		model.addAttribute("schedule", schedule);
	}

	//좌석도 보여주기
	/*@Override
	public MovieResViewVO movieResView(HttpServletRequest req, Model model) {
		// 좌석도 정보를 가질 바구니 생성
		MovieResViewVO seatInfo = new MovieResViewVO();
		
		TheaterVO theater = null;
		ArrayList<Theater_seatVO> seats = null;
		
		int theater_index = Integer.parseInt(req.getParameter("theater_index"));
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index"));
		
		//좌석 상태 정보를 담을 바구니
		ArrayList<Integer> state = new ArrayList<Integer>();
		
		//극장정보 가져오기
		theater = gmdao.theaterDetail(theater_index);
		System.out.println("theater_col " + theater.getTheater_col());
		System.out.println("theater_row " + theater.getTheater_row());

		//해당 스케줄 상영관(theater_schedule_index)의 좌석 상태 가져오기
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("theater_index", theater_index);
		map.put("theater_schedule_index", theater_schedule_index);
		seats = gmdao.theaterSeatDetail(map);
		
		//좌석상태만 넘겨주기
		for(Theater_seatVO seat : seats) {
			state.add(seat.getSeat_state());
		}
		//좌석 정보에 극장의 row, col의 크기, 좌석상태들을 넘겨준다.
		seatInfo.setTotalRow(theater.getTheater_row());
		seatInfo.setTotalCol(theater.getTheater_col());
		seatInfo.setState(state);
		
		System.out.println("=========================");
		System.out.println("state : " + state);
		System.out.println("=========================");
		
		return seatInfo;
	}*/

	//좌석도 뿌려주기,선택
	@Override
	public void seatSelect(HttpServletRequest req, Model model) {
		// 좌석도 정보를 가질 바구니 생성
		MovieResViewVO seatInfo = new MovieResViewVO();
		
		TheaterVO theater = null;
		ArrayList<Theater_seatVO> seats = null;
		
		int theater_index = Integer.parseInt(req.getParameter("theater_index"));
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index"));
		
		//좌석 상태 정보를 담을 바구니
		ArrayList<Integer> state = new ArrayList<Integer>();
		//좌석 index정보를 담을 바구니
		ArrayList<Integer> seat_index = new ArrayList<Integer>();
		
		//극장정보 가져오기
		theater = gmdao.theaterDetail(theater_index);
		System.out.println("theater_col " + theater.getTheater_col());
		System.out.println("theater_row " + theater.getTheater_row());

		//해당 스케줄 상영관(theater_schedule_index)의 좌석 상태 가져오기
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("theater_index", theater_index);
		map.put("theater_schedule_index", theater_schedule_index);
		seats = gmdao.theaterSeatDetail(map);
		
		//좌석상태만 넘겨주기
		for(Theater_seatVO seat : seats) {
			state.add(seat.getSeat_state());
			seat_index.add(seat.getSeat_index());
		}
		//좌석 정보에 극장의 row, col의 크기, 좌석상태들을 넘겨준다.
		seatInfo.setTotalRow(theater.getTheater_row());
		seatInfo.setTotalCol(theater.getTheater_col());
		seatInfo.setState(state);
		seatInfo.setSeat_index(seat_index);
		
		System.out.println("=========================");
		System.out.println("state : " + state);
		System.out.println("=========================");
		
		model.addAttribute("seatInfo", seatInfo);
		
	}
	
	//한 좌석 정보
	@Override
	public void seatInfo(HttpServletRequest req, Model model) {
		String[] str_seat_checked_arr = req.getParameterValues("seat_checked_arr");
		System.out.println("seat_checked_arr = " + str_seat_checked_arr); //seat_checked_arr
		int size = str_seat_checked_arr.length;
		
		//한개 좌석의 정보
		Theater_seatVO seat = new Theater_seatVO();
		//선택된 여러개의 좌석 정보
		ArrayList<Theater_seatVO> seats = new ArrayList<Theater_seatVO>();
		
		int[] seat_index_arr = new int[size];
		for(int i=0; i<size; i++) {
			seat_index_arr[i] = Integer.parseInt(str_seat_checked_arr[i]);
			
			if(seat_index_arr[i]!=-1) {
				//한개 좌석의 정보 바구니에 담기
				seat = gmdao.seatInfo(seat_index_arr[i]);
				//좌석의 정보들 ArrayList에 담기
				seats.add(seat);
			}
		}
		
		model.addAttribute("seats", seats);
	}
	
	
	//결제창으로 넘어가는 부분
	@Override
	public void seatInfos(HttpServletRequest req, Model model) {
		int adultCnt = Integer.parseInt(req.getParameter("adultCnt"));
		int teenagerCnt = Integer.parseInt(req.getParameter("teenagerCnt"));
		String str_seat_index_info = req.getParameter("seat_index_arr");
		String[] str_seat_index_arr = str_seat_index_info.split(",");
		String member_id = (String) req.getSession().getAttribute("memId");
		
		int size = str_seat_index_arr.length;
		//한개 좌석의 정보
		Theater_seatVO seat = new Theater_seatVO();
		//선택된 여러개의 좌석 정보
		ArrayList<Theater_seatVO> seats = new ArrayList<Theater_seatVO>();
				
		int[] seat_index_arr = new int[size];
		
		for(int i=0; i<size; i++) {
			seat_index_arr[i] = Integer.parseInt(str_seat_index_arr[i]);
			
			if(seat_index_arr[i]!=-1) {
				//한개 좌석의 정보 바구니에 담기
				seat = gmdao.seatInfo(seat_index_arr[i]);
				//좌석의 정보들 ArrayList에 담기
				seats.add(seat);
			}
		}
		int theater_schedule_index = seat.getTheater_schedule_index();
		
		//id관련된 멤버 정보 가져오기(포인트 등)
		Member member = new Member();
		member = gmdao.getMemberInfo(member_id);
		
		//스케줄 정보 가져오기
		Theater_scheduleVO schedule = gmdao.getSchedule(theater_schedule_index);
		int movie_index = schedule.getMovie_index();
		
		//영화 정보 가져오기
		MovieVO movie = gmdao.getMovie(movie_index);
		
		model.addAttribute("str_seat_index_info", str_seat_index_info);//seat_index string형으로 합쳐있는것
		model.addAttribute("schedule", schedule);
		model.addAttribute("movie", movie);
		model.addAttribute("member", member);
		model.addAttribute("seats", seats);
		model.addAttribute("adultCnt", adultCnt);
		model.addAttribute("teenagerCnt", teenagerCnt);
		model.addAttribute("theater_schedule_index", theater_schedule_index);
		
	}

	//예매최종처리
	@Override
	public void reservationPro(HttpServletRequest req, Model model) {
		
		String str_seat_index_info = req.getParameter("str_seat_index_info");
		int theater_schedule_index = Integer.parseInt(req.getParameter("theater_schedule_index"));
		int totalCnt = Integer.parseInt(req.getParameter("totalCnt"));
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		String movie_history_price = req.getParameter("movie_history_price");
		int member_point = Integer.parseInt(req.getParameter("member_point"));
		String member_id = (String) req.getSession().getAttribute("memId");
		
		System.out.println(str_seat_index_info + theater_schedule_index + totalCnt + movie_index + "결제금액:" + movie_history_price + "사용포인트:" + member_point +"==10%:"+(int)(Double.parseDouble(movie_history_price)*0.1));
		
		String[] str_seat_index_arr = str_seat_index_info.split(",");
		
		int size = str_seat_index_arr.length;
		int[] seat_index_arr = new int[size];
		
		int cnt = 0; //insert용 cnt
		int updateSeatCnt = 0; //for문 돌리는 seat_state
		int updateCnt = 0; // update용 cnt
		int updatePoint = 0; // member_point 썼을때
		int updateStepCnt = 0; //등업용
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theater_schedule_index", theater_schedule_index);
		map.put("totalCnt", totalCnt);
		map.put("movie_index", movie_index);
		map.put("movie_history_price", Integer.parseInt(movie_history_price));
		map.put("member_point", member_point);
		map.put("member_id", member_id);
		map.put("movie_history_price_10perc", (int)(Double.parseDouble(movie_history_price)*0.1));
		
		//1. Insert history_tbl
		if(gmdao.insertHistory(member_id)>=1) {
			//2. Insert movie_history_tbl
			if(gmdao.insertMovieHistory(map)>=1) {
				 cnt = 1;
			}else {
				cnt = 0;
			}
		}else {
			cnt = 0;
		}
		
		Map <String,Object> map2 = new HashMap<String,Object>();
		map2.put("member_id", member_id);
		map2.put("seat_index", 0);
		
		//3. Update theater_seat_tbl 해당 seat_index의 seat_state=6 변경(좌석 상태 예약석으로 변경)
		for(int i=0; i<size; i++) {
			if(seat_index_arr[i]!=-1) {
				seat_index_arr[i] = Integer.parseInt(str_seat_index_arr[i]);
				map2.replace("seat_index", seat_index_arr[i]); //값 바꿔줌
				updateSeatCnt = gmdao.updateSeatState(map2);
				if(updateSeatCnt == 0) { //0일때만 보내줌
					model.addAttribute("updateSeatCnt",updateSeatCnt);
				}
			}
		}
		
		//4. Update theater_schedule_tbl schedule_empty_seat= -totalCnt해주기(빈자리수 감소)
		if(gmdao.updateEmptySeat(map)>=1) {
			//5. Update movie_tbl  movie_count + totalCnt해주기(영화관람객수 증가)
			if(gmdao.updateMovieCount(map)>=1) {
				//6. Update member_tbl member_point, member_cumpoint (결제시 증가)
				if(gmdao.updateIncreasePoint(map)>=1) {
					updateCnt = 1;
				}else {
					updateCnt = 0;
				}
			}else {
				updateCnt = 0;
			}
		}else {
			updateCnt = 0;
		}
		
		System.out.println("member_point----->"+member_point);
		//7. Update member_tbl member_point (포인트 사용했을시 감소)
		if(member_point>0) { //포인트 썼을때
			if(gmdao.updateDecreasePoint(map)>=1) {
				updatePoint = 1;
			}else {
				updatePoint = 0;
			}
		}else { //포인트 안 썼을때
			updatePoint = 1; //6번까지 성공했으므로 성공
		}
		
		//8. SELECT member_tble에서 member_cumPoint확인
		int member_cumPoint = gmdao.getMemberCumPoint(member_id);
		System.out.println("member_cumPoint------>"+member_cumPoint);
		int member_step = 9;
		//9. UPDATE member_step 8번 확인해서 if문으로 체크해서 등업!!
		if(member_cumPoint<=15000) {
			member_step = 9;
		}else if(member_cumPoint<=30000){
			member_step = 10;
		}else if(member_cumPoint<=45000) {
			member_step = 11;
		}else {
			member_step = 12;
		}
		map.put("member_step", member_step);
		
		updateStepCnt = gmdao.updateMemberStep(map);
		
		model.addAttribute("cnt",cnt);
		model.addAttribute("updateCnt",updateCnt);
		model.addAttribute("updatePoint", updatePoint);
		model.addAttribute("updateStepCnt",updateStepCnt);
	}
	//영화- 상세정보에서 wishList확인(하트 색 결정)
	@Override
	public void checkWishList(HttpServletRequest req, Model model) {
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		String member_id = (String)req.getSession().getAttribute("memId");
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("movie_index", movie_index);
		map.put("member_id", member_id);
		
		int wishCnt = gmdao.checkWishCnt(map);
		System.out.println("%%%%%% wishCnt:-====>"+wishCnt);
		model.addAttribute("wishCnt", wishCnt);
	}

	

	
	

	
	
	
	
}
