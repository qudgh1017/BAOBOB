package spring.mvc.baobob.host_restaurant.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.MenuVO;

public interface Host_restaurantDAO {
	// 식당[1] 메뉴 목록(개수)
	public int getMenuCnt(); 

	// 식당[1] 메뉴 목록(내용)
	public ArrayList<MenuVO> getMenuList(Map<String, Object> map);
	
	// 식당[1] 메뉴 추가 처리
	public int addMenu(MenuVO dto);
	
	// 식당[1] 수정할 메뉴 정보 보기
	public MenuVO viewMenu(int index);
	
	// 식당[1] 메뉴 수정 처리
	public int modMenu(MenuVO dto);
}
