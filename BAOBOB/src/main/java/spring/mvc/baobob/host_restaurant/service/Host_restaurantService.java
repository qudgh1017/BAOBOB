package spring.mvc.baobob.host_restaurant.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.vo.TableVO;

public interface Host_restaurantService {
	// 식당 총 관리자 - 매장 리스트
	public void restaurantList(HttpServletRequest req, Model model);
	
	// 식당 총 관리자 - 매장 추가 처리
	public void restaurantAdd(HttpServletRequest req, Model model);

	// 식당 총 관리자 - 수정할 매장 정보 조회
	// 식당 관리자 - 예약 추가시 테이블 선택을 위한 매장 정보 조회
	public void restaurantView(HttpServletRequest req, Model model);

	// 식당 총 관리자 - 매장 수정 처리
	public void restaurantMod(HttpServletRequest req, Model model);

	// 식당 총 관리자 - 매장 삭제 처리
	public void restaurantDel(HttpServletRequest req, Model model);

	// 식당 총 관리자 - 모든 메뉴 리스트
	public void allMenuList(HttpServletRequest req, Model model);

	// 식당 총 관리자 - 모든 직원 리스트
	public void allEmployeeList(HttpServletRequest req, Model model);

	// 식당 총 관리자 - 식당별 차트
	public void allAccountChart(HttpServletRequest req, Model model);
	
	/////////////////////////////////////////////////////////////////////////////////////////
	
	// 메뉴 리스트
	public void menuList(HttpServletRequest req, Model model);
	
	// 메뉴 추가 처리
	public void menuAdd(MultipartHttpServletRequest req, Model model);

	// 메뉴 상세 정보 조회
	public void menuView(HttpServletRequest req, Model model);
	
	// 메뉴 수정 처리
	public void menuMod(MultipartHttpServletRequest req, Model model);

	// 메뉴 삭제 처리
	public void menuDel(HttpServletRequest req, Model model);

	/////////////////////////////////////////////////////////////////////////////////////////
	
	// 직원 리스트
	public void employeeList(HttpServletRequest req, Model model);

	// 직원으로 등록 가능한 회원 리스트
	public void memberList(HttpServletRequest req, Model model);

	// 직원으로 등록할 회원 정보 조회
	public void memberView(HttpServletRequest req, Model model);
	
	// 직원 추가 처리
	public void employeeAdd(HttpServletRequest req, Model model);

	// 직원 정보 조회
	public void employeeView(HttpServletRequest req, Model model);

	// 직원 삭제 처리
	public void employeeDel(HttpServletRequest req, Model model);

	// 예약 리스트
	public void reservList(HttpServletRequest req, Model model);

	// 예약 추가 처리
	public void reservAdd(HttpServletRequest req, Model model);

	// 선택한 날짜에 있는 모든 예약 조회
	public void reservView(HttpServletRequest req, Model model);

	// 선택한 날짜에 들어있는 예약의 상세 정보 조회
	public TableVO restaurantView2(HttpServletRequest req, Model model);

	// 주문할 수 있는 상태의 테이블 조회
	public void useTableView(HttpServletRequest req, Model model);

	// 주문 추가 처리
	public void orderAdd(HttpServletRequest req, Model model);

	// 주문 삭제 처리
	public void orderDel(HttpServletRequest req, Model model);

	// 테이블별 결산(결제 처리)
	public void payment(HttpServletRequest req, Model model);

	// 예약 삭제
	public void scheduleDel(HttpServletRequest req, Model model);

	// 메뉴별 차트
	public void accountChart(HttpServletRequest req, Model model);

	// 성별 차트
	public void accountChart2(HttpServletRequest req, Model model);
}
