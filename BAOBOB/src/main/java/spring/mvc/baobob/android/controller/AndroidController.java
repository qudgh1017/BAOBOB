package spring.mvc.baobob.android.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.baobob.android.persistence.AndroidDAO;
import spring.mvc.baobob.member_mypage.persistence.Member_mypageDAO;
import spring.mvc.baobob.persistence.MainDAO;
import spring.mvc.baobob.vo.Android;
import spring.mvc.baobob.vo.BoardVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieVO;

@Controller
public class AndroidController {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	AndroidDAO dao;
	@Autowired
	MainDAO mainDao;
	@Autowired
	Member_mypageDAO myDdao;
	
	//앱 로그인
	@ResponseBody//웹에서 안드로이드로 값을 전달하기 위한 어노테이션
	@RequestMapping("androidSignIn")
	public Map<String, String> androidSignIn(HttpServletRequest req){
		log.info("androidSignIn()");
		
		//안드로이드에서 전달한 값
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		Map<String, String> in = new HashMap<String, String>();
		in.put("member_id", id);
		in.put("member_pwd", pwd);
		String step = mainDao.confirmIdPwd(in);

		//웹에서 전달할 값
		Map<String, String> out = new HashMap<String, String>();
		if(step != null) {
			out.put("member_id", id);
		} else {
			out.put("member_id", null);
		}
		
		return out;
	}
	
	//앱 마이페이지
	@ResponseBody
	@RequestMapping("androidMyPageMain")
	public Map<String, Object> androidMyPageMain(HttpServletRequest req) {
		log.info("androidMyPageMain()");
		
		//회원 정보
		String id = req.getParameter("id");
		Member m = myDdao.getMemberInfo(id);
		
		//예약 건수
		int movie = dao.getUseMovieCnt(id);
		int rest = dao.getUseRestaurantCnt(id);
		int park = dao.getUseParkingCnt(id);
		
		//문의 목록
		ArrayList<BoardVO> list = dao.getBoardList(id); 
		
		Map<String, Object> map = new HashMap<>();
		map.put("data1", m.getMember_name());
		map.put("data2", movie);
		map.put("data3", rest);
		map.put("data4", park);
		map.put("member", m);
		map.put("boardList",  list);
	
		return map;
	}
	
	//회원페이지
	@ResponseBody
	@RequestMapping("androidMyPageList")
	public Map<String, Object> androidMyPageList(HttpServletRequest req) {
		log.info("androidMyPageList");
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = req.getParameter("id");
		String idx = req.getParameter("idx");
		
		//0 movie 1 rest 2 park
		if(idx.equals("0")) { //영화 예매 내역
			ArrayList<Android> tmp = dao.getMemberMovieTicketing(id); //예매 내역
			ArrayList<Android> list = new ArrayList<Android>(); //2인 이상일 경우 중복 내역 => 제거. 인원수 set.
			
			//tmp = data1:ticket_index, data2:time_start, data3:time_end, data4:movie_title, data5:movie_poster
			//list = data1 => 관람 인원수로 변경
			String historyidx = null;
			int number = 1;
			int listIdx = 0;
			for(int i = 0; i < tmp.size(); i += 1) {
				Android a = tmp.get(i);
				
				String aHistoryIdx = a.getData1();
				//처음이 아닐 경우
				if(historyidx != null) {
					//이전 정보와 다를 경우 추가
					if(!historyidx.equals(aHistoryIdx)) {
						number = 1; //인원수 초기화
						a.setData1(String.valueOf(number));
						list.add(a);
						
						listIdx++; //list index 1 증가
					//이전 정보와 같을 경우
					} else {
						number += 1; //인원수 증가
						a.setData1(String.valueOf(number));
						list.set(listIdx-1, a); //이전 index 이므로 -1
					}
				} else {
					//처음에만 동작
					list.add(a);
					
					listIdx++;
				}
				historyidx = aHistoryIdx;
			}
			map.put("data",  list);
		} else if(idx.equals("1")) { //식당 예약 내역
			ArrayList<Android> tmp = dao.getUseRestaurantList(id); //예약 내역
			map.put("data",  tmp);
			
		} else if(idx.equals("2")) { //주차 이용 내역
			ArrayList<Android> list = dao.getMemberParking(id);
			map.put("data",  list);
		}
		return map;
	}
	

	//회원 정보
	@ResponseBody
	@RequestMapping("androidMemberSelect")
	public Map<String, Object> androidMemberSelect(HttpServletRequest req) {
		String id = req.getParameter("member_id");
		Member mem = myDdao.getMemberInfo(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", id);
		map.put("member_pwd", mem.getMember_pwd());
		map.put("member_name", mem.getMember_name());
		map.put("member_tel", mem.getMember_tel());
		map.put("member_address", mem.getMember_address());
		map.put("member_email", mem.getMember_email());
		map.put("member_img", mem.getMember_img());
		return map;
	}
	
	//회원 정보 수정
	@ResponseBody
	@RequestMapping("androidMemberUpdate")
	public Map<String, Object> androidMemberUpdate(HttpServletRequest req) {
		log.info("androidMemberUpdate()");
		String id = req.getParameter("member_id");
		String pwd = req.getParameter("member_pwd");
		String name = req.getParameter("member_name");
		String tel = req.getParameter("member_tel");
		String address = req.getParameter("member_address");
		String email = req.getParameter("member_email");
		
		Member m = new Member();
		m.setMember_id(id);
		m.setMember_pwd(pwd);
		m.setMember_name(name);
		m.setMember_tel(tel);
		m.setMember_address(address);
		m.setMember_email(email);
		
		int cnt = dao.anMemberUpdate(m);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data1",  cnt);
		return map;
	}
	
	//영화 정보
	@ResponseBody
	@RequestMapping("androidMovieInfo")
	public Map<String, Object> androidMovieInfo(HttpServletRequest req) {
		String movie_title = req.getParameter("title");
		MovieVO movie = dao.androidMovieInfo(movie_title);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movie_title", movie.getMovie_title());
		map.put("movie_content", movie.getMovie_content());
		map.put("movie_janre", movie.getMovie_janre());
		map.put("movie_age", movie.getMovie_age());
		map.put("movie_rel_date", movie.getMovie_rel_date());
		map.put("movie_director", movie.getMovie_director());
		map.put("movie_star", movie.getMovie_star());
		map.put("movie_country", movie.getMovie_country());
		map.put("movie_runTime", movie.getMovie_runTime());
		map.put("movie_poster", movie.getMovie_poster());
		return map;
	}
}
