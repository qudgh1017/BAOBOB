package spring.mvc.baobob.host_parking.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.baobob.host_parking.persistence.Host_parkingDAO;
import spring.mvc.baobob.vo.Parking;
import spring.mvc.baobob.vo.ParkingFee;
import spring.mvc.baobob.vo.ParkingSpace;

@Service
public class Host_parkingServiceImpl implements Host_parkingService {

	@Autowired
	Host_parkingDAO dao;

	//주차장 구역 정보
	@Override
	public void getParkingSpace(HttpServletRequest req, Model model) {
		ParkingSpace ps = dao.getParkingSpace();
		model.addAttribute("pSpace", ps);
		
		ParkingFee pf = dao.getParkingFee();
		model.addAttribute("pf", pf);
	}
	
	//주차장 구역 정보 등록/수정
	@Override
	public void parkingSpaceChange(HttpServletRequest req, Model model) {
		int col = Integer.parseInt(req.getParameter("col"));
		int row = Integer.parseInt(req.getParameter("row"));
		String info = req.getParameter("info");
		
		//주차장 구역 배열 정보
		ParkingSpace ps = new ParkingSpace();
		ps.setP_space_col(col);
		ps.setP_space_row(row);
		ps.setP_space_info(info);
		int cnt = dao.parkingSpaceChange(ps);

		if(cnt != 0) {
			//주차장 각 구역 정보 등록
			System.out.println(info);
			String[] typeNums = info.split(",");
			for(int y = 0; y < row; y += 1) {
				for(int x = 0; x < col; x += 1) {
					int idx = x + y * col;
					int type = Integer.parseInt(typeNums[idx]);
					
					Parking space = new Parking();
					space.setPark_index(idx);
					space.setPark_state(0);
					space.setPark_theme(type);
					//cnt = dao.parkingChange(space);
				}
			}
		
			//주차장 기본 요금 정보
			int baseTime = Integer.parseInt(req.getParameter("baseTime"));
			int baseFee = Integer.parseInt(req.getParameter("baseFee"));
			int excTime = Integer.parseInt(req.getParameter("excTime"));
			int excFee = Integer.parseInt(req.getParameter("excFee"));
			
			ParkingFee pf = new ParkingFee();
			pf.setP_fee_base_price(baseFee);
			pf.setP_fee_base_time(baseTime);
			pf.setP_fee_exc_price(excFee);
			pf.setP_fee_exc_time(excTime);
			
			cnt = dao.parkingFeeChange(pf);
		}
		
		model.addAttribute("cnt", cnt);
	}

	//주차장 실시간 현황
	@Override
	public void getParkingSpaceState(HttpServletRequest req, Model model) {
		ParkingSpace ps = dao.getParkingSpace(); 
		int col = ps.getP_space_col();
		int row = ps.getP_space_row();
		int last_idx =  col * row; 
		
		//주차장 구역 상태 정보
		ArrayList<String> list = dao.getParkingStates(last_idx);
		String states = "";
		for(String state : list) {
			states += states.equals("") ? state : "," + state ; 
		}
		
		model.addAttribute("col", col);
		model.addAttribute("row", row);
		model.addAttribute("states", states);
	}

}
