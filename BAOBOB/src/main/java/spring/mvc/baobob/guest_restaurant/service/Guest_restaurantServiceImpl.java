package spring.mvc.baobob.guest_restaurant.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.baobob.guest_restaurant.persistence.Guest_restaurantDAO;
import spring.mvc.baobob.vo.MenuVO;
import spring.mvc.baobob.vo.RestaurantVO;
import spring.mvc.baobob.vo.ReviewVO;
import spring.mvc.baobob.vo.TableVO;

@Service
public class Guest_restaurantServiceImpl implements Guest_restaurantService{

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired 
	Guest_restaurantDAO dao;
	//==========================================================================
	//============================== 1. 레스토랑 정보 ==============================
	//==========================================================================
	//레스토랑 정보
	@Override
	public void restaurant_imfomation(HttpServletRequest req, Model model) {
		int restaurant_index = Integer.parseInt(req.getParameter("restaurant_index"));
		
		model.addAttribute("restaurant_index", restaurant_index);
	}
	//==========================================================================
	//============================== 2. 레스토랑 메뉴 ==============================
	//==========================================================================
	//레스토랑 메뉴 정보
	@Override
	public void restaurant_menuInfo(HttpServletRequest req, Model model) {
		int cnt = 0;
		int restaurant_index = Integer.parseInt(req.getParameter("restaurant_index"));
		
		cnt = dao.getArticleCnt_menu(restaurant_index);
		
		ArrayList<MenuVO> dtos = dao.getArticle_menu(restaurant_index);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("dtos", dtos);
		model.addAttribute("restaurant_index", restaurant_index);
		
	}
	//==========================================================================
	//============================== 3. 레스토랑 예약 ==============================
	//==========================================================================
	//레스토랑 테이블 확인
	@Override
	public void restaurant_tableList(HttpServletRequest req, Model model) {
		log.debug("===== Service/restaurant_tableList() =====");


		RestaurantVO dto = new RestaurantVO();
		dto = dao.reserv_tableList(Integer.parseInt(req.getParameter("index")));

		TableVO dto2 = new TableVO();
		dto2 = dao.getColRow(Integer.parseInt(req.getParameter("index")));

		int col = dto2.getTable_col() + 1;
		int row = dto2.getTable_row() + 1;

		String info = "";
		int index = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurant_index", Integer.parseInt(req.getParameter("index")));
		map.put("restaurant_table_index", index);

		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				map.replace("restaurant_table_index", index);

				info += dao.getState(map);

				if (!(i + 1 == row && j + 1 == col)) {
					info += ',';
					index++;
				}
			}
		}

		model.addAttribute("dto", dto);
		model.addAttribute("info", info);
		model.addAttribute("col", col);
		model.addAttribute("row", row);
		
		String date = req.getParameter("date");
		model.addAttribute("date", date);

		if (req.getParameter("time") != "") {
			String time = req.getParameter("time");
			model.addAttribute("time", time);
		}
	}

	
	
	
	
	
	//==========================================================================
	//============================== 4. 레스토랑 리뷰 ==============================
	//==========================================================================
	//4-1. 리뷰 리스트
	@Override
	public void reviewList(HttpServletRequest req, Model model) {
		int pageSize = 3; 		// 한 페이지당 출력할 게시글 갯수
		int pageBlock = 5; 		// 한 블럭당 페이지 갯수

		int cnt = 0; 			// 게시글 갯수
		int start = 0; 			// 현재 페이지 게시글 시작 번호
		int end = 0;			// 현재 페이지 게시글 마지막 번호
		int number = 0; 		// 출력할 게시글 번호
		String pageNum = null; 	// 페이지 번호
		int currentPage = 0; 	// 현재 페이지

		int pageCount = 0; 		// 페이지 갯수
		int startPage = 0; 		// 시작페이지
		int endPage = 0; 		// 마지막 페이지

		int restaurant_index = Integer.parseInt(req.getParameter("restaurant_index"));                                                                                                                                                                                                                                                                               // dao 객체생성(싱글톤, 다형성)
		//StockDAO dao = StockDAOImpl.getInstance();
		System.out.println("restaurant_index" + restaurant_index);
		//구매 요청 갯수 구하기
		System.out.println("ArticleCnt() 호출 전 cnt : " + cnt);
		cnt = dao.getReviewCnt(restaurant_index);
		System.out.println("ArticleCnt() 호출 후 cnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지를 1페이지로 설정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);

		start = (currentPage - 1) * pageSize + 1;		// 현재 페이지글 시작 번호

		end = start + pageSize - 1;						// 현재 페이지 게시글 마지막 번호

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		number = cnt - (currentPage - 1) * pageSize;

		System.out.println("number : " + number);
		System.out.println("cnt : " + cnt);
		System.out.println("currentPage : " + currentPage);
		System.out.println("pageSize : " + pageSize);

		
		if (cnt > 0) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			map.put("restaurant_index", restaurant_index);
			
			ArrayList<ReviewVO> dtos = dao.getReviewList(map);
			model.addAttribute("dtos", dtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1;

		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;
		System.out.println("startPage : " + startPage);

		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);

		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("restaurant_index", restaurant_index);
		
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 개수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage);// 현재 페이지
		}
	}
	
	//4-2. 리뷰 작성
	@Override
	public void reviewWrite(HttpServletRequest req, Model model) {
		int restaurant_index = Integer.parseInt(req.getParameter("restaurant_index"));
		String review_grade = req.getParameter("review_grade");
		String review_content = req.getParameter("review_content");
		String member_id = (String) req.getSession().getAttribute("memId");
		//String member_id = "member_id 1";
		
		System.out.println("restaurant_index : " + restaurant_index);
		System.out.println("review_grade : " + review_grade);
		System.out.println("review_content : " + review_content);
		System.out.println("member_id : " + member_id);
		
		ReviewVO dto = new ReviewVO();
		dto.setReview_grade(review_grade);
		dto.setReview_content(review_content);
		//dto.setReview_state(review_state);
		dto.setMember_id(member_id);
		
		//별점/리뷰/ review_grade, review_content, member_id, review_reg_date  
		int insertCnt = dao.insertReviewPro(dto);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurant_index", restaurant_index);
		
		int insertCnt2 = dao.insertRestaurant_review_Pro(map);
		
		System.out.println("===== State : " + dto.getReview_state() +" =====");
		model.addAttribute("restaurant_index", restaurant_index);
		model.addAttribute("insertCnt", insertCnt);
		System.out.println("restaurant_index : "+ restaurant_index);
		System.out.println("insertCnt : "+ insertCnt);
		System.out.println("insertCnt2 : "+ insertCnt2);

	}

	
	//4-3-2. 리뷰 수정
	@Override
	public void review_modifyView(HttpServletRequest req, Model model) {
		System.out.println("===== 4-3-2. 리뷰 수정 review_modifyView ===== ");
		int review_index = Integer.parseInt(req.getParameter("review_index"));
		int restaurant_index = Integer.parseInt(req.getParameter("restaurant_index"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String member_id = (String) req.getSession().getAttribute("memId");
		
		//String member_id = "member_id 1";
		String member_pwd = req.getParameter("member_pwd");
		//1234
		
		System.out.println("review_index : " + review_index);
		System.out.println("member_pwd : " + member_pwd);
		System.out.println("pageNum : " + pageNum);
		//System.out.println("restaurant_index : " + restaurant_index);

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("member_pwd", member_pwd);
		map.put("review_index", review_index);
		
		int selectCnt = dao.pwdCheck(map);
		
		if(selectCnt==1) {
			//댓글정보가져옴
			ReviewVO dto =  dao.getReviewInfo(map);
			
			model.addAttribute("dto", dto);
			System.out.println("selectCnt : " + selectCnt);
			System.out.println(dto.getReview_index());
			System.out.println(dto.getReview_grade());
			System.out.println(dto.getReview_content());
		}
		
		System.out.println("selectCnt : " + selectCnt);
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("restaurant_index", restaurant_index);
		System.out.println("pageNum : " + pageNum);
	}
	
	//4-3-3 리뷰 수정
	@Override
	public void review_modeifyPro(HttpServletRequest req, Model model) {
		System.out.println("===== 리뷰 수정 처리 review_modeifyPro - 시작 =====");
		int restaurant_index = Integer.parseInt(req.getParameter("restaurant_index"));
		int review_index = Integer.parseInt(req.getParameter("review_index"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String member_id = (String) req.getSession().getAttribute("memId");
		//String member_id = "member_id 1";
		//System.out.println("restaurant_index : " + restaurant_index);
		System.out.println("review_index : " + review_index);
		System.out.println("pageNum : " + pageNum);

		ReviewVO dto = new ReviewVO();
		dto.setMember_id(member_id);
		dto.setReview_index(review_index);
		dto.setReview_grade(req.getParameter("review_grade"));
		dto.setReview_content(req.getParameter("review_content"));
		System.out.println("업데이트 결과(전)!!");
		System.out.println("=========id : " + dto.getMember_id());
		System.out.println("=========grade : " + dto.getReview_grade());
		System.out.println("=========content : " + dto.getReview_content());

		
		int cnt = dao.updateReviewPro(dto);
		System.out.println("업데이트 결과(후)!!cnt : " + cnt);
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("restaurant_index", restaurant_index);

	}
	
	//4-4. 리뷰 삭제
	@Override
	public void reviewDeletePro(HttpServletRequest req, Model model) {
		int restaurant_index = Integer.parseInt(req.getParameter("restaurant_index"));
		int review_index = Integer.parseInt(req.getParameter("review_index"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		//String member_id = "member_id 1";
		String member_id = (String) req.getSession().getAttribute("memId");
		String member_pwd = req.getParameter("member_pwd");
		//1234
		
		System.out.println("review_index : " + review_index);
		System.out.println("member_pwd : " + member_pwd);
		System.out.println("pageNum : " + pageNum);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("member_pwd", member_pwd);
		map.put("review_index", review_index);
		
		int selectCnt = dao.pwdCheck(map);
		//selectCnt 0: 아이디 X, -1 : 아이디O 비번X, 1 : 아이디 비번 일치
		if(selectCnt==1) {
			//댓글정보가져옴
			int deleteCnt = dao.delete_ReviewPro(map);
			
			model.addAttribute("deleteCnt", deleteCnt);
			//model.addAttribute("dto", review_index);
			System.out.println("deleteCnt : " + deleteCnt);
		}
		
		System.out.println("selectCnt : " + selectCnt);
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("restaurant_index", restaurant_index);
		System.out.println("pageNum : " + pageNum);

		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("restaurant_index", restaurant_index);
	}
	
	
	
	
	
	
	
	
	
}
