package spring.mvc.baobob.android.controller;

import java.sql.Timestamp;
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
import spring.mvc.baobob.guest_movie.persistence.Guest_movieDAO;
import spring.mvc.baobob.guest_restaurant.persistence.Guest_restaurantDAO;
import spring.mvc.baobob.member_mypage.persistence.Member_mypageDAO;
import spring.mvc.baobob.persistence.MainDAO;
import spring.mvc.baobob.vo.Android;
import spring.mvc.baobob.vo.BoardVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.Restaurant_scheduleVO;
import spring.mvc.baobob.vo.TableVO;
import spring.mvc.baobob.vo.TheaterVO;
import spring.mvc.baobob.vo.Theater_seatVO;

@Controller
public class AndroidController {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	AndroidDAO dao;
	@Autowired
	MainDAO mainDao;
	@Autowired
	Member_mypageDAO myDdao;
	@Autowired
	Guest_movieDAO movieDao;
	@Autowired
	Guest_restaurantDAO restDao;

	// 앱 로그인
	@ResponseBody // 웹에서 안드로이드로 값을 전달하기 위한 어노테이션
	@RequestMapping("androidSignIn")
	public Map<String, String> androidSignIn(HttpServletRequest req) {
		log.info("androidSignIn()");

		// 안드로이드에서 전달한 값
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");

		Map<String, String> in = new HashMap<String, String>();
		in.put("member_id", id);
		in.put("member_pwd", pwd);
		String step = mainDao.confirmIdPwd(in);

		// 웹에서 전달할 값
		Map<String, String> out = new HashMap<String, String>();
		if (step != null) {
			out.put("member_id", id);
		} else {
			out.put("member_id", null);
		}

		return out;
	}

	// 앱 메인
	@ResponseBody
	@RequestMapping("androidMainList")
	public Map<String, Object> androidMainMovie(HttpServletRequest req) {
		String idx = req.getParameter("idx");

		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<Android> list;
		if (idx == null || idx.equals("1")) {
			list = dao.getMovieList();
		} else {
			list = dao.getRestaurantList();
			list.get(0).setData2("jap_1.jpg");
			list.get(1).setData2("kor_4.jpg");
			list.get(2).setData2("pasta_4.jpg");
		}
		map.put("data", list);
		return map;
	}

	// 앱 마이페이지
	@ResponseBody
	@RequestMapping("androidMyPageMain")
	public Map<String, Object> androidMyPageMain(HttpServletRequest req) {
		log.info("androidMyPageMain()");

		// 회원 정보
		String id = req.getParameter("id");
		Member m = myDdao.getMemberInfo(id);

		// 예약 건수
		int movie = dao.getUseMovieCnt(id);
		int rest = dao.getUseRestaurantCnt(id);
		int park = dao.getUseParkingCnt(id);

		// 문의 목록
		ArrayList<BoardVO> list = dao.getBoardList(id);

		Map<String, Object> map = new HashMap<>();
		map.put("data1", m.getMember_name());
		map.put("data2", movie);
		map.put("data3", rest);
		map.put("data4", park);
		map.put("member", m);
		map.put("boardList", list);

		return map;
	}

	// 회원페이지
	@ResponseBody
	@RequestMapping("androidMyPageList")
	public Map<String, Object> androidMyPageList(HttpServletRequest req) {
		log.info("androidMyPageList");
		Map<String, Object> map = new HashMap<String, Object>();

		String id = req.getParameter("id");
		String idx = req.getParameter("idx");

		// 0 movie 1 rest 2 park
		if (idx.equals("0")) { // 영화 예매 내역
			ArrayList<Android> tmp = dao.getMemberMovieTicketing(id); // 예매 내역
			ArrayList<Android> list = new ArrayList<Android>(); // 2인 이상일 경우 중복 내역 => 제거. 인원수 set.

			// tmp = data1:ticket_index, data2:time_start, data3:time_end,
			// data4:movie_title, data5:movie_poster
			// list = data1 => 관람 인원수로 변경
			String historyidx = null;
			int number = 1;
			int listIdx = 0;
			for (int i = 0; i < tmp.size(); i += 1) {
				Android a = tmp.get(i);

				String aHistoryIdx = a.getData1();
				// 처음이 아닐 경우
				if (historyidx != null) {
					// 이전 정보와 다를 경우 추가
					if (!historyidx.equals(aHistoryIdx)) {
						number = 1; // 인원수 초기화
						a.setData1(String.valueOf(number));
						list.add(a);

						listIdx++; // list index 1 증가
						// 이전 정보와 같을 경우
					} else {
						number += 1; // 인원수 증가
						a.setData1(String.valueOf(number));
						list.set(listIdx - 1, a); // 이전 index 이므로 -1
					}
				} else {
					// 처음에만 동작
					list.add(a);

					listIdx++;
				}
				historyidx = aHistoryIdx;
			}
			map.put("data", list);
		} else if (idx.equals("1")) { // 식당 예약 내역
			ArrayList<Android> tmp = dao.getUseRestaurantList(id); // 예약 내역
			map.put("data", tmp);

		} else if (idx.equals("2")) { // 주차 이용 내역
			ArrayList<Android> list = dao.getMemberParking(id);
			map.put("data", list);
		}
		return map;
	}

