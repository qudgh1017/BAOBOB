package spring.mvc.baobob.host_total.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Host_totalService {
	
	//회원 리스트
	public void memList(HttpServletRequest req, Model model);
	
	//회원 추가
	public void memAddPro(HttpServletRequest req, Model model);
	
	//아이디 중복검사
	public void confirmId(HttpServletRequest req, Model model);
	
	//회원 정보, 수정뷰페이지
	public void hostTMemView(HttpServletRequest req, Model model);
	
	//회원 정보 수정처리
	public void hostTMemModifyPro(HttpServletRequest req, Model model);
	
	//회원삭제 처리페이지
	public void hostTMemDelPro(HttpServletRequest req, Model model);
	
	//영화관 결산페이지
	public void movieChart(HttpServletRequest req, Model model);
	
	//영화관 결산페이지
	public void restaurantChart(HttpServletRequest req, Model model);
	
	//주차장 결산페이지
	public void getParkingPayChart(HttpServletRequest req, Model model);
}
