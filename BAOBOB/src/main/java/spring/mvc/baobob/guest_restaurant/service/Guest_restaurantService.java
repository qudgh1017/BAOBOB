package spring.mvc.baobob.guest_restaurant.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Guest_restaurantService {
	//==========================================================================
	//============================== 1. 레스토랑 정보 ==============================
	//==========================================================================
	//1. 레스토랑 정보
	public void restaurant_imfomation(HttpServletRequest req, Model model);
	
	//==========================================================================
	//============================== 2. 레스토랑 메뉴 ==============================
	//==========================================================================
	//2-1. 레스토랑 메뉴 보기
	public void restaurant_menuInfo(HttpServletRequest req, Model model);
	//2-2. 레스토랑 메뉴 상세
	//	public void restaurant_menu_Content(HttpServletRequest req, Model model);
	
	
	//==========================================================================
	//============================== 3. 레스토랑 예약 ==============================
	//==========================================================================
	//3-1. 레스토랑 예약
	public void restaurant_tableList(HttpServletRequest req, Model model);
	
	//==========================================================================
	//============================== 4. 레스토랑 리뷰 ==============================
	//==========================================================================
	//4-1. 리뷰 리스트
	public void reviewList(HttpServletRequest req, Model model);
	
	//4-2. 리뷰 작성
	public void reviewWrite(HttpServletRequest req, Model model); 
	
	//4-3-2. 리뷰 수정
	public void review_modifyView(HttpServletRequest req, Model model); 
	//4-3-3. 리뷰 수정 처리
	public void review_modeifyPro(HttpServletRequest req, Model model);
	
	//4-4. 리뷰 삭제
	public void reviewDeletePro(HttpServletRequest req, Model model);
	//==========================================================================
	//==========================================================================
}