	// 회원 정보
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

	// 회원 정보 수정
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
		map.put("data1", cnt);
		return map;
	}

	// 영화 정보
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

		// 평점 = 좋아요
		String likeCnt = movieDao.movieLike(movie.getMovie_index());
		if (likeCnt != null) {
			int reviewCnt = movieDao.getMovieReviewCnt(movie.getMovie_index());
			if (reviewCnt != 0) {
				double likePercent = (Integer.parseInt(likeCnt) * 100) / reviewCnt;
				map.put("movie_trailer", likePercent);
			} else {
				map.put("movie_trailer", 0);
			}
		}

		return map;
	}

	// 영화 예약) 해당 날짜 상영 영화
	@ResponseBody
	@RequestMapping("androidMovieTicket")
	public Map<String, Object> androidMovieTicket(HttpServletRequest req) {
		String day = req.getParameter("day");
		ArrayList<Android> list = dao.getMovieSchedule(day);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		return map;
	}

	// 영화 예약) 좌석
	@ResponseBody
	@RequestMapping("androidMovieSeat")
	public Map<String, Object> androidMovieSeat(HttpServletRequest req) {
		int thIdx = Integer.parseInt(req.getParameter("theater"));
		int thShIdx = Integer.parseInt(req.getParameter("scheduleIdx"));

		// 상영관 정보
		TheaterVO theater = movieDao.theaterDetail(thIdx);

		// 상영관 좌석 정보
		Map<String, Integer> tmp = new HashMap<String, Integer>();
		tmp.put("theater_index", thIdx);
		tmp.put("theater_schedule_index", thShIdx);
		ArrayList<Theater_seatVO> list = movieDao.theaterSeatDetail(tmp);

		// 목록 좌석 순서대로 정렬
		ArrayList<Android> seatList = new ArrayList<>();
		for (int i = 0; i < list.size(); i += 1) { // 목록 전체
			for (int col = 1; col <= theater.getTheater_col(); col += 1) { // 가로
				for (int row = 1; row <= theater.getTheater_row(); row += 1) { // 세로
					if (list.get(i).getSeat_col() == col && list.get(i).getSeat_row() == row) {
						Android a = new Android();
						a.setData1(String.valueOf(list.get(i).getSeat_index()));
						a.setData2(String.valueOf(list.get(i).getSeat_state()));
						a.setData3(String.valueOf(list.get(i).getSeat_price()));
						seatList.add(a);
					}
				}
			}
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", theater.getTheater_col());
		map.put("seatList", list);
		return map;
	}

	// 결제
	@ResponseBody
	@RequestMapping("androidMoviePay")
	public Map<String, Object> androidMoviePay(HttpServletRequest req) {
		String id = req.getParameter("id");
		String point = req.getParameter("point"); // 사용한 포인트

		Map<String, Object> map = new HashMap<String, Object>();

		// 회원의 보유 포인트
		if (point == null) {
			point = String.valueOf(dao.getMemberPoint(id));
			map.put("data1", point);

		} else {
			String title = req.getParameter("title");
			String theaterSchedulIndex = req.getParameter("theater_schedule_index");
			String seatIndex = req.getParameter("seat_index");
			String price = req.getParameter("price");

			String[] seatIndexs = seatIndex.split(",");

			int cnt;
			Map<String, Object> payMap = new HashMap<String, Object>();

			// history 추가
			cnt = movieDao.insertHistory(id);

			// 영화 history 추가
			payMap.put("theater_schedule_index", theaterSchedulIndex);
			payMap.put("movie_history_price", price);
			payMap.put("member_point", point);
			if (cnt != 0) {
				cnt = movieDao.insertMovieHistory(payMap);
			}

			// 좌석 테이블의 seat_state
			payMap.put("member_id", id);
			if (cnt != 0) {
				for (int i = 0; i < seatIndexs.length; i++) {
					payMap.put("seat_index", seatIndexs[i]);
					dao.updateSeatState(payMap);
				}
			}

			// 스케줄테이블의 emtpy_seat 감소(결제한 만큼)
			payMap.put("totalCnt", seatIndexs.length);
			if (cnt != 0) {
				cnt = movieDao.updateEmptySeat(payMap);
			}

			// 영화 관람객수 증가
			payMap.put("movie_title", title);
			if (cnt != 0) {
				cnt = dao.movieCountUpdate(payMap);
			}

			// 회원 포인트 증가 (결제금액 * 0.1) movie_history_price_10perc
			double persent = Integer.parseInt(price) * 0.1;
			payMap.put("movie_history_price_10perc", (int) persent);
			if (cnt != 0) {
				cnt = movieDao.updateIncreasePoint(payMap);
			}

			// 포인트 사용했을시 감소
			if (cnt != 0) {
				if (!point.equals("0")) {
					cnt = movieDao.updateDecreasePoint(payMap);
				}
			}

			map.put("data2", cnt);
		}

		return map;
	}

	// 식당 정보
	@ResponseBody
	@RequestMapping("androidRestaurantInfo")
	public Map<String, Object> androidRestaurantInfo(HttpServletRequest req) {
		String index = req.getParameter("index");
		String title = req.getParameter("title");
		
		ArrayList<Android> list;
		if(index != null) {
			list = dao.getRestaurantMenu(Integer.parseInt(index));
		} else {
			list = dao.getRestaurantTitleMenu(title);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		return map;
	}

	// 식당 예약) 좌석
	@ResponseBody
	@RequestMapping("androidRestaurantTicket")
	public Map<String, Object> androidRestaurantTicket(HttpServletRequest req) {
		int restIdx = Integer.parseInt(req.getParameter("restIdx"));
		String restTableIdx = req.getParameter("restTableIdx");
		String day = req.getParameter("day");
		String time = req.getParameter("time");
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (restTableIdx == null) {
			TableVO table = restDao.getColRow(restIdx);
			ArrayList<Android> seatList = dao.getRestaurantSeatState(restIdx);
			
			Map<String, Object> tmp = new HashMap<String, Object>();
			tmp.put("rest_index", restIdx); 
			tmp.put("start", day + " " + time);
			ArrayList<Android> ticketList = dao.getRestaurantTicketSeat(tmp);
			
			map.put("data", table.getTable_col());
			map.put("list", seatList);
			map.put("list2", ticketList);
		} else {
			String[] tableIdxs = restTableIdx.split(",");//idx,idx
			
			String seatColRow = req.getParameter("seatColRow");//col,row/col,row/..
			String[] colRows = seatColRow.split("/");//col,row
			
			String id = req.getParameter("id");
			
			//예약 1) 스케줄 등록
			Restaurant_scheduleVO rs = new Restaurant_scheduleVO();
			rs.setRestaurant_index(restIdx);
			
			//예약 시작
			Timestamp ts = Timestamp.valueOf(day + " " + time + ":00");
			rs.setSchedule_startTime(ts);
			
			//예약 끝
			String[] tt = time.split(":");
			int tmpT = Integer.parseInt(tt[1]) + 30;
			if(tmpT == 60) { 
				tt[0] = (Integer.parseInt(tt[0]) + 1) + "";
				tt[1] = "00";
			} else {
				tt[1] = "30";
			}
			ts = Timestamp.valueOf(day + " " + tt[0] + ":" + tt[1] + ":00");
			rs.setSchedule_endTime(ts);
			
			int cnt = dao.setRestaurantSchedule(rs);
			log.info("******************* 1 " + rs.getRestaurant_schedule_index() + " / " + rs.getSchedule_startTime() + " / " + rs.getSchedule_endTime());
			
			//예약 2) 테이블 예약
			if(cnt != 0) {
				String[] colRow = seatColRow.split(",");
				
				Map<String, Object> tmp = new HashMap<String, Object>();
				tmp.put("restaurant_index", restIdx);
				tmp.put("table_state", 3);
				for(int i = 0; i < tableIdxs.length; i += 1) {
					tmp.put("restaurant_table_index", tableIdxs[i]);
					//tmp.put("restaurant_table_index", 0);
					
					String[] xy = colRows[i].split(",");
					tmp.put("table_col", Integer.parseInt(xy[0]));
					tmp.put("table_row", Integer.parseInt(xy[1]));
					cnt = dao.setRestaurantTable(tmp);
					
					log.info("******************* 2 " + tableIdxs[i] + "/" + xy[0] + "," + xy[1]);
				}
			}
			
			if(cnt != 0) {
				cnt = dao.setRestaurantMainHistory(id);
				log.info("******************* 3 " + id);
			}
			if(cnt != 0) {
				for(int i = 0; i < tableIdxs.length; i += 1) {
					cnt = dao.setRestaurantHistory(Integer.parseInt(tableIdxs[i]));
					log.info("******************* 4 " + tableIdxs[i]);
				}
			}
			
			map.put("cnt", cnt);
		}
		return map;
	}
}
