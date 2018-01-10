package spring.mvc.baobob.host_parking.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.baobob.host_parking.persistence.Host_parkingDAO;
import spring.mvc.baobob.vo.ParkingSpace;

@Service
public class Host_parkingServiceImpl implements Host_parkingService {

	@Autowired
	Host_parkingDAO dao;
	
	//주차장 구역 정보 등록/수정
	@Override
	public void hostParkingSettingChange(HttpServletRequest req, Model model) {
		int col = Integer.parseInt(req.getParameter("col"));
		int row = Integer.parseInt(req.getParameter("row"));
		String[] info = req.getParameterValues("info");
		
		ParkingSpace ps = new ParkingSpace();
		//int cnt = dao.hostParkingSettingChange(ps);
		
		System.out.println(info);
		int cnt = 0;
		
		model.addAttribute("cnt", cnt);
	}

}
