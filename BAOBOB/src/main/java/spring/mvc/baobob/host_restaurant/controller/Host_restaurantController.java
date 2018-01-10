package spring.mvc.baobob.host_restaurant.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.host_restaurant.service.Host_restaurantService;

@Controller
public class Host_restaurantController {
	@Autowired
	Host_restaurantService service;
	
	// 식당[1] 메뉴 리스트
	@RequestMapping(value = "/hostMenuList")
	public String hostMenuList(HttpServletRequest req, Model model) {
		System.out.println("hostMenuList()");

		service.menuList(req, model);
		
		return "host/host_restaurant/hostMenuList";
	}
	
	// 식당[1] 메뉴 추가
	@RequestMapping(value = "/hostMenuAddForm")
	public String hostMenuAddForm(HttpServletRequest req, Model model) {
		System.out.println("hostMenuAddForm()");
		
		service.menuList(req, model);
		
		return "host/host_restaurant/hostMenuAddForm";
	}
	
	// 식당[1] 메뉴 추가 처리
	@RequestMapping(value = "/hostMenuAddPro")
	public String hostMenuAddPro(MultipartHttpServletRequest req, Model model) {
		System.out.println("hostMenuAddPro()");
		
		service.menuAdd(req, model);
		
		return "host/host_restaurant/hostMenuAddPro";
	}
}
