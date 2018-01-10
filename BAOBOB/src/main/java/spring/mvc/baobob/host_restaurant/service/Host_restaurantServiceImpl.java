package spring.mvc.baobob.host_restaurant.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.baobob.host_restaurant.persistence.Host_restaurantDAO;
import spring.mvc.baobob.vo.MenuVO;

@Service
public class Host_restaurantServiceImpl implements Host_restaurantService {

	@Autowired
	Host_restaurantDAO dao;
	
	// 식당[1] 메뉴 리스트
	@Override
	public void menuList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		System.out.println("service.menuList()");
		
	}

	// 식당[1] 메뉴 추가
	@Override
	public void menuAdd(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		System.out.println("service.menuAdd()");
		
		MenuVO dto = new MenuVO();
		
		dto.setName(req.getParameter("name"));
		dto.setContent(req.getParameter("content"));
		dto.setPrice(Integer.parseInt(req.getParameter("price")));
		
		int cnt = dao.addMenu(dto);
	}
}
