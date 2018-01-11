package spring.mvc.baobob.host_restaurant.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.host_restaurant.persistence.Host_restaurantDAO;
import spring.mvc.baobob.vo.MenuVO;

@Service
public class Host_restaurantServiceImpl implements Host_restaurantService {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	Host_restaurantDAO dao;
	
	// 식당[1] 메뉴 리스트
	@Override
	public void menuList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		log.debug("service.menuList()");

		int pageSize = 4; // 한 페이지당 출력할 글의 수
		int pageBlock = 3; // 한 블록당 출력할 페이지의 수

		int cnt = 0; // 글 개수
		int start = 0; // 현재 페이지 글 시작번호
		int end = 0; // 현재 페이지 글 마지막번호
		int number = 0; // 출력할 글 번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 개수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		cnt = dao.getMenuCnt();

		// 글 개수
		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 설정
		}

		currentPage = (Integer.parseInt(pageNum)); // 현재 페이지

		// pageCnt = 12 / 5 + 1
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 개수 + 나머지

		// 1 = (1-1) * 5 + 1
		// 6 = (2-1) * 5 + 1
		// 11 = (3-1) * 5 + 1
		// 21 = (5-1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1; // 현재 페이지 시작번호

		// 5 = 1 + 5 - 1
		end = start + pageSize - 1;// 현재 페이지 끝번호
		// end = currentPage * pageSize;

		if (end > cnt) {
			end = cnt;
		}

		// = 21 - (5 - 1) * 5;
		number = cnt - (currentPage - 1) * pageSize; // 출력할 글번호

		if (cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);

			// 게시글 목록 조회
			ArrayList<MenuVO> dtos = dao.getMenuList(map);
			model.addAttribute("dtos", dtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5 / 3) * 3 + 1 = 4

		if ((currentPage % pageBlock == 0)) {
			startPage -= pageBlock;
		}

		endPage = startPage + pageBlock - 1; // 6 = 4 + 3 - 1

		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("cnt", cnt); // 글개수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지개수
			model.addAttribute("pageCount", pageCount); // 페이지개수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 식당[1] 메뉴 추가
	@Override
	public void menuAdd(MultipartHttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		log.debug("service.menuAdd()");

		MultipartFile file = req.getFile("img");
		String saveDir = req.getRealPath("/resources/images/chg/"); // 저장
		String realDir = "C:\\Dev\\workspace_baobob\\BAOBOB\\BAOBOB\\src\\main\\webapp\\resources\\images\\chg"; // 저장

		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));

			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

			int data = 0;

			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();

			String fileName = file.getOriginalFilename();

			MenuVO dto = new MenuVO();
			
			dto.setRestaurant_menu_img(fileName);
			dto.setRestaurant_menu_name(req.getParameter("name"));
			dto.setRestaurant_menu_content(req.getParameter("content"));
			dto.setRestaurant_menu_price(Integer.parseInt(req.getParameter("price")));
			int cnt = dao.addMenu(dto);

			model.addAttribute("cnt", cnt);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 식당[1] 수정할 메뉴 정보 보기 / 수정할 정보 입력
	@Override
	public void menuView(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		log.debug("service.menuView()");

		MenuVO dto = new MenuVO();
		
		dto = dao.viewMenu(1);

		model.addAttribute("dto", dto);
	}

	// 식당[1] 메뉴 수정 처리
	@Override
	public void menuMod(MultipartHttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		log.debug("service.menuMod()");
		
		
	}
}
