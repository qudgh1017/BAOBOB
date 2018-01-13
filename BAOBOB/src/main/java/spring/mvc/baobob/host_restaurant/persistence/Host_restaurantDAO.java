package spring.mvc.baobob.host_restaurant.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.EmployeeVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MenuVO;

public interface Host_restaurantDAO {
	// 식당 총 관리자 - 식당 추가 처리
	public int addRestaurant(Map<String, Object> map);

	// 식당 총 관리자 - 식당 내 테이블 추가 처리
	public int addTable(Map<String, Object> map);
	
	// 식당[1] 메뉴 개수
	public int getMenuCnt(); 

	// 식당[1] 각 메뉴 정보
	public ArrayList<MenuVO> getMenuList();
	
	// 식당[1] 메뉴 추가
	public int addMenu(MenuVO dto);
	
	// 식당[1] 수정할 메뉴 정보 보기
	public MenuVO viewMenu(int index);
	
	// 식당[1] 메뉴 수정 처리
	public int modMenu(MenuVO dto);

	// 식당[1] 메뉴 삭제
	public int delMenu(MenuVO dto);

	// 식당[1] 직원 수
	public int getEmployeeCnt();

	// 식당[1] 각 직원 정보
	public ArrayList<EmployeeVO> getEmployeeList();

	// 전체 회원 수
	public int getMemberCnt();

	// 각 회원 정보
	public ArrayList<Member> getMemberList();

	// 식당[1] 직원으로 등록할 회원 정보 조회
	public Member viewMember(String id);

	// 식당[1] 직원 등록
	public int addEmployee(Map<String, Object> map);

	// 식당[1] 직원 등록 처리(member_step 변경)
	public int updateStep(Map<String, Object> map);

	// 식당[1] 직원 정보 조회
	public EmployeeVO viewEmployee(String id);

	// 식당[1] 직원 정보 삭제 처리(member_step 계산)
	public int getCumPoint(String id);

	// 식당[1] 직원 정보 삭제
	public int delEmployee(Map<String, Object> map);
}
