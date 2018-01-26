package spring.mvc.baobob.host_restaurant.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.host_restaurant.persistence.Host_restaurantDAO;
import spring.mvc.baobob.vo.EmployeeVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MenuVO;
import spring.mvc.baobob.vo.RestaurantVO;
import spring.mvc.baobob.vo.Restaurant_ChartVO;
import spring.mvc.baobob.vo.Restaurant_scheduleVO;
import spring.mvc.baobob.vo.TableVO;
import spring.mvc.baobob.vo.hostTChartVO;

@Service
public class Host_restaurantServiceImpl implements Host_restaurantService {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	Host_restaurantDAO dao;

	// 매장 리스트
	@Override
	public void restaurantList(HttpServletRequest req, Model model) {
		log.debug("service.restaurantList()");

		int cnt = 0;

		// 매장 수 조회
		cnt = dao.getRestaurantCnt();

		// 모든 매장 정보
		ArrayList<RestaurantVO> dtos = dao.getRestaurantList();

		// 매장 수, 모든 매장 정보 저장
		model.addAttribute("cnt_restaurant", cnt); // 매장 수
		model.addAttribute("dtos_restaurant", dtos); // 모든 매장 정보
	}

	// 매장 추가 처리
	@Override
	public void restaurantAdd(HttpServletRequest req, Model model) {
		log.debug("service.restaurantAdd()");

		int cnt = 0;
		
		// 테이블 index
		int index = 0;

		// 타일의 상태(테이블인지 복도인지)
		String info = req.getParameter("info");
		
		// 매장을 구성하는 타일의 행열 (예:5*5)
		int col = Integer.parseInt(req.getParameter("col")); // 행
		int row = Integer.parseInt(req.getParameter("row")); // 열
		
		// 매장 정보
		String name = req.getParameter("name");	// 매장명
		String tel = req.getParameter("tel"); // 매장 전화번호

		// 매장 정보 저장
		RestaurantVO restaurant_dto = new RestaurantVO();
		restaurant_dto.setRestaurant_name(name);
		restaurant_dto.setRestaurant_tel(tel);

		// 매장 추가 처리
		cnt = dao.addRestaurant(restaurant_dto);

		// 매장 추가에 성공했다면
		if (cnt != 0) {
			// 타일 하나 하나의 상태를 보기 위해 info를 자름
			String[] state = info.split(",");

			// 열만큼 반복
			for (int i = 0; i < row; i++) {
				// 행만큼 반복
				for (int j = 0; j < col; j++) {
					// 테이블 정보 저장
					TableVO table_dto = new TableVO();

					table_dto.setRestaurant_table_index(index);
					table_dto.setState(state[index]);
					table_dto.setTable_row(i);
					table_dto.setTable_col(j);

					// 매장내 테이블 추가 처리
					cnt = dao.addTable(table_dto);

					// 테이블 추가에 성공했다면
					if (cnt != 0) {
						index++;	// 테이블 index 증가
					}
				}
			}
		}

		// 성공 여부 저장
		model.addAttribute("cnt", cnt);
	}

	// 식당 총 관리자 - 수정할 매장 정보 조회
	// 식당 관리자 - 예약 추가시 테이블 선택을 위한 매장 정보 조회
	@Override
	public void restaurantView(HttpServletRequest req, Model model) {
		log.debug("service.restaurantView()");

		String str = req.getParameter("count");
		
		// 예약할 테이블 숫자
		if ((str != null && str.equals("")) || (str != null && str.length() != 0)) {
			Integer count = Integer.parseInt(str);
			// 예약할 테이블 숫자 저장
			model.addAttribute("count", count);
		}
		
		// 예약할 날짜와 시간
		String date = "20" + req.getParameter("date");
		String time = req.getParameter("time");
		
		// 매장 번호
		int restaurant_index = Integer.parseInt(req.getParameter("index"));

		String info = "";
		int col = 0;
		int row = 0;
		
		// 매장 정보
		RestaurantVO restaurant_dto = new RestaurantVO();	
		
		// 매장내 테이블 정보
		TableVO table_dto = new TableVO();	
		
		// 여러 정보를 저장하기 위해 맵 이용
		Map<String, Object> map = new HashMap<String, Object>();

		// 식당 관리자 - 예약 추가시 테이블 선택을 위한 매장 정보 조회
		if ((time != null && time.equals("")) || (time != null && time.length() != 0)) {
			// 날짜와 시간 저장
			model.addAttribute("date", req.getParameter("date"));
			model.addAttribute("time", time);
			
			// DB에 있는 startTime 컬럼에 저장할 변수
			String startTime = date + " " + time + ":00";

			// 시간을 시, 분 형태로 자름
			String[] end = time.split(":");

			// 시작 시간의 분이 00분이면 30분으로 바꿈
			if (end[1].equals("00")) {
				end[1] = "30";
			}
			// 시작 시간의 분이 30분이면 시에 1을 더해주고 00분으로 바꿈
			else if (end[1].equals("30")) {
				end[0] = String.valueOf((Integer.parseInt(end[0]) + 1));
				end[1] = "00";
			}

			// 시, 분, 초 조합
			String endTime = end[0] + ":" + end[1] + ":00";
			
			// 날짜, 시간 조합
			endTime = date + " " + endTime;

			// 예약할 매장, 예약할 날짜 시간 정보 저장
			Restaurant_scheduleVO schedule_dto = new Restaurant_scheduleVO();
			schedule_dto.setRestaurant_index(restaurant_index);
			schedule_dto.setSchedule_startTime(Timestamp.valueOf(startTime));
			schedule_dto.setSchedule_endTime(Timestamp.valueOf(endTime));

			// 스케줄 인덱스 조회
			Integer schedule_index = dao.getScheduleIndex(schedule_dto);

			// 매장 정보 조회
			restaurant_dto = dao.viewRestaurant(restaurant_index);
			
			// 매장을 구성하는 타일의 행열 조회 (예:5*5)
			table_dto = dao.getColRow(restaurant_index);

			col = table_dto.getTable_col() + 1;
			row = table_dto.getTable_row() + 1;

			int restaurant_table_index = 0;

			map.put("restaurant_index", restaurant_index);
			map.put("restaurant_table_index", restaurant_table_index);
			map.put("restaurant_schedule_index", schedule_index);

			// 열만큼 반복
			for (int i = 0; i < row; i++) {
				// 행만큼 반복
				for (int j = 0; j < col; j++) {
					map.replace("restaurant_table_index", restaurant_table_index);

					// 타일 하나하나의 상태를 info에 추가
					info += dao.getState(map);

					// 맨 마지막 정보가 아니면 ',' 추가
					if (!(i + 1 == row && j + 1 == col)) {
						info += ',';
						restaurant_table_index++;	// 테이블 인덱스 1 증가
					}
				}
			}
		} 

		// 식당 총 관리자 - 수정할 매장 정보 조회
		else {
			// 매장 정보 조회
			restaurant_dto = dao.viewRestaurant(restaurant_index);

			// 매장을 구성하는 타일의 행열 조회 (예:5*5)
			table_dto = dao.getColRow(restaurant_index);

			col = table_dto.getTable_col() + 1;
			row = table_dto.getTable_row() + 1;

			int restaurant_table_index = 0;

			map.put("restaurant_index", restaurant_index);
			map.put("restaurant_table_index", restaurant_table_index);

			// 열만큼 반복
			for (int i = 0; i < row; i++) {
				// 행만큼 반복
				for (int j = 0; j < col; j++) {
					map.replace("restaurant_table_index", restaurant_table_index);

					// 타일 하나하나의 상태를 info에 추가
					info += dao.getState(map);

					// 맨 마지막 정보가 아니면 ',' 추가
					if (!(i + 1 == row && j + 1 == col)) {
						info += ',';
						restaurant_table_index++;	// 테이블 인덱스 1 증가
					}
				}
			}
		}
		
		// 매장 정보 저장
		model.addAttribute("dto", restaurant_dto);
		
		// script.js - spaceBody(), spaceBody2()에서 사용할 정보들
		model.addAttribute("info", info);
		model.addAttribute("col", col);
		model.addAttribute("row", row);
	}

