package spring.mvc.baobob.host_restaurant.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.host_restaurant.service.Host_restaurantService;
import spring.mvc.baobob.vo.TableVO;

@Controller
public class Host_restaurantController {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	Host_restaurantService service;

	// 식당 총 관리자 - 매장 리스트
	@RequestMapping(value = "/hostRestaurantList")
	public String hostRestaurantList(HttpServletRequest req, Model model) {
		log.debug("hostRestaurantList()");

		// 매장 리스트
		service.restaurantList(req, model);

		return "host/host_restaurant/hostRestaurantList";
	}

	// 식당 총 관리자 - 매장 추가 페이지
	@RequestMapping(value = "/hostRestaurantAddForm")
	public String hostRestaurantAddForm() {
		log.debug("hostRestaurantAddForm()");

		return "host/host_restaurant/hostRestaurantAddForm";
	}

	// 식당 총 관리자 - 매장 추가 처리
	@RequestMapping(value = "/hostRestaurantAddPro")
	public String hostRestaurantAddPro(HttpServletRequest req, Model model) {
		log.debug("hostRestaurantAddPro()");

		// 매장 추가 처리
		service.restaurantAdd(req, model);

		return "host/host_restaurant/hostRestaurantAddPro";
	}

	// 식당 총 관리자 - 수정할 매장 정보 조회 / 수정 페이지
	@RequestMapping(value = "/hostRestaurantModForm")
	public String hostRestaurantModForm(HttpServletRequest req, Model model) {
		log.debug("hostRestaurantModForm()");

		// 수정할 매장 정보 조회
		service.restaurantView(req, model);

		return "host/host_restaurant/hostRestaurantModForm";
	}

	// 식당 총 관리자 - 매장 정보 수정 처리
	@RequestMapping(value = "/hostRestaurantModPro")
	public String hostRestaurantModPro(HttpServletRequest req, Model model) {
		log.debug("hostRestaurantModPro()");

		// 매장 수정 처리
		service.restaurantMod(req, model);

		return "host/host_restaurant/hostRestaurantModPro";
	}

	// 식당 총 관리자 - 매장 정보 삭제 처리
	@RequestMapping(value = "/hostRestaurantDel")
	public String hostRestaurantDel(HttpServletRequest req, Model model) {
		log.debug("hostRestaurantDel()");

		// 매장 삭제 처리
		service.restaurantDel(req, model);

		return "host/host_restaurant/hostRestaurantDel";
	}

	// 식당 총 관리자 - 모든 메뉴 리스트
	@RequestMapping(value = "/hostAllMenuList")
	public String hostAllMenuList(HttpServletRequest req, Model model) {
		log.debug("hostAllMenuList()");

		// 모든 매장의 모든 메뉴 조회
		service.allMenuList(req, model);

		return "host/host_restaurant/hostAllMenuList";
	}

	// 식당 총 관리자 - 모든 직원 리스트
	@RequestMapping(value = "/hostAllEmployeeList")
	public String hostAllEmployeeList(HttpServletRequest req, Model model) {
		log.debug("hostAllEmployeeList()");

		// 모든 매장의 모든 직원 조회
		service.allEmployeeList(req, model);

		return "host/host_restaurant/hostAllEmployeeList";
	}

	// 식당 총 관리자 - 식당별 차트
	@RequestMapping(value = "/hostAllAccountChart")
	public String hostAllAccountChart(HttpServletRequest req, Model model) {
		log.debug("hostAllAccountChart()");

		// 식당별 차트
		service.allAccountChart(req, model);

		return "host/host_restaurant/hostAllAccountChart";
	}

	/////////////////////////////////////////////////////////////////////////////////////////

	// 식당별 메뉴 리스트
	@RequestMapping(value = "/hostMenuList")
	public String hostMenuList(HttpServletRequest req, Model model) {
		log.debug("hostMenuList()");

		// 메뉴 리스트
		service.menuList(req, model);

		return "host/host_restaurant/hostMenuList";
	}

