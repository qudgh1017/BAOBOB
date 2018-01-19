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

	// 식당 총 관리자 - 매장 목록
	@RequestMapping(value = "/hostRestaurantList")
	public String hostRestaurantList(HttpServletRequest req, Model model) {
		log.debug("hostRestaurantList()");

		service.restaurantList(req, model);

		return "host/host_restaurant/hostRestaurantList";
	}

	// 식당 총 관리자 - 매장 추가
	@RequestMapping(value = "/hostRestaurantAddForm")
	public String hostRestaurantAddForm() {
		log.debug("hostRestaurantAddForm()");

		return "host/host_restaurant/hostRestaurantAddForm";
	}

	// 식당 총 관리자 - 식당 추가 처리
	@RequestMapping(value = "/hostRestaurantAddPro")
	public String hostRestaurantAddPro(HttpServletRequest req, Model model) {
		log.debug("hostRestaurantAddPro()");

		service.restaurantAdd(req, model);

		return "host/host_restaurant/hostRestaurantAddPro";
	}

	// 식당 총 관리자 - 수정할 매장 정보 조회 / 수정할 정보 입력
	@RequestMapping(value = "/hostRestaurantModForm")
	public String hostRestaurantModForm(HttpServletRequest req, Model model) {
		log.debug("hostRestaurantModForm()");

		service.restaurantView(req, model);

		return "host/host_restaurant/hostRestaurantModForm";
	}

	// 식당 총 관리자 - 매장 정보 수정 처리
	@RequestMapping(value = "/hostRestaurantModPro")
	public String hostRestaurantModPro(HttpServletRequest req, Model model) {
		log.debug("hostRestaurantModPro()");

		service.restaurantMod(req, model);

		return "host/host_restaurant/hostRestaurantModPro";
	}

	// 식당 총 관리자 - 매장 정보 삭제 처리
	@RequestMapping(value = "/hostRestaurantDel")
	public String hostRestaurantDel(HttpServletRequest req, Model model) {
		log.debug("hostRestaurantDel()");

		service.restaurantDel(req, model);

		return "host/host_restaurant/hostRestaurantDel";
	}

	/////////////////////////////////////////////////////////////////////////////////////////

	// 식당별 메뉴 리스트
	@RequestMapping(value = "/hostMenuList")
	public String hostMenuList(HttpServletRequest req, Model model) {
		log.debug("hostMenuList()");

		service.menuList(req, model);

		return "host/host_restaurant/hostMenuList";
	}

	// 식당별 메뉴 추가
	@RequestMapping(value = "/hostMenuAddForm")
	public String hostMenuAddForm() {
		log.debug("hostMenuAddForm()");

		return "host/host_restaurant/hostMenuAddForm";
	}

	// 메뉴 추가 처리
	@RequestMapping(value = "/hostMenuAddPro")
	public String hostMenuAddPro(MultipartHttpServletRequest req, Model model) {
		log.debug("hostMenuAddPro()");

		service.menuAdd(req, model);

		return "host/host_restaurant/hostMenuAddPro";
	}

	// 수정할 메뉴 정보 조회 / 수정할 정보 입력
	@RequestMapping(value = "/hostMenuModForm")
	public String hostMenuModForm(HttpServletRequest req, Model model) {
		log.debug("hostMenuModForm()");

		service.menuView(req, model);

		return "host/host_restaurant/hostMenuModForm";
	}

	// 메뉴 수정 처리
	@RequestMapping(value = "/hostMenuModPro")
	public String hostMenuModPro(MultipartHttpServletRequest req, Model model) {
		log.debug("hostMenuModPro()");

		service.menuMod(req, model);

		return "host/host_restaurant/hostMenuModPro";
	}

	// 메뉴 삭제 처리
	@RequestMapping(value = "/hostMenuDel")
	public String hostMenuDel(HttpServletRequest req, Model model) {
		log.debug("hostMenuDel()");

		service.menuDel(req, model);

		return "host/host_restaurant/hostMenuDel";
	}

	// 식당별 직원 리스트
	@RequestMapping(value = "/hostEmployeeList")
	public String hostEmployeeList(HttpServletRequest req, Model model) {
		log.debug("hostEmployeeList()");

		service.employeeList(req, model);

		return "host/host_restaurant/hostEmployeeList";
	}

	// 전체 회원 목록(직원 등록 전)
	@RequestMapping(value = "/hostMemberList")
	public String hostMemberList(HttpServletRequest req, Model model) {
		log.debug("hostMemberList()");

		service.memberList(req, model);

		return "host/host_restaurant/hostMemberList";
	}

	// 직원 등록
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

		service.employeeAdd(req, model);

		return "host/host_restaurant/hostEmployeeAddPro";
	}

	// 직원 등록
	@RequestMapping(value = "/hostEmployeeView")
	public String hostEmployeeView(HttpServletRequest req, Model model) {
		log.debug("hostEmployeeView()");

		// 식당[1] 직원 정보 조회
		service.memberView(req, model);
		service.employeeView(req, model);

		return "host/host_restaurant/hostEmployeeView";
	}

	// 직원 삭제 처리
	@RequestMapping(value = "/hostEmployeeDel")
	public String hostEmployeeDel(HttpServletRequest req, Model model) {
		log.debug("hostEmployeeDel()");

		service.employeeDel(req, model);

		return "host/host_restaurant/hostEmployeeDel";
	}

	// 식당별 예약 리스트
	@RequestMapping(value = "/hostReservList")
	public String hostReservList(HttpServletRequest req, Model model) {
		log.debug("hostReservList()");

		service.reservList(req, model);

		return "host/host_restaurant/hostReservList";
	}

	// 식당별 예약 페이지
	@RequestMapping(value = "/hostReservAddForm")
	public String hostReservAddForm(HttpServletRequest req, Model model) {
		log.debug("hostReservAddForm()");

		return "host/host_restaurant/hostReservAddForm";
	}

	// 예약 - 테이블 선택 위한 매장 내 테이블 조회
	@RequestMapping(value = "checkPosRestaurant")
	public String checkPosRestaurant(HttpServletRequest req, Model model) {
		log.debug("checkPosRestaurant()");

		service.restaurantView(req, model);
		model.addAttribute("confirm", 1);

		return "host/host_restaurant/hostReservAddForm";
	}

	// 예약된 날짜와 테이블 등 상세 조회
	@RequestMapping(value = "checkPosRestaurant2")
	public String checkPosRestaurant2(HttpServletRequest req, Model model) {
		log.debug("checkPosRestaurant2()");

		service.reservList(req, model);
		service.restaurantView(req, model);
		model.addAttribute("confirm", 1);

		return "host/host_restaurant/hostReservList";
	}

	// 예약 처리
	@RequestMapping(value = "/hostReservAddPro")
	public String hostReservAddPro(HttpServletRequest req, Model model) {
		log.debug("hostReservAddPro()");

		service.reservAdd(req, model);

		return "host/host_restaurant/hostReservAddPro";
	}

	// 스케줄 조회하기 버튼
	@RequestMapping(value = "/reservView")
	public String hostScheduleSearch(HttpServletRequest req, Model model) {
		log.debug("reservView()");

		service.reservView(req, model);

		return "host/host_restaurant/hostReservList";
	}

	// 스케줄 내 예약된 테이블 조회
	@RequestMapping(value = "/restaurantView")
	public @ResponseBody TableVO restaurantView(HttpServletRequest req, Model model) {
		log.debug("restaurantView()");

		TableVO dto = service.restaurantView2(req, model);

		return dto;
	}

	// 모든 메뉴 리스트
	@RequestMapping(value = "/hostAllMenuList")
	public String hostAllMenuList(HttpServletRequest req, Model model) {
		log.debug("hostAllMenuList()");

		service.allMenuList(req, model);

		return "host/host_restaurant/hostAllMenuList";
	}

	// 모든 직원 리스트
	@RequestMapping(value = "/hostAllEmployeeList")
	public String hostAllEmployeeList(HttpServletRequest req, Model model) {
		log.debug("hostAllEmployeeList()");

		service.allEmployeeList(req, model);

		return "host/host_restaurant/hostAllEmployeeList";
	}
	
	// 스케줄 상세 내용
	@RequestMapping(value="/hostOrderAddForm")
	public String hostOrderAddForm(HttpServletRequest req, Model model) {
		log.debug("hostOrderAddForm()");

		service.menuList(req, model);
		service.useTableView(req, model);
		
		return "host/host_restaurant/hostOrderAddForm";
	}
	
	// 테이블에 메뉴 추가(판매)
	@RequestMapping(value="/hostOrderAddPro")
	public String hostOrderAddPro(HttpServletRequest req, Model model) {
		log.debug("hostOrderAddPro()");

		service.orderAdd(req, model);
		
		return "host/host_restaurant/hostOrderAddPro";
	}
	
	// 테이블에 메뉴 추가(판매)
	@RequestMapping(value="/hostRestaurantAccount")
	public String hostRestaurantAccount(HttpServletRequest req, Model model) {
		log.debug("hostRestaurantAccount()");

		service.account(req, model);
		
		return "host/host_restaurant/hostRestaurantAccount";
	}
}
