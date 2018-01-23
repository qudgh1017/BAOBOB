package spring.mvc.baobob.host_restaurant.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.EmployeeVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MenuVO;
import spring.mvc.baobob.vo.RestaurantVO;
import spring.mvc.baobob.vo.Restaurant_scheduleVO;
import spring.mvc.baobob.vo.TableVO;

public interface Host_restaurantDAO {

	// 매장 수 조회
	public int getRestaurantCnt();
	
	// 모든 매장 정보
	public ArrayList<RestaurantVO> getRestaurantList();

	// 매장 추가 처리
	public int addRestaurant(RestaurantVO dto);

	// 매장내 테이블 추가 처리
	public int addTable(TableVO dto);

	// 매장 정보 조회
	public RestaurantVO viewRestaurant(int restaurant_index);

	// 매장을 구성하는 타일의 행열 조회 (예:5*5)
	public TableVO getColRow(int restaurant_index);

	// 타일 하나하나의 상태 조회
	public int getState(Map<String, Object> map);
	
	// 매장 수정 처리
	public int modRestaurant(RestaurantVO dto);

	// 매장 내 테이블 정보 초기화
	public int resetTable(RestaurantVO dto);
	
	// 매장 내 테이블 수정 처리
	public int modTable(Map<String, Object> map);

	// 매장 삭제 처리
	public int delRestaurant(RestaurantVO dto);
	
	/////////////////////////////////////////////////////////////////////////////////////////
	
	// 식당별 메뉴 개수
	public int getMenuCnt(int restaurant_index); 

	// 각 메뉴 정보
	public ArrayList<MenuVO> getMenuList(int restaurant_index);
	
	// 메뉴 추가 처리
	public int addMenu(MenuVO dto);
	
	// 메뉴 정보
	public MenuVO viewMenu(MenuVO dto);
	
	// 메뉴 정보 수정 처리
	public int modMenu(MenuVO dto);

	// 메뉴 삭제 처리
	public int delMenu(MenuVO dto);

	// 식당별 직원 수
	public int getEmployeeCnt(int member_step);

	// 각 직원 정보
	public ArrayList<EmployeeVO> getEmployeeList(int member_step);

	// 전체 회원 수(타 식당, 타 부서 직원 제외)
	public int getMemberCnt();

	// 각 회원 정보
	public ArrayList<Member> getMemberList();

	// 직원으로 등록할 회원 정보 상세 조회
	public Member viewMember(String id);

	// 직원 등록
	public int addEmployee(Map<String, Object> map);

	// 직원 등록/삭제 처리(member_step 변경)
	public int updateStep(Map<String, Object> map);

	// 직원 정보 조회
	public EmployeeVO viewEmployee(String id);

	// step 계산을 위한 누적 포인트 조회
	public int getCumPoint(String id);

	// 직원 삭제 처리
	public int delEmployee(Map<String, Object> map);

	// 예약 추가
	public int addReserv(Map<String, Object> map);

	// 테이블 초기화(예약 위에 또 예약하는 경우)
	public int resetTable2(Restaurant_scheduleVO dto);

	// 선택 날짜 예약 조회
	public int modTable2(Map<String, Object> map);
	
	// 날짜별 예약 조회
	public ArrayList<Restaurant_scheduleVO> getReservList(Map<String, Object> map);

	// 스케줄 인덱스 조회
	public Integer getScheduleIndex(Restaurant_scheduleVO dto);

	// 식당 개수, 식당 인덱스 체크
	public int[] getRestaurantIndex();

	// 시작 시간, 종료 시간 체크
	public Restaurant_scheduleVO getTime(Restaurant_scheduleVO dto);

	// 주문 추가 처리
	public int addFoodHistory(Map<String, Object> map);

	// 식당별 결산
	public Integer getAccount(int restaurant_index);

	// 회원 아이디가 있는지, 있다면 스텝이 몇인지 조회
	public Integer confirmId(String id);

	// 이용 내역 추가 처리
	public int addHistory(String id);

	// 이미 주문한 메뉴인지 확인
	public Integer getMenuCount(Map<String, Object> map);

	// 주문한 메뉴인 경우 수량 누적
	public Integer modFoodHistory(Map<String, Object> map);

	// 주문 취소 처리
	public Integer delFoodHistory(Map<String, Object> map);

	// 주문 가격 계산(테이블별 결산)
	public Integer getBill(Map<String, Object> map);

	// '사용중'인 테이블 '사용가능'으로 상태 변경
	public int modState(Map<String, Object> map);

	// 레스토랑 히스토리 테이블에 이용 내역 추가
	public int addRestaurantHistory(Map<String, Object> map);

	// 포인트 조회
	public int getPoint(String id);

	// 회원 포인트 수정
	public int modMemberPoint(Map<String, Object> map);
}