	// 메뉴 추가 페이지
	@RequestMapping(value = "/hostMenuAddForm")
	public String hostMenuAddForm() {
		log.debug("hostMenuAddForm()");

		return "host/host_restaurant/hostMenuAddForm";
	}

	// 메뉴 추가 처리
	@RequestMapping(value = "/hostMenuAddPro")
	public String hostMenuAddPro(MultipartHttpServletRequest req, Model model) {
		log.debug("hostMenuAddPro()");

		// 메뉴 추가 처리
		service.menuAdd(req, model);

		return "host/host_restaurant/hostMenuAddPro";
	}

	// 수정할 메뉴 정보 조회 / 수정 페이지
	@RequestMapping(value = "/hostMenuModForm")
	public String hostMenuModForm(HttpServletRequest req, Model model) {
		log.debug("hostMenuModForm()");

		// 메뉴 상세 정보 조회
		service.menuView(req, model);

		return "host/host_restaurant/hostMenuModForm";
	}

	// 메뉴 수정 처리
	@RequestMapping(value = "/hostMenuModPro")
	public String hostMenuModPro(MultipartHttpServletRequest req, Model model) {
		log.debug("hostMenuModPro()");

		// 메뉴 수정 처리
		service.menuMod(req, model);

		return "host/host_restaurant/hostMenuModPro";
	}

	// 메뉴 삭제 처리
	@RequestMapping(value = "/hostMenuDel")
	public String hostMenuDel(HttpServletRequest req, Model model) {
		log.debug("hostMenuDel()");

		// 메뉴 삭제 처리
		service.menuDel(req, model);

		return "host/host_restaurant/hostMenuDel";
	}

	/////////////////////////////////////////////////////////////////////////////////////////

	// 직원 리스트
	@RequestMapping(value = "/hostEmployeeList")
	public String hostEmployeeList(HttpServletRequest req, Model model) {
		log.debug("hostEmployeeList()");

		// 직원 리스트
		service.employeeList(req, model);

		return "host/host_restaurant/hostEmployeeList";
	}

	// 직원으로 등록 가능한 회원 리스트
	@RequestMapping(value = "/hostMemberList")
	public String hostMemberList(HttpServletRequest req, Model model) {
		log.debug("hostMemberList()");

		// 직원으로 등록 가능한 회원 리스트
		service.memberList(req, model);

		return "host/host_restaurant/hostMemberList";
	}

	// 직원으로 등록할 회원 정보 조회 / 직원 등록 페이지
	@RequestMapping(value = "/hostEmployeeAddForm")
	public String hostEmployeeAddView(HttpServletRequest req, Model model) {
		log.debug("hostEmployeeAddForm()");

		// 직원으로 등록할 회원 정보 조회
		service.memberView(req, model);

		return "host/host_restaurant/hostEmployeeAddForm";
	}

	// 직원 등록 처리
	@RequestMapping(value = "/hostEmployeeAddPro")
	public String hostEmployeeAddPro(HttpServletRequest req, Model model) {
		log.debug("hostMenuAddPro()");

		// 직원 등록 처리
		service.employeeAdd(req, model);

		return "host/host_restaurant/hostEmployeeAddPro";
	}

	// 직원 정보 조회 / 직원 삭제 페이지
	@RequestMapping(value = "/hostEmployeeView")
	public String hostEmployeeView(HttpServletRequest req, Model model) {
		log.debug("hostEmployeeView()");

		// 직원 정보 조회(회원 정보 + 직원 정보)
		service.memberView(req, model);
		service.employeeView(req, model);

		return "host/host_restaurant/hostEmployeeView";
	}

	// 직원 삭제 처리
	@RequestMapping(value = "/hostEmployeeDel")
	public String hostEmployeeDel(HttpServletRequest req, Model model) {
		log.debug("hostEmployeeDel()");

		// 직원 삭제 처리
		service.employeeDel(req, model);

		return "host/host_restaurant/hostEmployeeDel";
	}

	/////////////////////////////////////////////////////////////////////////////////////////

	// 예약 리스트
	@RequestMapping(value = "/hostReservList")
	public String hostReservList(HttpServletRequest req, Model model) {
		log.debug("hostReservList()");

		// 예약 리스트
		service.reservList(req, model);

		return "host/host_restaurant/hostReservList";
	}

