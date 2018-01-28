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
	@ResponseBody
	@RequestMapping("androidSignIn")
	public Map<String, String> androidSignIn(HttpServletRequest req){
		log.info("androidSignIn()");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		Map<String, String> in = new HashMap<String, String>();
		in.put("member_id", id);
		in.put("member_pwd", pwd);
		String step = mainDao.confirmIdPwd(in);
		
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
			
			//tmp = data1:ticket_date, data2:time_start, data3:time_end, data4:movie_title, data5:movie_poster
			//list = data1 => 관람 인원수로 변경
			String title = null;
			String date = null;
			int number = 1;
			int listIdx = 0;
			for(int i = 0; i < tmp.size(); i += 1) {
				Android a = tmp.get(i);
				
				String aTitle = a.getData4();
				String aDate = a.getData1();
				//처음이 아닐 경우
				if(title != null && date != null) {
					//이전 정보와 다를 경우 추가
					if(!aTitle.equals(title) && !date.equals(aDate)) {
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
				title = aTitle;
				date = aDate;
			}
			map.put("data",  list);
		} else if(idx.equals("1")) { //식당 예매 내역
			
			/*
			 * VO Class 중 Android를 이용해서 필요한 데이터만 전달
			 * select 할때 별칭으로 data1/data2/.../data5 로 주면 됩니다.
			 * data가 더 필요하시면 추가하셔도 됩니다.(data1 ~ data5는 유지!)
			 * 
			 * 데이터 담기
			 * ArrayList<Android> list = dao.식당예매내역select();
			 * 
			 * 값 전달
			 * map.put("data", list);
			 */
			
			
			
			
			
			
		} else if(idx.equals("2")) { //주차 이용 내역
			ArrayList<Android> list = new ArrayList<>();
			Android a = new Android();
			a.setData1("1");
			a.setData2("2");
			a.setData3("3");
			a.setData4("4");
			a.setData5("5");
			list.add(a);
			map.put("data",  list);
		}
		return map;
	}
	
	
	
	
	
	
	
	
	//TEST http://cocomo.tistory.com/412
	@ResponseBody //웹에서 안드로이드로 값을 전달하기 위한 머노테이션
	@RequestMapping("androidTest")
	public Map androidTest(HttpServletRequest req) {
		//안드로이드에서 전달한 값
		System.out.println("title : " + req.getParameter("title"));
		System.out.println("memo : " + req.getParameter("memo"));
		
		//웹에서 전달할 값
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", "아이디");
		map.put("member_pwd", "비밀번호");
		return map;
	}
}
