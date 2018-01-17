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
import spring.mvc.baobob.vo.MovieReviewVO;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.ReviewVO;

@Service
public class Guest_movieServiceImpl implements Guest_movieService{

	@Autowired
	Guest_movieDAO gmdao;

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
		
		// pageCount = (12 / 5) + (1) // 나머지2건이 1페이지로 할당되므로 총 3페이지가 된다.
		pageCount = (cnt / pageSize) + ((cnt % pageSize > 0) ? 1 : 0); // 페이지 갯수(나머지가 있으면=> 페이지 갯수+1)
		
		start = ((currentPage-1) * pageSize) + 1; // 현재 페이지에  DB에서 뽑아올 시작번호
		
		end = start + pageSize - 1;// 현재 페이지에 DB에서 뽑아올 끝번호
		//end = currentPage * pageSize;
		
		/*System.out.println("start: " + start);
		System.out.println("end: " + end);*/
		
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

	//movie정보 이용(+ 좋아요 갯수)
	@Override
	public void movieInfo(HttpServletRequest req, Model model) {
		int movie_index = Integer.parseInt(req.getParameter("movie_index"));
		
		MovieVO movie = gmdao.getMovie(movie_index);
		
		System.out.println(movie.getMovie_trailer());
		if(movie != null) {
			model.addAttribute("movie",movie);
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
		
		String[] str_movie_janre = req.getParameterValues("movie_janre");
		String[] str_movie_age = req.getParameterValues("movie_age");
		String[] movie_country = req.getParameterValues("movie_country");
		
		int[] movie_janre = new int[str_movie_janre.length];

		for(int i =0; i<movie_janre.length; i++){
			movie_janre[i]=Integer.parseInt(str_movie_janre[i]);
		};
		
		int[] movie_age = new int[str_movie_age.length];

		for(int i =0; i<movie_age.length; i++){
			movie_age[i]=Integer.parseInt(str_movie_age[i]);
		};
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("sel", sel);
		model.addAttribute("movie_janre", movie_janre);
		model.addAttribute("movie_age", movie_age);
		model.addAttribute("movie_country", movie_country);
		
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
		
		//grade불러오기
		
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

	
	
	
	
}