	// 식당 총 관리자 - 매장 수정 처리
	@Override
	public void restaurantMod(HttpServletRequest req, Model model) {
		log.debug("service.restaurantMod()");

		int cnt = 0;
		int index = 0;

		// 타일의 상태(테이블인지 복도인지)
		String info = req.getParameter("info");
		
		// 매장을 구성하는 타일의 행열 (예:5*5)
		int col = Integer.parseInt(req.getParameter("col")); // 행
		int row = Integer.parseInt(req.getParameter("row")); // 열

		// 매장 번호
		int restaurant_index = Integer.parseInt(req.getParameter("index"));
		
		// 매장 정보
		String name = req.getParameter("name");	// 매장명
		String tel = req.getParameter("tel"); // 매장 전화번호
		
		// 매장 정보 저장
		RestaurantVO restaurant_dto = new RestaurantVO();
		restaurant_dto.setRestaurant_index(restaurant_index);
		restaurant_dto.setRestaurant_name(name);
		restaurant_dto.setRestaurant_tel(tel);

		// 매장 수정 처리
		cnt = dao.modRestaurant(restaurant_dto);

		// 수정 처리에 성공했다면
		if (cnt != 0) {
			// 매장내 테이블 정보 초기화
			cnt = dao.resetTable(restaurant_dto);
		}

		// 테이블 정보
		TableVO table_dto = new TableVO();
		
		// 여러 정보를 저장하기 위해 맵 이용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurant_dto", restaurant_dto);
		map.put("table_dto", table_dto);

		// 매장내 테이블 정보 초기화에 성공했다면
		if (cnt != 0) {
			// 타일 하나 하나의 상태를 보기 위해 info를 자름
			String[] state = info.split(",");

			// 열만큼 반복
			for (int i = 0; i < row; i++) {
				// 행만큼 반복
				for (int j = 0; j < col; j++) {
					table_dto.setRestaurant_table_index(index);
					table_dto.setState(state[index]);
					table_dto.setTable_row(i);
					table_dto.setTable_col(j);

					map.replace("table_dto", table_dto);

					// 매장 내 테이블 수정 처리
					cnt = dao.modTable(map);

					if (cnt != 0) {
						index++;
					}
				}
			}
		}

		// 성공 여부 저장
		model.addAttribute("cnt", cnt);
	}

	// 식당 총 관리자 - 매장 삭제 처리
	@Override
	public void restaurantDel(HttpServletRequest req, Model model) {
		log.debug("service.restaurantDel()");

		// 매장 번호
		int restaurant_index = Integer.parseInt(req.getParameter("index"));
		
		// 매장 정보 저장
		RestaurantVO dto = new RestaurantVO();
		dto.setRestaurant_index(restaurant_index);

		// 매장 내 테이블 정보 초기화
		int cnt = dao.resetTable(dto);

		// 매장 내 테이블 정보 초기화에 성공했다면
		if (cnt != 0) {
			// 매장 삭제 처리
			cnt = dao.delRestaurant(dto);
		}

		// 성공 여부 저장
		model.addAttribute("cnt", cnt);
	}

	// 식당 총 관리자 - 모든 메뉴 리스트
	@Override
	public void allMenuList(HttpServletRequest req, Model model) {
		log.debug("service.allMenuList()");

		int cnt = 0;
		int count = 1;

		// 식당 개수, 식당 인덱스 체크
		int index[] = dao.getRestaurantIndex();

		ArrayList<MenuVO> dtos = new ArrayList<MenuVO>();
		RestaurantVO dto = new RestaurantVO();

		for (int restaurant_index : index) {
			// 식당 정보 조회
			dto = dao.viewRestaurant(restaurant_index);
			model.addAttribute("dto_" + count, dto);

			// 메뉴 개수 조회
			cnt = dao.getMenuCnt(restaurant_index);
			model.addAttribute("cnt_menu_" + count, cnt);

			// 각 메뉴 정보 조회
			dtos = dao.getMenuList(restaurant_index);
			model.addAttribute("dtos_menu_" + count, dtos);

			count++;
		}
	}

	// 식당 총 관리자 - 모든 직원 리스트
	@Override
	public void allEmployeeList(HttpServletRequest req, Model model) {
		log.debug("service.employeeList()");

		int cnt = 0;
		int count = 1;
		int member_step = 51;

		// 식당 개수, 식당 인덱스 체크
		int index[] = dao.getRestaurantIndex();

		ArrayList<EmployeeVO> dtos = new ArrayList<EmployeeVO>();
		RestaurantVO dto = new RestaurantVO();

		for (int restaurant_index : index) {
			// 식당 정보 조회
			dto = dao.viewRestaurant(restaurant_index);
			model.addAttribute("dto_" + count, dto);

			// 직원 수 조회
			cnt = dao.getEmployeeCnt(member_step);
			model.addAttribute("cnt_empl_" + count, cnt);

			// 각 직원 정보 조회
			dtos = dao.getEmployeeList(member_step);
			model.addAttribute("dtos_empl_" + count, dtos);

			count++;
			member_step++;
		}
	}

