package spring.mvc.baobob.host_restaurant.persistence;

import spring.mvc.baobob.vo.MenuVO;

public interface Host_restaurantDAO {
	// 식당[1] 메뉴 리스트
	
	// 식당[1] 메뉴 추가
	public int addMenu(MenuVO dto);
}
