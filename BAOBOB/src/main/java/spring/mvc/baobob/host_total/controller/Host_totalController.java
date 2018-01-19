package spring.mvc.baobob.host_total.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.baobob.host_total.service.Host_totalService;

@Controller
public class Host_totalController {
	
	@Autowired
	Host_totalService service;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	//관리자페이지 부트스트랩
	@RequestMapping("adminDefault")
	public String adminDefault(Model model) {
		
		log.debug("====== host_total.controller/adminDefault ======");
		
		return "adminDefault";
	}
	
	//종합관리자 메인
	@RequestMapping("hostTMain")
	public String hostTMain(HttpServletRequest req, Model model) {
		
		log.debug("====== host_total.controller/hostTMain() ======");
		
		//영화관 결산 챠트
		service.movieChart(req, model);
		//식당 결산 챠트
		service.restaurantChart(req, model);
		//주차장 결산 챠트
		service.getParkingPayChart(req, model);
		
		return "host/host_total/hostTMain";
	}
	
	//종합관리자 회원,직원 목록
	@RequestMapping("hostTMemList")
	public String hostTMemList(HttpServletRequest req, Model model) {
		
		service.memList(req,model);
		
		return "host/host_total/hostTMemList";
	}
	
	//종합관리자 회원,직원 추가
	@RequestMapping("hostTMemAdd")
	public String hostTMemAdd(HttpServletRequest req, Model model) {
		
		service.memList(req,model);
		
		return "host/host_total/hostTMemAdd";
	}
	
	//아이디 중복 검사
	@RequestMapping("hostTConfirmId")
	public String confirmId(HttpServletRequest req, Model model) {
		System.out.println("hostTConfirmId()");
		service.confirmId(req, model);
		
		return "host/host_total/cntPage";
	}
	
	//종합관리자 회원,직원 추가 처리
	@RequestMapping("hostTMemAddPro")
	public String hostTMemAddPro(HttpServletRequest req, Model model) {
		
		service.memAddPro(req,model);
		
		return "host/host_total/hostTMemAddPro";
	}
	
	//회원 정보,수정뷰페이지
	@RequestMapping("hostTMemView")
	public String hostTMemView(HttpServletRequest req, Model model) {
		
		service.hostTMemView(req,model);
		
		return "host/host_total/hostTMemView";
	}
	
	//정보수정 처리페이지
	@RequestMapping("hostTMemModifyPro")
	public String hostTMemModifyPro(HttpServletRequest req, Model model) {
		
		service.hostTMemModifyPro(req, model);
		
		return "host/host_total/hostTMemModifyPro";
	}
	
	//회원 삭제
	//회원탈퇴 처리페이지
	@RequestMapping("hostTMemDelPro")
	public String hostTMemDelPro(HttpServletRequest req, Model model) {
		
		service.hostTMemDelPro(req, model);
		
		return "host/host_total/hostTMemDelPro";
	}
	
	//영화관 결산페이지
	@RequestMapping("hostTMovie")
	public String hostTMovie(HttpServletRequest req, Model model) {
		
		service.movieChart(req, model);
		
		return "host/host_total/hostTMovieChart";
	}
	
	//식당 결산페이지
	@RequestMapping("hostTRestaurant")
	public String hostTRestaurant(HttpServletRequest req, Model model) {
		
		service.restaurantChart(req, model);
		
		return "host/host_total/hostTRestaurantChart";
	}
	
	//주차장 결산페이지
	@RequestMapping("hostTParkingChart")
	public String hostTParkingChart(HttpServletRequest req, Model model) {
		
		service.getParkingPayChart(req, model);
		
		return "host/host_total/hostParkChart";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