	// 식당 총 관리자 - 식당별 차트
	@Override
	public void allAccountChart(HttpServletRequest req, Model model) {
		log.debug("service.allAccountChart()");
		
		// 모든 메뉴의 이름 조회
		String[] restaurant = dao.getRestaurantName();

		// 판매된적있는 메뉴의 이름과 판매액 조회
		Map<String , Object> map = new HashMap<String,Object>();
		
		// mapper에서 불러온 kind와 value가 다건이기때문에 vo형태의 List형으로 받아준다.
		List<Restaurant_ChartVO> menuList = dao.getRestaurantChart();
		
		// List 데이터를 한 건씩 map에 담는다.
		for(Restaurant_ChartVO dto : menuList) {
			map.put(dto.getKind(), dto.getValue());
		}
		
		// 판매된적이 있는지 없는지 확인
		for(String s : restaurant) {
			int cnt = 0;
			
			// 판매된적이 있는 메뉴는 건너뛰고,
			for(Entry<String, Object> m : map.entrySet()) {
				if(s.equals(m.getKey())) {
					cnt = 1;
				}
			}
			
			// 판매된 적이 없는 메뉴는 판매액(value)에 0을 넣어준다.
			if(cnt == 0) {
				map.put(s, 0);
			}
		}

		// 가나다 순으로 정렬하기 위해 트리맵 이용
		TreeMap<String, Object> tm = new TreeMap<String, Object>(map);
		
		// 키값 오름차순 정렬(기본)
		Iterator<String> iteratorKey = tm.keySet().iterator();
		
		String key = "";	// 키
		String keys = "";	// 키의 조합
		String value = "";	// 값
		String values = ""; // 값의 조합
		int cnt = 0;	// 처음인지 확인
		
		while (iteratorKey.hasNext()) {
			key = iteratorKey.next();
			value = String.valueOf(tm.get(key));
			// 처음이면 콤마를 붙이지 않음
			if(cnt == 0) {
				keys = keys + key;
				values = values + value;
				cnt = 1;
			}
			// 처음이 아니면 콤마를 앞에
			else {
				keys = keys + "," + key;
				values = values + "," + value;
			}
		}
		
		// 결과를 저장한다.
		model.addAttribute("keys", keys);
		model.addAttribute("values", values);
		model.addAttribute("count", restaurant.length);
		model.addAttribute("chart", map);
		model.addAttribute("total", tm.get("합계"));
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////

	// 메뉴 리스트
	@Override
	public void menuList(HttpServletRequest req, Model model) {
		log.debug("service.menuList()");

		int cnt = 0;

		// 식당 총 관리자가 아니라면
		if (!(String.valueOf(req.getSession().getAttribute("memStep")).equals("4"))) {
			// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
			int restaurant_index = Integer
					.parseInt(String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2));

			// 메뉴 개수 조회
			cnt = dao.getMenuCnt(restaurant_index);

			// 각 메뉴 정보 조회
			ArrayList<MenuVO> dtos = dao.getMenuList(restaurant_index);

			// 메뉴 개수, 모든 메뉴 정보 저장
			model.addAttribute("cnt_menu", cnt);
			model.addAttribute("dtos_menu", dtos);
		}
	}

