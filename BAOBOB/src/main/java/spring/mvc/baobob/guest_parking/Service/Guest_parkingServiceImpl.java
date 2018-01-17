package spring.mvc.baobob.guest_parking.Service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.baobob.guest_parking.persistence.Guest_parkingDAO;
import spring.mvc.baobob.host_parking.persistence.Host_parkingDAO;
import spring.mvc.baobob.persistence.MainDAO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.ParkingFee;
import spring.mvc.baobob.vo.ParkingHistory;

@Service
public class Guest_parkingServiceImpl implements Guest_parkingService{

	@Autowired
	Guest_parkingDAO dao;
	@Autowired
	MainDAO mDao;
	@Autowired
	Host_parkingDAO hDao;
	
	//입장 시 번호 생성
	@Override
	public void guestParkingInPro(HttpServletRequest req, Model model) {
		String member_id = (String) req.getSession().getAttribute("memId");
		
		StringBuffer sb = new StringBuffer();
		Random r = new Random();
		for(int i = 0; i < 6; i += 1) {
			int rIdx = r.nextInt(2);
			switch(rIdx) {
			case 0: sb.append((char) ((int)(r.nextInt(26)) + 65));
			case 1: sb.append(r.nextInt(10));
			}
		}
		String key = sb.toString();
		
		int cnt = 0;
		if(member_id == null) { //비회원일 경우 회원 목록에 비회원 추가
			member_id = key;
			Member m = new Member();
			m.setMember_id(member_id);
			m.setMember_pwd("0000");
			m.setMember_name("비회원");
			m.setMember_tel(req.getParameter("tel"));
			m.setMember_email("null");
			m.setMember_birth("null");
			m.setMember_sex("null");
			m.setMember_address("null");
			m.setMember_point(0);
			m.setMember_step(9);
			m.setMember_cumPoint(0);
			cnt = mDao.memberInsert(m);
		}
		
		String index = dao.historyDateCheck(member_id);
		if(index == null) { //오늘자의 history_index가 없을 경우 추가
			cnt = dao.historyInsert(member_id);
			if(cnt != 0) {
				index = dao.historyDateCheck(member_id);
			}
		} 
		//다시 history_index가 존재하는 지 확인
		if(index != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("history_index", index);
			map.put("key",  key);
			cnt = dao.parkInHistoryInsert(map);
		}
		
		req.getSession().invalidate();
		model.addAttribute("key", key);
		model.addAttribute("cnt", cnt);
	}

	//퇴장 번호 확인
	@Override
	public void guestParkingOutCheckPro(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");

		int mem = 0;
		int cnt = dao.parkingOutKeyCheck(key);
		if(cnt != 0) {
			mem = dao.parkingOutMemberCheck(key);
		}
		
		model.addAttribute("key", key);
		model.addAttribute("cnt", cnt);
		model.addAttribute("mem", mem);
	}

	//퇴장 처리
	@Override
	public void guestParkingPay(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");
		
		Timestamp inTime = dao.getParkingInTime(key);
		Timestamp outTime = new Timestamp(System.currentTimeMillis());
		long userTime = outTime.getTime() - inTime.getTime();
		
		ParkingFee pf = hDao.getParkingFee();
		long time = (userTime / 1000) / 60 - pf.getP_fee_base_time();
		int price = pf.getP_fee_base_price();
		while(time > 0) {
			time -= pf.getP_fee_exc_time();
			price += pf.getP_fee_exc_price();
		}
		
		int movie = dao.getMovieHistoryCount(key);
		int rest = dao.getRestaurantHistoryCount(key);
		price = price - (movie * 1000) - (rest * 1000);
		if(price < 0) { price = 0; }

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_history_price", price);
		map.put("key", key);
		int cnt = dao.parkingHistoryUpdate(map);
		model.addAttribute("cnt", cnt);
		
		ParkingHistory ph = dao.getParkingHistory(key);
		model.addAttribute("ph", ph);
		model.addAttribute("movie", movie);
		model.addAttribute("rest", rest);
	}

	//주차 내역 출력
	@Override
	public void guestParkingMy(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");
		ParkingHistory ph = dao.getParkingHistory(key);
		model.addAttribute("ph", ph);
	}

}
