package spring.mvc.baobob.host_parking.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.baobob.host_parking.service.Host_parkingService;

@Controller
public class Host_parkingController {

	@Autowired
	Host_parkingService service;
	
	//주차장 관리 메인
	@RequestMapping("hostParkingMain")
	public String hostParkingMain(HttpServletRequest req, Model model) {
		System.out.println("hostParkingMain()");
		
		service.hostParkingMain(req, model);
		
		return "host/host_parking/hostParkingMain";
	}
	
	//메인 ajax. 주차 구역 변화
	@RequestMapping("hostParkingMainSpace")
	public String hostParkingMainSpace(HttpServletRequest req, Model model) {
		System.out.println("hostParkingMainSpace()");
		
		service.hostParkingMainSpace(req, model);
		
		return "host/host_parking/hostParkingMainSpace";
	}
	
	//주차장 구역 정보 페이지
	@RequestMapping("hostParkingSetting")
	public String hostParkingSetting(HttpServletRequest req, Model model) {
		System.out.println("hostParkingSetting()");
		
		service.getParkingSpace(req, model);
		
		return "host/host_parking/hostParkingSetting";
	}
	
	//주차장 구역 정보 등록/수정
	@RequestMapping("hostParkingSettingChange")
	public String hostParkingSettingChange(HttpServletRequest req, Model model) {
		System.out.println("hostParkingSettingChange");
		
		service.parkingSpaceChange(req, model);
		
		return "host/host_parking/hostParkingSettingChange";
	}

	//실시간 주차 현황
	@RequestMapping("hostParkingState")
	public String hostParkingState(HttpServletRequest req, Model model) {
		System.out.println("hostParkingState()");
		
		service.getParkingSpaceState(req, model);
		
		return "host/host_parking/hostParkingState";
	}
	
	@RequestMapping("hostParkingSpaceState")
	public String hostParkingSpaceState(HttpServletRequest req, Model model) {
		System.out.println("hostParkingSpaceState()");
		
		service.getSpaceState(req, model);
		
		return "host/host_parking/hostParkingSpaceState";
	}

	//주차 현황
	@RequestMapping("hostParkingChart")
	public String hostParkingChart(HttpServletRequest req, Model model) {
		System.out.println("hostParkingChart()");
		
		/*service.getParkingHistory(req, model);*/
		service.getHostParkingChart(req, model);
		
		return "host/host_parking/hostParkingChart";
	}

	//주차 현황 - ajax 월별
	@RequestMapping("hostParkingChartMonth")
	public String hostParkingChartMonth(HttpServletRequest req, Model model) {
		System.out.println("hostParkingChartMonth()");
		
		/*service.getParkingHistory(req, model);*/
		service.getHostParkingChartMonth(req, model);
		
		return "host/host_parking/hostParkingChartMonth";
	}

	//주차 납부 내역
	@RequestMapping("hostParkingPay")
	public String hostParkingPay(HttpServletRequest req, Model model) {
		System.out.println("hostParkingPay()");
		
		service.getParkingPayList(req, model);
		
		return "host/host_parking/hostParkingPay";
	}
	
	//주차 납부 내역 ajax
	@RequestMapping("hostParkingPayList")
	public String hostParkingPayList(HttpServletRequest req, Model model) {
		System.out.println("hostParkingPayList()");
		
		service.getParkingPayList(req, model);
		
		return "host/host_parking/hostParkingPayList";
	}
	
	//주차 납부 현황
	@RequestMapping("hostParkingPayChart")
	public String hostParkingPayChart(HttpServletRequest req, Model model) {
		System.out.println("hostParkingPayChart()");
		
		service.getParkingPayChart(req, model);
		
		return "host/host_parking/hostParkingPayChart";
	}
	
	@RequestMapping("arduinoInput")
	public String arduinoInput(HttpServletRequest req, Model model) {
		
		service.arduinoInput(req,  model);
		
		return "host/host_parking/arduinoInput";
	}
}
