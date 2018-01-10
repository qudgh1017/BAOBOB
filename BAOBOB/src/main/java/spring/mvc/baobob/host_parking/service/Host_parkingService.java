package spring.mvc.baobob.host_parking.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Host_parkingService {

	//주차장 구역 정보
	public void getParkingSpace(HttpServletRequest req, Model model);
	
	//주차장 구역 정보 등록/수정
	public void parkingSpaceChange(HttpServletRequest req, Model model);
}
