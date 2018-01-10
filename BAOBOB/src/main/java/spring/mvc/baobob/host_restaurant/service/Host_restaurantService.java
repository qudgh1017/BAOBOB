package spring.mvc.baobob.host_restaurant.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface Host_restaurantService {
	// 식당[1] 메뉴 리스트
	public void menuList(HttpServletRequest req, Model model);
	
	// 식당[1] 메뉴 추가
	public void menuAdd(MultipartHttpServletRequest req, Model model);
}