	// 메뉴 추가
	@Override
	public void menuAdd(MultipartHttpServletRequest req, Model model) {
		log.debug("service.menuAdd()");

		// 이미지 정보를 가져옴
		MultipartFile file = req.getFile("img");
		
		// 새로 저장할 경로
		String saveDir = req.getRealPath("/resources/images/chg/");
		
		// 저장되어 있는 경로
		String realDir = "C:\\Dev\\workspace_baobob\\BAOBOB\\BAOBOB\\src\\main\\webapp\\resources\\images\\chg\\";

		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));

			// 파일 입출력
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

			int data = 0;

			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();

			// 이미지 파일의 이름
			String fileName = file.getOriginalFilename();

			// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
			int restaurant_index = Integer
					.parseInt(String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2));

			// 메뉴 정보
			String menuName = req.getParameter("name");
			String menuContent = req.getParameter("content");
			int menuPrice = Integer.parseInt(req.getParameter("price"));
			
			// 메뉴 정보 저장
			MenuVO dto = new MenuVO();
			dto.setRestaurant_menu_img(fileName);
			dto.setRestaurant_index(restaurant_index);
			dto.setRestaurant_menu_name(menuName);
			dto.setRestaurant_menu_content(menuContent);
			dto.setRestaurant_menu_price(menuPrice);
			
			// 메뉴 추가 전 메뉴인덱스 계산
			Integer restaurant_menu_index = dao.getMenuIndex(restaurant_index);
			if(restaurant_menu_index != null) {
				dto.setRestaurant_menu_index(restaurant_menu_index);
			}
			
			// 메뉴 추가 처리
			int cnt = dao.addMenu(dto);

			// 성공 여부 저장
			model.addAttribute("cnt", cnt);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 메뉴 정보 상세 조회
	@Override
	public void menuView(HttpServletRequest req, Model model) {
		log.debug("service.menuView()");

		// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
		int restaurant_index = Integer
				.parseInt(String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2));
		
		// 조회할 메뉴의 index
		int restaurant_menu_index = Integer.parseInt(req.getParameter("index"));

		// 조회할 메뉴 정보 저장
		MenuVO dto = new MenuVO();
		dto.setRestaurant_index(restaurant_index);
		dto.setRestaurant_menu_index(restaurant_menu_index);

		// 메뉴 상세 정보 조회
		dto = dao.viewMenu(dto);

		// 조회한 메뉴 상세 정보 저장
		model.addAttribute("dto", dto);
	}

	// 메뉴 수정 처리
	@Override
	public void menuMod(MultipartHttpServletRequest req, Model model) {
		log.debug("service.menuMod()");

		// 이미지 정보를 가져옴
		MultipartFile file = req.getFile("img");
		
		// 새로 저장할 경로
		String saveDir = req.getRealPath("/resources/images/chg/");
		
		// 저장되어 있는 경로
		String realDir = "C:\\Dev\\workspace_baobob\\BAOBOB\\BAOBOB\\src\\main\\webapp\\resources\\images\\chg\\";

		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));

			// 파일 입출력
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

			int data = 0;

			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();

			// 이미지 파일의 이름
			String fileName = file.getOriginalFilename();

			// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
			int restaurant_index = Integer
					.parseInt(String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2));

			// 메뉴 정보
			int restaurant_menu_index = Integer.parseInt(req.getParameter("restaurant_menu_index"));
			String menuName = req.getParameter("name");
			String menuContent = req.getParameter("content");
			int menuPrice = Integer.parseInt(req.getParameter("price"));
			
			// 메뉴 정보 저장
			MenuVO dto = new MenuVO();
			dto.setRestaurant_menu_img(fileName);
			dto.setRestaurant_index(restaurant_index);
			dto.setRestaurant_menu_index(restaurant_menu_index);
			dto.setRestaurant_menu_name(menuName);
			dto.setRestaurant_menu_content(menuContent);
			dto.setRestaurant_menu_price(menuPrice);

			// 메뉴 정보 수정 처리
			int cnt = dao.modMenu(dto);

			// 성공 여부 저장
			model.addAttribute("cnt", cnt);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 메뉴 삭제 처리
	@Override
	public void menuDel(HttpServletRequest req, Model model) {
		log.debug("service.menuDel()");

		// 메뉴 번호
		int restaurant_menu_index = Integer.parseInt(req.getParameter("index"));
		
		// 메뉴 정보 저장
		MenuVO dto = new MenuVO();
		dto.setRestaurant_menu_index(restaurant_menu_index);

		// 메뉴 삭제 처리
		int cnt = dao.delMenu(dto);
		
		// 성공 여부 저장
		model.addAttribute("cnt", cnt);
	}

	// 직원 리스트
	@Override
	public void employeeList(HttpServletRequest req, Model model) {
		log.debug("service.employeeList()");

		int cnt = 0;
		
		// 관리자의 step에 10을 더하면 그 식당의 직원들을 조회할 수 있다. mapper에서 사용하기 위해 저장
		int member_step = Integer.parseInt(String.valueOf(req.getSession().getAttribute("memStep")));

		// 직원 수 조회
		cnt = dao.getEmployeeCnt(member_step);

		// 각 직원 정보 조회
		ArrayList<EmployeeVO> dtos = dao.getEmployeeList(member_step);

		// 직원 수, 직원 정보 저장
		model.addAttribute("cnt_empl", cnt);
		model.addAttribute("dtos_empl", dtos);
	}

	// 전체 회원 목록(직원 등록)
	@Override
	public void memberList(HttpServletRequest req, Model model) {
		log.debug("service.memberList()");

		int cnt = 0;

		// 전체 회원 수 조회(타 식당, 타 부서 직원 제외)
		cnt = dao.getMemberCnt();

		// 각 회원 정보 조회(타 식당, 타 부서 직원 제외)
		ArrayList<Member> dtos = dao.getMemberList();

		// 회원 수, 회원 정보 저장
		model.addAttribute("cnt_mem", cnt);
		model.addAttribute("dtos_mem", dtos);
	}

	// 직원으로 등록할 회원 정보 조회
	@Override
	public void memberView(HttpServletRequest req, Model model) {
		log.debug("service.memberView()");

		// 회원 정보 저장
		Member dto = new Member();
		dto = dao.viewMember(req.getParameter("id"));

		model.addAttribute("dto", dto);
	}

	// 직원 등록 처리
	@Override
	public void employeeAdd(HttpServletRequest req, Model model) {
		log.debug("service.employeeAdd()");

		int cnt = 0;
		
		// 관리자의 step에 10을 더하면 그 식당의 직원을 조회할 수 있다. mapper에서 사용하기 위해 저장
		int member_step = Integer.parseInt(String.valueOf(req.getSession().getAttribute("memStep")));
		String member_id = req.getParameter("id");
		String jumin2 = req.getParameter("jumin2");
		
		// 여러 정보를 저장하기 위해 맵 이용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("jumin2", jumin2);
		map.put("member_step", (member_step + 10));

		// member_step 변경
		cnt = dao.updateStep(map);

		// step 변경에 성공했다면
		if (cnt != 0) {
			// 직원 등록 처리
			cnt = dao.addEmployee(map);
		}

		// 성공 여부 저장
		model.addAttribute("cnt", cnt);
	}

	// 직원 정보 조회
	@Override
	public void employeeView(HttpServletRequest req, Model model) {
		log.debug("service.employeeView()");

		// 조회할 직원의 아이디
		String id = req.getParameter("id");
		
		// 직원 정보 저장
		EmployeeVO dto = new EmployeeVO();
		dto = dao.viewEmployee(id);

		model.addAttribute("dto_empl", dto);
	}

	// 직원 삭제 처리
	@Override
	public void employeeDel(HttpServletRequest req, Model model) {
		log.debug("service.employeeDel()");

		int cnt = 0;

		String member_id = req.getParameter("id");
		
		// step 계산을 위한 누적 포인트 조회
		int step = dao.getCumPoint(req.getParameter("id"));

		// 누적 포인트에 따라 step이 달라짐
		if (0 <= step && step <= 15000) {
			step = 9;
		} else if (15001 <= step && step <= 30000) {
			step = 10;
		} else if (30001 <= step && step <= 45000) {
			step = 11;
		} else if (45001 <= step) {
			step = 12;
		}
		
		// 여러 정보를 저장하기 위해 맵 이용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("member_step", step);

		// 직원 삭제 처리
		cnt = dao.delEmployee(map);

		// 삭제에 성공했다면
		if (cnt != 0) {
			// member_step 변경
			cnt = dao.updateStep(map);
		}

		// 성공 여부 저장
		model.addAttribute("cnt", cnt);
	}

	// 예약 리스트
	@Override
	public void reservList(HttpServletRequest req, Model model) {
		log.debug("service.reservList()");

		// 현재 날짜 저장
		SimpleDateFormat date = new SimpleDateFormat("yy-MM-dd", Locale.KOREA);
		Date sysdate = new Date();
		String today = date.format(sysdate);

		// 식당 총 관리자가 아니라면
		if (!(String.valueOf(req.getSession().getAttribute("memStep")).equals("4"))) {
			// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
			int restaurant_index = Integer
					.parseInt(String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2));

			// 여러 정보를 저장하기 위해 맵 이용
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("restaurant_index", restaurant_index);
			map.put("startTime", today + "-00:00");
			map.put("endTime", today + "-23:59");

			// 선택 날짜 예약 조회
			ArrayList<Restaurant_scheduleVO> dtos = dao.getReservList(map);

			// 정보 저장
			model.addAttribute("index", restaurant_index);
			model.addAttribute("date", today);
			model.addAttribute("dtos", dtos);
		}
	}

	// 예약 추가 처리
	@Override
	public void reservAdd(HttpServletRequest req, Model model) {
		log.debug("service.reservAdd()");

		int cnt = 0;
		int index = 0;
		
		// 식당 번호
		int restaurant_index = Integer.parseInt(req.getParameter("index"));

		// 타일의 상태(테이블인지 복도인지)
		String info = req.getParameter("info");
		
		// 매장을 구성하는 타일의 행열 (예:5*5)
		int col = Integer.parseInt(req.getParameter("col")); // 행
		int row = Integer.parseInt(req.getParameter("row")); // 열

		String date = "20" + req.getParameter("date");
		String time = req.getParameter("time") + ":00";

		// DB에 있는 startTime 컬럼에 저장할 변수
		String startTime = date + " " + time;

		// 시간을 시, 분 형태로 자름
		String[] end = time.split(":");

		// 시작 시간의 분이 00분이면 30분으로 바꿈
		if (end[1].equals("00")) {
			end[1] = "30";
		}
		// 시작 시간의 분이 30분이면 시에 1을 더해주고 00분으로 바꿈
		else if (end[1].equals("30")) {
			end[0] = String.valueOf((Integer.parseInt(end[0]) + 1));
			end[1] = "00";
		}

		// 시, 분, 초 조합
		String endTime = end[0] + ":" + end[1] + ":00";
		
		// 날짜, 시간 조합
		endTime = date + " " + endTime;

		// 매장 정보 저장
		RestaurantVO restaurant_dto = new RestaurantVO();
		restaurant_dto.setRestaurant_index(restaurant_index);

		// 예약할 매장, 예약할 날짜 시간 정보 저장
		Restaurant_scheduleVO schedule_dto = new Restaurant_scheduleVO();
		schedule_dto.setSchedule_startTime(Timestamp.valueOf(startTime));
		schedule_dto.setSchedule_endTime(Timestamp.valueOf(endTime));
		schedule_dto.setRestaurant_index(restaurant_index);

		// 스케줄 index 조회
		Integer schedule_index = dao.getScheduleIndex(schedule_dto);

		// 스케줄 index가 있다면
		if (schedule_index != null) {
			schedule_dto.setRestaurant_schedule_index(schedule_index);
		}

		// 테이블 정보
		TableVO table_dto = new TableVO();
		
		// 여러 정보를 저장하기 위해 맵 이용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurant_dto", restaurant_dto);
		map.put("table_dto", table_dto);
		map.put("schedule_dto", schedule_dto);

		// 스케줄 index가 없다면
		if (schedule_index == null) {
			// 새로운 예약 추가
			cnt = dao.addReserv(map);
		}

		// 새로운 예약을 추가한게 아니라면(기존 예약이 있다면)
		if (cnt == 0) {
			// 테이블 초기화(예약 위에 또 예약하는 경우)
			cnt = dao.resetTable2(schedule_dto);
		}

		// 새로운 예약을 추가한 경우 혹은 테이블을 초기화한 경우
		if (cnt != 0) {
			String[] state = info.split(",");

			// 열만큼 반복
			for (int i = 0; i < row; i++) {
				// 행만큼 반복
				for (int j = 0; j < col; j++) {
					table_dto.setRestaurant_table_index(index);
					table_dto.setState(state[index]);
					table_dto.setTable_row(i);
					table_dto.setTable_col(j);

					map.replace("table_dto", table_dto);

					cnt = dao.modTable2(map);

					if (cnt != 0) {
						index++;
					}
				}
			}
		}
		
		// 테이블 예약까지 성공했다면
		if(cnt != 0) {
			String member_id = req.getParameter("member_id");

			System.out.println("id : " + member_id);
			
			// 아이디 존재 유무 및 예약 가능 아이디인지 확인
			Integer member_step = dao.confirmId(member_id);

			// 이용 가능한 멤버라면
			if(member_step != null && ((1 <= member_step && member_step <= 12) || (51 <= member_step && member_step <= 53) || (61 <= member_step && member_step <= 63))) {
				// 히스토리에 이용 내역 추가
				cnt = dao.addHistory(member_id);
				
				// 내역 추가에 성공했다면
				if(cnt != 0) {
					int table_index = Integer.parseInt(req.getParameter("table_index"));
					map.put("restaurant_table_index", table_index);
					// 레스토랑 히스토리 테이블에 이용 내역 추가
					cnt = dao.addRestaurantHistory(map);
				}
			} else {
				cnt = 2;
			}
		}
		
		// 성공 여부 저장
		model.addAttribute("cnt", cnt);
	}

	// 선택한 날짜에 있는 모든 예약 조회
	@Override
	public void reservView(HttpServletRequest req, Model model) {
		log.debug("service.reservView()");

		// 검색할 날짜
		String searchDate = req.getParameter("date");
		
		// 식당 번호
		int restaurant_index = Integer.parseInt(req.getParameter("index"));
		
		// timestamp형으로 변환하여 날짜를 계산하기 위한 폼
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateForm2 = new SimpleDateFormat("yy-MM-dd");

		try {
			// yyyy-MM-dd HH:mm:ss 형으로 searchDate를 변환
			Date sysdate = dateForm.parse("20" + searchDate + " 00:00:00");
			String date = dateForm2.format(sysdate);

			// 여러 정보를 저장하기 위해 맵 이용
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("restaurant_index", restaurant_index);
			map.put("startTime", date + "-00:00");
			map.put("endTime", date + "-23:59");

			// 선택한 날짜에 있는 모든 예약 조회
			ArrayList<Restaurant_scheduleVO> dtos = dao.getReservList(map);

			// 정보 저장
			model.addAttribute("date", searchDate);
			model.addAttribute("index", restaurant_index);
			model.addAttribute("dtos", dtos);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	// 선택한 날짜에 들어있는 테이블 정보 조회
	@Override
	public TableVO restaurantView2(HttpServletRequest req, Model model) {
		log.debug("service.restaurantView2()");

		// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
		int restaurant_index = Integer.parseInt(req.getParameter("index").substring(1, 2));
		
		// 예약 정보 저장
		Restaurant_scheduleVO schedule_dto = new Restaurant_scheduleVO();
		schedule_dto.setSchedule_startTime(Timestamp.valueOf(req.getParameter("startTime")));
		schedule_dto.setSchedule_endTime(Timestamp.valueOf(req.getParameter("endTime")));
		schedule_dto.setRestaurant_index(restaurant_index);

		// 스케줄 인덱스 조회
		int schedule_index = dao.getScheduleIndex(schedule_dto);

		// 식당 정보 조회
		RestaurantVO restaurant_dto = new RestaurantVO();
		restaurant_dto = dao.viewRestaurant(restaurant_index);

		// 테이블 정보 저장
		TableVO table_dto = new TableVO();

		// 매장을 구성하는 타일의 행열 조회 (예:5*5)
		table_dto = dao.getColRow(restaurant_index);

		// 매장을 구성하는 타일의 행열
		int col = table_dto.getTable_col() + 1;
		int row = table_dto.getTable_row() + 1;

		String info = "";
		int restaurant_table_index = 0;
		// 여러 정보를 저장하기 위해 맵 이용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurant_index", restaurant_index);
		map.put("restaurant_table_index", restaurant_table_index);
		map.put("restaurant_schedule_index", schedule_index);

		// 열만큼 반복
		for (int i = 0; i < row; i++) {
			// 행만큼 반복
			for (int j = 0; j < col; j++) {
				map.replace("restaurant_table_index", restaurant_table_index);

				// 타일 하나하나의 상태를 info에 추가
				info += dao.getState(map);

				// 맨 마지막 정보가 아니면 ',' 추가
				if (!(i + 1 == row && j + 1 == col)) {
					info += ',';
					restaurant_table_index++;	// 테이블 인덱스 1 증가
				}
			}
		}

		// 테이블 정보 저장
		table_dto.setState(info);
		table_dto.setTable_col(col);
		table_dto.setTable_row(row);

		// 매장 정보 저장
		model.addAttribute("dto", restaurant_dto);
		
		// script.js - spaceBody(), spaceBody2()에서 사용할 정보들
		model.addAttribute("info", info);
		model.addAttribute("col", col);
		model.addAttribute("row", row);

		// 날짜 저장
		String date = req.getParameter("date");
		model.addAttribute("date", date);

		// 선택한 시간이 있다면
		if (req.getParameter("time") != "") {
			// 시간 저장
			String time = req.getParameter("time");
			model.addAttribute("time", time);
		}
		
		// 테이블 정보 리턴
		return table_dto;
	}

	// 예약된 테이블 조회
	@Override
	public void useTableView(HttpServletRequest req, Model model) {
		log.debug("service.useTableView()");

		// 테이블 수
		int table_cnt = 1;

		// 사용중인 테이블 수
		int use_table_cnt = 0;

		System.out.println("memStep : " + (String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2)));
		
		// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
		int restaurant_index = Integer.parseInt((String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2)));
		
		// 예약 번호
		int restaurant_schedule_index = Integer.parseInt(req.getParameter("restaurant_schedule_index"));

		// 예약 정보 저장
		Restaurant_scheduleVO schedule_dto = new Restaurant_scheduleVO();
		schedule_dto.setRestaurant_index(restaurant_index);
		schedule_dto.setRestaurant_schedule_index(restaurant_schedule_index);

		// 테이블 정보 저장
		TableVO table_dto = new TableVO();
		table_dto = dao.getColRow(restaurant_index);

		// 테이블 행열 조회
		int col = table_dto.getTable_col() + 1;
		int row = table_dto.getTable_row() + 1;

		int table_index = 0;

		// 여러 정보를 저장하기 위해 맵 이용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurant_index", restaurant_index);
		map.put("restaurant_table_index", table_index);
		map.put("restaurant_schedule_index", restaurant_schedule_index);

		ArrayList<String> use_tables = new ArrayList<String>();
		ArrayList<String> bill = new ArrayList<String>();
		ArrayList<String> reserv_id = new ArrayList<String>();
		ArrayList<String> history_state = new ArrayList<String>();

		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				map.replace("restaurant_table_index", table_index);

				// state 정보 조회
				int state = dao.getState(map);

				// state가 사용중인 테이블인 경우 use_tables리스트에 추가
				if (state == 3) {
					use_tables.add(String.valueOf(table_cnt));
					
					// 주문 가격 계산(테이블별 결산)
					Integer payValue = dao.getBill(map);
					
					// 주문 가격이 없다면
					if(payValue == null ) {
						// null이 아닌 0을 add한다.
						bill.add("0");
					}
					// 주문 가격이 있다면
					else {
						// 주문 가격 저장
						bill.add(String.valueOf(payValue));
					}
					
					// 사용중인 테이블 개수 증가
					use_table_cnt++;
					
					// 예약한 아이디 조회
					String id = dao.getReservId(map);
					
					// 히스토리 인덱스를 이용해 예약자 아이디 확인
					reserv_id.add(id);
					
					// 결제한 테이블인지 확인
					int h_state = dao.getHistoryState(map);
					
					if(h_state == 1) {
						history_state.add("(결제 완료)");
					} else {
						history_state.add("");
					}
				}

				// 테이블을 찾으면 count를 증가시킨다.(사용중인 테이블이 몇번 테이블인지 확인하기 위함)
				if (state != 0) {
					// 테이블 개수 증가
					table_cnt++;
				}

				// DB내 저장된 테이블 index
				table_index++;
			}
		}

		// 몇일 몇시 예약인지 알기 위해 저장
		model.addAttribute("restaurant_schedule_index", restaurant_schedule_index);

		// 이용중인 테이블들을 저장
		model.addAttribute("use_tables", use_tables);
		
		// 테이블별 주문한 가격 저장
		model.addAttribute("bill", bill);

		// 몇번 테이블인지 알기위해 저장
		model.addAttribute("table_cnt", table_cnt);

		// 사용 중인 테이블이 0개 이상일 때 화면 출력을 위해 저장
		model.addAttribute("use_table_cnt", use_table_cnt);

		// 사용 중인 테이블이 어떤 아이디로 예약된 자리인지 알기 위해 저장
		model.addAttribute("reserv_id", reserv_id);
		
		// 결제 여부를 알기 위해 저장
		model.addAttribute("history_state", history_state);
	}

	// 테이블에 주문 추가(판매)
	@Override
	public void orderAdd(HttpServletRequest req, Model model) {
		log.debug("service.orderAdd()");

		// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
		int restaurant_index = Integer
				.parseInt((String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2)));
		
		// 예약 번호
		int restaurant_schedule_index = Integer.parseInt(req.getParameter("restaurant_schedule_index"));
		
		// 테이블 번호
		int table_Num = Integer.parseInt(req.getParameter("table_index"));
		
		// 메뉴 번호
		int menu_Num = Integer.parseInt(req.getParameter("menu_index"));

		// 메뉴 수량
		int menu_Count = Integer.parseInt(req.getParameter("menu_count"));
		
		// 테이블 정보 저장
		TableVO table_dto = new TableVO();
		table_dto = dao.getColRow(restaurant_index);

		// 매장을 구성하는 타일의 행열 조회 (예:5*5)
		int col = table_dto.getTable_col() + 1;
		int row = table_dto.getTable_row() + 1;

		// 테이블 인덱스
		int table_index = 0;

		// 사용중인 테이블 수
		int table_cnt = 0;

		// 여러 정보를 저장하기 위해 맵 이용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurant_index", restaurant_index);
		map.put("restaurant_table_index", table_index);
		map.put("restaurant_schedule_index", restaurant_schedule_index);

		loop: // 2중 for문을 한번에 탈출하기 위한 라벨
		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				map.replace("restaurant_table_index", table_index);

				// state 정보 조회
				int state = dao.getState(map);

				if (state != 0) {
					// 몇번째 테이블인지 확인
					table_cnt++;
				}

				// 화면에서 가져온 테이블 번호가 되면 반복을 종료한다.
				if (table_cnt == table_Num) {
					break loop;
				}
				// DB내 저장된 테이블 index
				table_index++;
			}
		}
		
		// 주문한 메뉴 번호, 주문한 수량 저장
		map.put("restaurant_menu_index", menu_Num);
		map.put("restaurant_menu_count", menu_Count);
		
		// 이미 주문한 메뉴인지 확인
		Integer cnt = dao.getMenuCount(map);
		
		// 이미 주문한 메뉴가 아니라면
		if(cnt == null) {
			// 주문 추가 처리
			cnt = dao.addFoodHistory(map);
		}
		// 이미 주문한 메뉴라면
		else {
			// 주문 추가할 수량 계산
			map.put("restaurant_menu_count", cnt + menu_Count);
			
			// 주문한 메뉴인 경우 수량 누적
			cnt = dao.modFoodHistory(map);
		}

		// 성공 여부 저장
		model.addAttribute("cnt", cnt);
	}

	// 주문 삭제 처리
	@Override
	public void orderDel(HttpServletRequest req, Model model) {
		log.debug("service.orderDel()");

		// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
		int restaurant_index = Integer
				.parseInt((String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2)));
		int restaurant_schedule_index = Integer.parseInt(req.getParameter("restaurant_schedule_index")); // 예약 번호
		int table_Num = Integer.parseInt(req.getParameter("table_Num")); // 테이블 번호
		int menu_Num = Integer.parseInt(req.getParameter("menu_Num")); // 메뉴 번호
		int menu_Count = Integer.parseInt(req.getParameter("menu_Count")); // 메뉴 수량
		
		// 여러 정보를 저장하기 위해 맵 이용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurant_index", restaurant_index);
		map.put("restaurant_schedule_index", restaurant_schedule_index);
		map.put("restaurant_table_index", table_Num);
		map.put("restaurant_menu_index", menu_Num);
		map.put("restaurant_menu_count", menu_Count);
		
		Integer cnt = dao.getMenuCount(map);
		
		// 이미 주문된 수량이 취소할 수량보다 크다면
		if(cnt > menu_Count) {
			// 주문 취소할 수량 계산
			map.put("restaurant_menu_count", cnt - menu_Count);
			
			// 일부분 주문 취소
			cnt = dao.modFoodHistory(map);
		}
		// 이미 주문된 수량이 취소할 수량보다 작다면
		else {
			// 주문 삭제 처리
			cnt = dao.delFoodHistory(map);
		}

		// 성공 여부 저장
		model.addAttribute("cnt", cnt);
	}

	// 테이블별 결산(결제 처리)
	@Override
	public void payment(HttpServletRequest req, Model model) {
		log.debug("service.payment()");
		
		int cnt = 0;
		
		// 테이블 수
		int table_cnt = 0;

		// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
		int restaurant_index = Integer
				.parseInt((String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2)));
		int restaurant_schedule_index = Integer.parseInt(req.getParameter("restaurant_schedule_index")); // 예약 번호
		int table_Num = Integer.parseInt(req.getParameter("table_Num")); // 테이블 번호
		String member_id = req.getParameter("member_id"); // 결제 아이디
		int payValue = Integer.parseInt(req.getParameter("payValue"));	// 결제 금액
		int use_point = Integer.parseInt(req.getParameter("point"));	// 결제 포인트
		
		// 회원 등급 조회
		Integer member_step = dao.confirmId(member_id);
		
		if(member_step != null && ((1 <= member_step && member_step <= 12) || (51 <= member_step && member_step <= 53) || (61 <= member_step && member_step <= 63))) {
			int discount = 0;
			
			// 일반 회원일 때
			if(member_step == 9) {
				// 할인액 계산
				discount = (payValue * 5) / 100;
				
				// 지불액 계산
				payValue = ((payValue * 100) - (payValue * 5)) / 100;
			}
			// vip일 때
			else if(member_step == 10) {
				// 할인액 계산
				discount = (payValue * 10) / 100;
				
				// 지불액 계산
				payValue = ((payValue * 100) - (payValue * 10)) / 100;
			}
			// vvip일 때
			else if(member_step == 11) {
				// 할인액 계산
				discount = (payValue * 15) / 100;
				
				// 지불액 계산
				payValue = ((payValue * 100) - (payValue * 15)) / 100;
			}
			// svip일 때
			else if(member_step == 12) {
				// 할인액 계산
				discount = (payValue * 20) / 100;
				
				// 지불액 계산
				payValue = ((payValue * 100) - (payValue * 20)) / 100;
			}

			// 사용 가능한 포인트 조회
			int member_point = dao.getPoint(member_id);
			
			if(member_point >= use_point) {
				// 여러 정보를 저장하기 위해 맵 이용
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("member_id", member_id); // 결제한 아이디
				map.put("member_use_point", use_point); // 사용한 포인트
				map.put("payValue", payValue - use_point); // 사용한 포인트만큼 지불액 감소 후 저장
				map.put("discount", discount); // 할인액 저장
				
				// 예약 정보 저장
				Restaurant_scheduleVO schedule_dto = new Restaurant_scheduleVO();
				schedule_dto.setRestaurant_index(restaurant_index);
				schedule_dto.setRestaurant_schedule_index(restaurant_schedule_index);
		
				// 테이블 정보 저장
				TableVO table_dto = new TableVO();
				table_dto = dao.getColRow(restaurant_index);
		
				// 테이블 행열 조회
				int col = table_dto.getTable_col() + 1;
				int row = table_dto.getTable_row() + 1;
		
				int table_index = 0;
		
				// 여러 정보를 저장하기 위해 맵 이용
				map.put("restaurant_index", restaurant_index);
				map.put("restaurant_table_index", table_index);
				map.put("restaurant_schedule_index", restaurant_schedule_index);
		
				loop: // 2중 for문을 한번에 탈출하기 위한 라벨
				for (int i = 0; i < row; i++) {
					for (int j = 0; j < col; j++) {
						map.replace("restaurant_table_index", table_index);
		
						// state 정보 조회
						int state = dao.getState(map);
		
						if (state != 0) {
							// 몇번째 테이블인지 확인
							table_cnt++;
						}
		
						// 화면에서 가져온 테이블 번호가 되면 이용 내역 테이블 내용 수정
						if (table_cnt == table_Num) {
							// 히스토리 테이블에 이용 내역 추가
							//cnt = dao.modHistory(member_id);
							
							// 추가에 성공했다면
							if(cnt != 0) {
								// 레스토랑 히스토리 테이블에 이용 내역 추가
								//cnt = dao.modRestaurantHistory(map);

								// 추가에 성공했다면
								if(cnt != 0) {
									// member_point, member_cumpoint 계산
									map.put("member_point", ((member_point - use_point) + (payValue / 10)));
									map.put("member_Cumpoint", payValue / 10);
									
									// member정보 수정
									cnt = dao.modMemberPoint(map);
									
									// 수정에 성공했다면
									if(cnt != 0) {
										// step 계산을 위한 누적 포인트 조회
										int step = dao.getCumPoint(member_id);

										// 누적 포인트에 따라 step이 달라짐
										if (0 <= step && step <= 15000) {
											step = 9;
										} else if (15001 <= step && step <= 30000) {
											step = 10;
										} else if (30001 <= step && step <= 45000) {
											step = 11;
										} else if (45001 <= step) {
											step = 12;
										}
										map.put("member_step", step);
										
										// member_step 변경
										cnt = dao.updateStep(map);
									}
								}
							}
							break loop;
						}
						// DB내 저장된 테이블 index
						table_index++;
					}
				}
			} else {
				cnt = 3;
			}
		} else {
			cnt = 2;
		}
		
		// 성공 여부 저장
		model.addAttribute("cnt", cnt);
	}

	// 예약 삭제
	@Override
	public void scheduleDel(HttpServletRequest req, Model model) {
		log.debug("service.scheduleDel()");
		
		int cnt = 0;
		
		// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
		int restaurant_index = Integer
				.parseInt((String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2)));
		int restaurant_schedule_index = Integer.parseInt(req.getParameter("restaurant_schedule_index")); // 예약 번호

		// 테이블 정보 저장
		TableVO table_dto = new TableVO();
		table_dto = dao.getColRow(restaurant_index);

		// 테이블 행열 조회
		int col = table_dto.getTable_col() + 1;
		int row = table_dto.getTable_row() + 1;

		int table_index = 0;

		
		// 여러 정보를 저장하기 위해 맵 이용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurant_index", restaurant_index);
		map.put("restaurant_table_index", table_index);
		map.put("restaurant_schedule_index", restaurant_schedule_index);

		loop: // 2중 for문을 한번에 탈출하기 위한 라벨
		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				map.replace("restaurant_table_index", table_index);

				// state 정보 조회
				int state = dao.getState(map);

				if (state == 3) {
					// 몇번째 테이블인지 확인
					cnt++;
					break loop;
				}
			}
		}
		
		if(cnt == 0) {
			// 예약 정보 저장
			Restaurant_scheduleVO dto = new Restaurant_scheduleVO();
			dto.setRestaurant_index(restaurant_index);
			dto.setRestaurant_schedule_index(restaurant_schedule_index);
			
			cnt = dao.resetTable2(dto);
		}
	}
	
	// 메뉴별 차트
	@Override
	public void accountChart(HttpServletRequest req, Model model) {
		log.debug("service.accountChart()");

		// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
		int restaurant_index = Integer
				.parseInt((String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2)));
		
		// 모든 메뉴의 이름 조회
		String[] menu = dao.getMenuName(restaurant_index);

		// 판매된적있는 메뉴의 이름과 판매액 조회
		Map<String , Object> map = new HashMap<String,Object>();
		
		// mapper에서 불러온 kind와 value가 다건이기때문에 vo형태의 List형으로 받아준다.
		List<Restaurant_ChartVO> menuList = dao.getMenuCountChart(restaurant_index);
		
		// List 데이터를 한 건씩 map에 담는다.
		for(Restaurant_ChartVO dto : menuList) {
			map.put(dto.getKind(), dto.getValue());
		}
		
		// 판매된적이 있는지 없는지 확인
		for(String s : menu) {
			int cnt = 0;
			
			// 판매된적이 있는 메뉴는 건너뛰고,
			for(Entry<String, Object> m : map.entrySet()) {
				if(s.equals(m.getKey())) {
					cnt = 1;
				}
			}
			
			// 판매된 적이 없는 메뉴는 판매액(value)에 0을 넣어준다.
			if(cnt == 0) {
				map.put(s, 0);
			}
		}

		// 가나다 순으로 정렬하기 위해 트리맵 이용
		TreeMap<String, Object> tm = new TreeMap<String, Object>(map);
		
		// 키값 오름차순 정렬(기본)
		Iterator<String> iteratorKey = tm.keySet().iterator();
		
		String key = "";	// 키
		String keys = "";	// 키의 조합
		String value = "";	// 값
		String values = ""; // 값의 조합
		int cnt = 0;	// 처음인지 확인
		
		while (iteratorKey.hasNext()) {
			key = iteratorKey.next();
			value = String.valueOf(tm.get(key));
			// 처음이면 콤마를 붙이지 않음
			if(cnt == 0) {
				keys = keys + key;
				values = values + value;
				cnt = 1;
			}
			// 처음이 아니면 콤마를 앞에
			else {
				keys = keys + "," + key;
				values = values + "," + value;
			}
		}
		
		// 결과를 저장한다.
		model.addAttribute("keys", keys);
		model.addAttribute("values", values);
		model.addAttribute("count", menu.length);
		model.addAttribute("chart", map);
		model.addAttribute("total", tm.get("합계"));
	}

	// 성별 차트
	@Override
	@SuppressWarnings("unchecked")
	public void accountChart2(HttpServletRequest req, Model model) {
		log.debug("service.accountChart2()");

		// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
		int restaurant_index = Integer
				.parseInt((String.valueOf(req.getSession().getAttribute("memStep")).substring(1, 2)));

		Map<String, Integer> map = (Map<String, Integer>) dao.getSexChart(restaurant_index);

		// 성별 차트
		model.addAttribute("sexChart", map);
	}
}
