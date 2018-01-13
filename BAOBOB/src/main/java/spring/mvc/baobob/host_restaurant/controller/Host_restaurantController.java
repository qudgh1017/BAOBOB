package spring.mvc.baobob.host_restaurant.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.host_restaurant.service.Host_restaurantService;

@Controller
public class Host_restaurantController {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	Host_restaurantService service;

	// 식당 총 관리자 - 식당 추가
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

	/////////////////////////////////////////////////////////////////////////////////////////

	// 식당[1] 메뉴 리스트
	@RequestMapping(value = "/hostMenuList")
	public String hostMenuList(HttpServletRequest req, Model model) {
		log.debug("hostMenuList()");

		service.menuList(req, model);

		return "host/host_restaurant/hostMenuList";
	}

	// 식당[1] 메뉴 추가
	@RequestMapping(value = "/hostMenuAddForm")
	public String hostMenuAddForm() {
		log.debug("hostMenuAddForm()");

		return "host/host_restaurant/hostMenuAddForm";
	}

	// 식당[1] 메뉴 추가 처리
	@RequestMapping(value = "/hostMenuAddPro")
	public String hostMenuAddPro(MultipartHttpServletRequest req, Model model) {
		log.debug("hostMenuAddPro()");

		service.menuAdd(req, model);

		return "host/host_restaurant/hostMenuAddPro";
	}

	// 식당[1] 수정할 메뉴 정보 보기 / 수정할 정보 입력
	@RequestMapping(value = "/hostMenuModForm")
	public String hostMenuModForm(HttpServletRequest req, Model model) {
		log.debug("hostMenuModForm()");

		service.menuView(req, model);

		return "host/host_restaurant/hostMenuModForm";
	}

	// 식당[1] 메뉴 수정 처리
	@RequestMapping(value = "/hostMenuModPro")
	public String hostMenuModPro(MultipartHttpServletRequest req, Model model) {
		log.debug("hostMenuModPro()");

		service.menuMod(req, model);

		return "host/host_restaurant/hostMenuModPro";
	}

	// 식당[1] 메뉴 삭제 처리
	@RequestMapping(value = "/hostMenuDel")
	public String hostMenuDel(HttpServletRequest req, Model model) {
		log.debug("hostMenuDel()");

		service.menuDel(req, model);

		return "host/host_restaurant/hostMenuDel";
	}

	// 식당[1] 직원 리스트
	@RequestMapping(value = "/hostEmployeeList")
	public String hostEmployeeList(HttpServletRequest req, Model model) {
		log.debug("hostEmployeeList()");

		service.employeeList(req, model);

		return "host/host_restaurant/hostEmployeeList";
	}

	// 전체 회원 목록(식당[1] 직원 등록)
	@RequestMapping(value = "/hostMemberList")
	public String hostMemberList(HttpServletRequest req, Model model) {
		log.debug("hostMemberList()");

		service.memberList(req, model);

		return "host/host_restaurant/hostMemberList";
	}

	// 식당[1] 직원 등록
	@RequestMapping(value = "/hostEmployeeAddForm")
	public String hostEmployeeAddView(HttpServletRequest req, Model model) {
		log.debug("hostEmployeeAddForm()");

		// 식당[1] 직원으로 등록할 회원 정보 조회
		service.memberView(req, model);

		return "host/host_restaurant/hostEmployeeAddForm";
	}

	// 식당[1] 직원 등록 처리
	@RequestMapping(value = "/hostEmployeeAddPro")
	public String hostEmployeeAddPro(HttpServletRequest req, Model model) {
		log.debug("hostMenuAddPro()");

		service.employeeAdd(req, model);

		return "host/host_restaurant/hostEmployeeAddPro";
	}

	// 식당[1] 직원 등록
	@RequestMapping(value = "/hostEmployeeView")
	public String hostEmployeeView(HttpServletRequest req, Model model) {
		log.debug("hostEmployeeView()");

		// 식당[1] 직원 정보 조회
		service.memberView(req, model);
		service.employeeView(req, model);

		return "host/host_restaurant/hostEmployeeView";
	}

	// 식당[1] 직원 삭제 처리
	@RequestMapping(value = "/hostEmployeeDel")
	public String hostEmployeeDel(HttpServletRequest req, Model model) {
		log.debug("hostEmployeeDel()");

		service.employeeDel(req, model);

		return "host/host_restaurant/hostEmployeeDel";
	}
}
