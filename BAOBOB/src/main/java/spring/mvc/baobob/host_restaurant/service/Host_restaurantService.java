package spring.mvc.baobob.host_restaurant.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.vo.TableVO;

public interface Host_restaurantService {
	// 식당 총 관리자 - 매장 리스트
	public void restaurantList(HttpServletRequest req, Model model);
	
	// 식당 총 관리자 - 식당 추가 처리
	public void restaurantAdd(HttpServletRequest req, Model model);

	// 식당 총 관리자 - 수정할 매장 정보 조회 / 수정할 정보 입력
	public void restaurantView(HttpServletRequest req, Model model);

	// 식당 총 관리자 - 매장 수정 처리
	public void restaurantMod(HttpServletRequest req, Model model);

	// 식당 총 관리자 - 매장 삭제 처리
	public void restaurantDel(HttpServletRequest req, Model model);
	
	/////////////////////////////////////////////////////////////////////////////////////////
	
	// 식당[1] 메뉴 리스트
	public void menuList(HttpServletRequest req, Model model);
	
	// 식당[1] 메뉴 추가 처리
	public void menuAdd(MultipartHttpServletRequest req, Model model);

	// 식당[1] 수정할 메뉴 정보 조회 / 수정할 정보 입력
	public void menuView(HttpServletRequest req, Model model);
	
	// 식당[1] 메뉴 수정 처리
	public void menuMod(MultipartHttpServletRequest req, Model model);

	// 식당[1] 메뉴 삭제 처리
	public void menuDel(HttpServletRequest req, Model model);

	// 식당[1] 직원 리스트
	public void employeeList(HttpServletRequest req, Model model);

	// 전체 회원 리스트 (식당[1] 직원 추가)
	public void memberList(HttpServletRequest req, Model model);

	// 식당[1] 직원으로 등록할 회원 정보 조회
	public void memberView(HttpServletRequest req, Model model);
	
	// 식당[1] 직원 추가 처리
	public void employeeAdd(HttpServletRequest req, Model model);

	// 식당[1] 직원 정보 조회
	public void employeeView(HttpServletRequest req, Model model);

	// 식당[1] 직원 삭제 처리
	public void employeeDel(HttpServletRequest req, Model model);

	// 식당[1] 예약 리스트
	public void reservList(HttpServletRequest req, Model model);

	// 식당[1] 예약 추가
	public void reservAdd(HttpServletRequest req, Model model);

	// 선택한 날짜에 있는 모든 예약 조회
	public void reservView(HttpServletRequest req, Model model);

	// 
	public TableVO restaurantView2(HttpServletRequest req, Model model);
}
