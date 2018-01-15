package spring.mvc.baobob.guest_restaurant.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.baobob.guest_restaurant.service.Guest_restaurantService;

@Controller
public class Guest_restaurantController {
	
	@Autowired 
	Guest_restaurantService service;
	
	//private Logger log = Logger.getLogger(this.getClass());

	//==========================================================================
	//=============================== 레스토랑 선택  ===============================
	//==========================================================================
	//레스토랑 선택 페이지(레스토랑 선택)review_date
	@RequestMapping("guestRestaurantList")
	public String guestRestaurantList(HttpServletRequest req, Model model) {
		//log.debug("===== Guest_restaurantController/guestRestaurantList() =====");
		System.out.println("/메인화면");
		//정보 불러오기
	
		return "guest/guest_restaurant/guestRestaurantList";
	}
	
	//==========================================================================
	//===============================  레스토랑 메인  ==============================
	//==========================================================================
	//레스토랑 메인페이지
	@RequestMapping("guestRestaurantMain")//response
	public String guestRestaurantMain(HttpServletRequest req, Model model) {
		//log.debug("===== Guest_restaurantController/guestRestaurantMain() =====");
		System.out.println("/guestRestaurantMain");

		//식당 정보를 불러와야함
		//service.restaurant_imfomation(req, model);
		int restaurant_index = Integer.parseInt(req.getParameter("restaurant_index"));
		System.out.println("restaurant_index : "+ restaurant_index);
		model.addAttribute("restaurant_index", restaurant_index);
		return "guest/guest_restaurant/guestRestaurantMain";
	}
		
	
	//==========================================================================
	//============================== 1. 레스토랑 정보 ==============================
	//==========================================================================
	//1. 레스토랑 정보
	@RequestMapping("guestRestaurant_info")
	public String guestRestaurant_info(HttpServletRequest req, Model model) {
		//log.debug("===== Guest_restaurantController/guestRestaurantMain() =====");

		
		return "guest/guest_restaurant/info/guestRestaurant_info";
	}
	
	//==========================================================================
	//============================== 2. 레스토랑 메뉴 ==============================
	//==========================================================================
	//2. 레스토랑 메뉴-테이블 restaurant_menu_tbl
	@RequestMapping("guestRestaurant_menu")
	public String guestRestaurantMenu(HttpServletRequest req, Model model) {
		//log.debug("===== Guest_restaurantController/guestRestaurantMain() =====");

		service.restaurant_menuInfo(req, model);
		
		return "guest/guest_restaurant/menu/guestRestaurant_menu";
	}
	
	
	
	
	//==========================================================================
	//============================== 3. 레스토랑 예약 ==============================
	//==========================================================================
	//3-1. 레스토랑 예약화면-1(인원선택/테이블/날짜)
	@RequestMapping("guestRestaurant_reserv")
	public String guestRestaurantReserv(HttpServletRequest req, Model model) {
		//log.debug("===== Guest_restaurantController/guestRestaurantMain() =====");

		
		return "guest/guest_restaurant/reserv/guestRestaurant_reserv";
	}
	
	


	
	//==========================================================================
	//============================== 4. 레스토랑 리뷰 ==============================
	//==========================================================================
	//4-1. 레스토랑 리뷰
	@RequestMapping("guestRestaurant_review")
	public String guestRestaurant_review(HttpServletRequest req, Model model) {
		System.out.println("===== 리뷰화면 - guestRestaurant_review =====");	
		//log.debug("===== Guest_restaurantController/guestRestaurantMain() =====");
		
		service.reviewList(req, model);
		
		return "guest/guest_restaurant/review/guestRestaurant_review";
	}
	
	//4-2. 리뷰 작성
	@RequestMapping("Restaurant_reviewWrite")
	public String Restaurant_reviewWrite(HttpServletRequest req, Model model) {
		
		System.out.println("reviewWriter이전");
		service.reviewWrite(req, model);
		System.out.println("reviewWriter이후");
		service.reviewList(req, model);

		return "guest/guest_restaurant/review/guestRestaurant_review";
	}
	
	
	//참조 mvcBoard
	//4-3-1. 리뷰 수정(비밀번호 확인)
	@RequestMapping("Restaurant_reviewModifyForm")
	public String Restaurant_reviewModifyForm(HttpServletRequest req, Model	model) {
		System.out.println("===== 리뷰수정1 - Restaurant_reviewModifyForm =====");
		int review_index = Integer.parseInt(req.getParameter("review_index"));
		int restaurant_index = Integer.parseInt(req.getParameter("restaurant_index"));
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		
		System.out.println("======리뷰 수정 ======");
		System.out.println("review_index : "+ review_index);
		System.out.println("pageNum : " + pageNum);
		model.addAttribute("review_index", review_index);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("restaurant_index", restaurant_index);
		
		return "guest/guest_restaurant/review/guestRestaurant_reviewModifyForm";
	}
	
	//4-3-2. 리뷰 수정(수정화면)
	@RequestMapping("Restaurant_reviweModifyView")
	public String Restaurant_reviweModifyView(HttpServletRequest req, Model	model) {
		System.out.println("===== 리뷰수정2 - Restaurant_reviweModifyView =====");
	
		System.out.println("4-3-2. 수정 전");
		service.review_modifyView(req, model);
		System.out.println("4-3-2. 수정 후");
 
		return "guest/guest_restaurant/review/guestRestaurant_reviewModifyView";
	}		
	
	//4-3-3. 리뷰 수정(수정 처리)
	@RequestMapping("Restaurant_revieModifyPro")
	public String Restaurant_revieModifyPro(HttpServletRequest req, Model	model) {
		System.out.println("===== 리뷰수정3 - Restaurant_revieModifyPro =====");
		
		System.out.println("4-3-3. 수정전");
		service.review_modeifyPro(req, model);
		System.out.println("4-3-3. 수정후");
		service.reviewList(req, model);
		
		return "guest/guest_restaurant/review/guestRestaurant_review";
	}
			
	
	
	
	
	
	//4-4-1. 리뷰 삭제
	@RequestMapping("Restaurant_reviewDeleteForm")
	public String Restaurant_reviewDeleteForm(HttpServletRequest req, Model	model) {
		System.out.println("===== 리뷰 삭제1 - Restaurant_reviewModifyForm =====");
		int review_index = Integer.parseInt(req.getParameter("review_index"));
		int restaurant_index = Integer.parseInt(req.getParameter("restaurant_index"));
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		
		System.out.println("======4-4-1. 리뷰 삭제 ======");
		System.out.println("review_index : "+ review_index);
		System.out.println("pageNum : " + pageNum);
		model.addAttribute("review_index", review_index);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("restaurant_index", restaurant_index);
		
		return "guest/guest_restaurant/review/guestRestaurant_reviewDeleteForm";
	}
		
	//4-4-2. 리뷰 삭제
	@RequestMapping("Restaurant_reviewDeletePro")
	public String Restaurant_reviewDelete(HttpServletRequest req, Model	model) {
		System.out.println("===== 리뷰 삭제 - Restaurant_reviewDelete =====");

		System.out.println("===== 4-3-2. 삭제 reviewDelete이전 =====");
		service.reviewDeletePro(req, model);
		System.out.println("===== 4-3-2. 삭제 reviewDelete이후 =====");
		//service.reviewList(req, model);

		return "guest/guest_restaurant/review/guestRestaurant_reviewDeletePro";
	}
	
	
}
