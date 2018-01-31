package spring.mvc.baobob.host_parking.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.baobob.host_parking.service.Host_parkingService;

@Controller
public class Host_parkingController {

	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	Host_parkingService service;
	
	//주차장 관리 메인
	@RequestMapping("hostParkingMain")
	public String hostParkingMain(HttpServletRequest req, Model model) {
		log.info("hostParkingMain()");
		
		service.hostParkingMain(req, model);
		
		return "host/host_parking/hostParkingMain";
	}
	
	//메인 ajax. 주차 구역 변화
	@RequestMapping("hostParkingMainSpace")
	public String hostParkingMainSpace(HttpServletRequest req, Model model) {
		log.info("hostParkingMainSpace()");
		
		service.hostParkingMainSpace(req, model);
		
		return "host/host_parking/hostParkingMainSpace";
	}
	
	//주차장 구역 정보 페이지
	@RequestMapping("hostParkingSetting")
	public String hostParkingSetting(HttpServletRequest req, Model model) {
		log.info("hostParkingSetting()");
		
		service.getParkingSpace(req, model);
		
		return "host/host_parking/hostParkingSetting";
	}
	
	//주차장 구역 정보 등록/수정
	@RequestMapping("hostParkingSettingChange")
	public String hostParkingSettingChange(HttpServletRequest req, Model model) {
		log.info("hostParkingSettingChange");
		
		service.parkingSpaceChange(req, model);
		
		return "host/host_parking/hostParkingSettingChange";
	}

	//실시간 주차 현황
	@RequestMapping("hostParkingState")
	public String hostParkingState(HttpServletRequest req, Model model) {
		log.info("hostParkingState()");
		
		service.getParkingSpaceState(req, model);
		
		return "host/host_parking/hostParkingState";
	}
	
	//실시간 주차 현황 ajax
	@RequestMapping("hostParkingStateAjax")
	public String hostParkingStateAjax(HttpServletRequest req, Model model) {
		log.info("hostParkingStateAjax()");
		
		service.getParkingSpaceState(req, model);
		
		return "host/host_parking/hostParkingStateAjax";
	}
	
	//실시간 주차 현황 구역 정보 ajax
	@RequestMapping("hostParkingSpaceState")
	public String hostParkingSpaceState(HttpServletRequest req, Model model) {
		log.info("hostParkingSpaceState()");
		
		service.getSpaceState(req, model);
		
		return "host/host_parking/hostParkingSpaceState";
	}

	//주차 현황
	@RequestMapping("hostParkingChart")
	public String hostParkingChart(HttpServletRequest req, Model model) {
		log.info("hostParkingChart()");
		
		service.getHostParkingChart(req, model);
		
		return "host/host_parking/hostParkingChart";
	}

	//주차 현황 - ajax 월별
	@RequestMapping("hostParkingChartMonth")
	public String hostParkingChartMonth(HttpServletRequest req, Model model) {
		log.info("hostParkingChartMonth()");
		
		service.getHostParkingChartMonth(req, model);
		
		return "host/host_parking/hostParkingChartMonth";
	}

	//주차 납부 내역
	@RequestMapping("hostParkingPay")
	public String hostParkingPay(HttpServletRequest req, Model model) {
		log.info("hostParkingPay()");
		
		service.getParkingPayList(req, model);
		
		return "host/host_parking/hostParkingPay";
	}
	
	//주차 납부 내역 ajax
	@RequestMapping("hostParkingPayList")
	public String hostParkingPayList(HttpServletRequest req, Model model) {
		log.info("hostParkingPayList()");
		
		service.getParkingPayList(req, model);
		
		return "host/host_parking/hostParkingPayList";
	}
	
	//주차 납부 현황
	@RequestMapping("hostParkingPayChart")
	public String hostParkingPayChart(HttpServletRequest req, Model model) {
		log.info("hostParkingPayChart()");
		
		service.getParkingPayChart(req, model);
		
		return "host/host_parking/hostParkingPayChart";
	}
	
	//아두이노
	@RequestMapping("arduinoInput")
	public String arduinoInput(HttpServletRequest req, Model model) {
		
		service.arduinoInput(req,  model);
		
		return "host/host_parking/arduinoInput";
	}
}