	// 예약 추가 페이지
	@RequestMapping(value = "/hostReservAddForm")
	public String hostReservAddForm(HttpServletRequest req, Model model) {
		log.debug("hostReservAddForm()");

		return "host/host_restaurant/hostReservAddForm";
	}

	// 예약 - 테이블 선택을 위한 매장 정보 조회
	@RequestMapping(value = "checkPosRestaurant")
	public String checkPosRestaurant(HttpServletRequest req, Model model) {
		log.debug("checkPosRestaurant()");

		// 테이블 선택을 위한 매장 정보 조회
		service.restaurantView(req, model);

		// 테이블 정보 show & hide를 위한 값
		model.addAttribute("confirm", 1);

		return "host/host_restaurant/hostReservAddForm";
	}

	// 예약 추가 처리
	@RequestMapping(value = "/hostReservAddPro")
	public String hostReservAddPro(HttpServletRequest req, Model model) {
		log.debug("hostReservAddPro()");

		// 예약 추가 처리
		service.reservAdd(req, model);

		return "host/host_restaurant/hostReservAddPro";
	}

	// 예약 조회 페이지
	@RequestMapping(value = "/reservView")
	public String hostScheduleSearch(HttpServletRequest req, Model model) {
		log.debug("reservView()");

		// 선택한 날짜에 있는 모든 예약 조회
		service.reservView(req, model);

		return "host/host_restaurant/hostReservList";
	}

	// 예약 상세 정보
	@RequestMapping(value = "/restaurantView")
	public @ResponseBody TableVO restaurantView(HttpServletRequest req, Model model) {
		log.debug("restaurantView()");

		// 선택한 날짜에 들어있는 예약의 상세 정보 조회
		TableVO dto = service.restaurantView2(req, model);

		return dto;
	}

	// 예약 삭제 처리
	@RequestMapping(value = "/hostReservDel")
	public String hostReservDel(HttpServletRequest req, Model model) {
		log.debug("hostReservDel()");

		// 예약 취소 처리
		service.reservDel(req, model);

		return "host/host_restaurant/hostReservDel";
	}

	// 주문 추가 페이지
	@RequestMapping(value = "/hostOrderAddForm")
	public String hostOrderAddForm(HttpServletRequest req, Model model) {
		log.debug("hostOrderAddForm()");

		// 주문할 수 있는 상태의 테이블, 테이블별 주문한 가격 조회
		service.useTableView(req, model);

		// 주문 받을 수 있는 메뉴 리스트 조회
		service.menuList(req, model);

		return "host/host_restaurant/hostOrderAddForm";
	}

	// 주문 추가 처리
	@RequestMapping(value = "/hostOrderAddPro")
	public String hostOrderAddPro(HttpServletRequest req, Model model) {
		log.debug("hostOrderAddPro()");

		// 주문 추가 처리
		service.orderAdd(req, model);

		return "host/host_restaurant/hostOrderAddPro";
	}

	// 주문 삭제 처리
	@RequestMapping(value = "/hostOrderDel")
	public String hostOrderDel(HttpServletRequest req, Model model) {
		log.debug("hostOrderDel()");

		// 주문 삭제 처리
		service.orderDel(req, model);

		return "host/host_restaurant/hostOrderDel";
	}

	// 테이블별 결산
	@RequestMapping(value = "/hostPayment")
	public String hostPayment(HttpServletRequest req, Model model) {
		log.debug("hostPayment()");

		// 테이블별 결산(결제 처리)
		service.payment(req, model);

		return "host/host_restaurant/hostPayment";
	}

	// 결산
	@RequestMapping(value = "/hostRestaurantAccount")
	public String hostRestaurantAccount(HttpServletRequest req, Model model) {
		log.debug("hostRestaurantAccount()");

		service.accountChart(req, model); // 메뉴별 차트, 금월 매출
		service.accountChart2(req, model); // 성별 차트

		return "host/host_restaurant/hostRestaurantAccount";
	}
}
