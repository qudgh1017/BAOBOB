package spring.mvc.baobob.host_parking.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Host_parkingService {

	//주차장 메인
	public void hostParkingMain(HttpServletRequest req, Model model);
	
	//메인 ajax. 주차 구역 변화
	public void hostParkingMainSpace(HttpServletRequest req, Model model);
	
	//주차장 구역 정보
	public void getParkingSpace(HttpServletRequest req, Model model);
	
	//주차장 구역 정보 등록/수정
	public void parkingSpaceChange(HttpServletRequest req, Model model);
	
	//해당 주차 구역 정보
	public void getSpaceState(HttpServletRequest req, Model model);
	
	//주차장 실시간 상태
	public void getParkingSpaceState(HttpServletRequest req, Model model);
	
	//주차 현황  차트
	public void getHostParkingChart(HttpServletRequest req, Model model);
	//주차 내역
	/*public void getParkingHistory(HttpServletRequest req, Model model);*/
	
	//주차 현황  차트 - ajax 월별
	public void getHostParkingChartMonth(HttpServletRequest req, Model model);
	
	//납부 내역(출차한 차량만)
	public void getParkingPayList(HttpServletRequest req, Model model);
	
	//납부 현황
	public void getParkingPayChart(HttpServletRequest req, Model model);
	
	//아두이노
	public void arduinoInput(HttpServletRequest req, Model model);
	
}
