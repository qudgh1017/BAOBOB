package spring.mvc.baobob.host_restaurant.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.EmployeeVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MenuVO;
import spring.mvc.baobob.vo.RestaurantVO;
import spring.mvc.baobob.vo.Restaurant_ChartVO;
import spring.mvc.baobob.vo.Restaurant_scheduleVO;
import spring.mvc.baobob.vo.TableVO;

@Repository
public class Host_restaurantDAOImpl implements Host_restaurantDAO {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private SqlSession sqlSession;

	// 매장 수 조회
	@Override
	public int getRestaurantCnt() {
		log.debug("dao.getRestaurantCnt()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getRestaurantCnt();
	}

	// 모든 매장 정보
	@Override
	public ArrayList<RestaurantVO> getRestaurantList() {
		log.debug("dao.getRestaurantList()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getRestaurantList();
	}

	// 매장 추가 처리
	@Override
	public int addRestaurant(RestaurantVO dto) {
		log.debug("dao.addRestaurant()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addRestaurant(dto);
	}

	// 매장 내 테이블 추가 처리
	@Override
	public int addTable(TableVO dto) {
		log.debug("dao.addTable()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addTable(dto);
	}

	// 매장 정보 조회
	@Override
	public RestaurantVO viewRestaurant(int restaurant_index) {
		log.debug("dao.viewRestaurant()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.viewRestaurant(restaurant_index);
	}

	// 매장을 구성하는 타일의 행열 조회 (예:5*5)
	@Override
	public TableVO getColRow(int restaurant_index) {
		log.debug("dao.getRowCol()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getColRow(restaurant_index);
	}

	// 타일 하나하나의 상태 조회
	@Override
	public int getState(Map<String, Object> map) {

		log.debug("dao.getState()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getState(map);
	}

	// 매장 수정 처리
	@Override
	public int modRestaurant(RestaurantVO dto) {

		log.debug("dao.modRestaurant()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.modRestaurant(dto);
	}

	// 매장 내 테이블 정보 초기화
	@Override
	public int resetTable(RestaurantVO dto) {

		log.debug("dao.resetTable()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.resetTable(dto);
	}

	// 매장 내 테이블 수정 처리
	@Override
	public int modTable(Map<String, Object> map) {
		log.debug("dao.modTable()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.modTable(map);
	}

	// 매장 삭제 처리
	@Override
	public int delRestaurant(RestaurantVO dto) {
		log.debug("dao.delRestaurant()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.delRestaurant(dto);
	}

	/////////////////////////////////////////////////////////////////////////////////////////

	// 메뉴 개수 조회
	@Override
	public int getMenuCnt(int restaurant_index) {
		log.debug("dao.getMenuCnt()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getMenuCnt(restaurant_index);
	}

	// 각 메뉴 정보 조회
	@Override
	public ArrayList<MenuVO> getMenuList(int restaurant_index) {
		log.debug("dao.getMenuList()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getMenuList(restaurant_index);
	}

	// 메뉴 추가 전 메뉴 인덱스 계산
	@Override
	public Integer getMenuIndex(int restaurant_index) {
		log.debug("dao.getMenuIndex()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		Integer restaurant_menu_index = dao.getMenuIndex(restaurant_index);
		
		if(restaurant_menu_index == null) {
			restaurant_menu_index = 1;
		} else {
			restaurant_menu_index++;
		}
				
		return restaurant_menu_index;
	}

	// 메뉴 추가 처리
	@Override
	public int addMenu(MenuVO dto) {
		log.debug("dao.addMenu()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addMenu(dto);
	}

	// 메뉴 수정 처리
	@Override
	public int modMenu(MenuVO dto) {
		log.debug("dao.modMenu()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.modMenu(dto);
	}

	// 메뉴 정보 상세조회
	@Override
	public MenuVO viewMenu(MenuVO dto) {
		log.debug("dao.viewMenu()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.viewMenu(dto);
	}

	// 메뉴 삭제 처리
	@Override
	public int delMenu(MenuVO dto) {

		log.debug("dao.delMenu()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.delMenu(dto);
	}

	// 직원 수 조회
	@Override
	public int getEmployeeCnt(int member_step) {

		log.debug("dao.getEmployeeCnt()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getEmployeeCnt(member_step);
	}

	// 각 직원 정보 조회
	@Override
	public ArrayList<EmployeeVO> getEmployeeList(int member_step) {
		log.debug("dao.getEmployeeList()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getEmployeeList(member_step);
	}

	// 전체 회원 수 조회(직원 제외)
	@Override
	public int getMemberCnt() {

		log.debug("dao.getMemberCnt()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getMemberCnt();
	}

	// 각 회원 정보 조회(직원 제외)
	@Override
	public ArrayList<Member> getMemberList() {

		log.debug("dao.getEmployeeList()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getMemberList();
	}

	// 직원으로 등록할 회원 정보 조회
	@Override
	public Member viewMember(String id) {
		log.debug("dao.viewMember()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.viewMember(id);
	}

	// 직원 등록/삭제 처리(member_step 변경)
	@Override
	public int updateStep(Map<String, Object> map) {

		log.debug("dao.updateStep()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.updateStep(map);
	}

	// 직원 등록 처리
	@Override
	public int addEmployee(Map<String, Object> map) {

		log.debug("dao.addEmployee()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addEmployee(map);
	}

	// 직원 정보 조회
	@Override
	public EmployeeVO viewEmployee(String id) {
		log.debug("dao.viewMember()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.viewEmployee(id);
	}

	// 직원 정보 삭제 처리(member_step 계산)
	@Override
	public int getCumPoint(String id) {

		log.debug("dao.getCumPoint()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getCumPoint(id);
	}

	// 직원 정보 삭제
	@Override
	public int delEmployee(Map<String, Object> map) {

		log.debug("dao.delEmployee()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.delEmployee(map);
	}

	// 예약 추가
	@Override
	public int addReserv(Map<String, Object> map) {
		log.debug("dao.addReserv()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addReserv(map);
	}

	// 예약 전 초기화(예약 위에 또 예약하는 경우)
	@Override
	public int resetTable2(Restaurant_scheduleVO dto) {

		log.debug("dao.resetTable2()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.resetTable2(dto);
	}

	// 선택 날짜 예약 조회
	@Override
	public int modTable2(Map<String, Object> map) {

		log.debug("dao.modTable2()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.modTable2(map);
	}

	// 날짜별 예약 조회
	@Override
	public ArrayList<Restaurant_scheduleVO> getReservList(Map<String, Object> map) {
		log.debug("dao.getReservList()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getReservList(map);
	}

	// 스케줄 인덱스 조회
	@Override
	public Integer getScheduleIndex(Restaurant_scheduleVO dto) {

		log.debug("dao.getScheduleIndex()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getScheduleIndex(dto);
	}

	// 식당 개수, 식당 인덱스 체크
	@Override
	public int[] getRestaurantIndex() {

		log.debug("dao.getRestaurantIndex()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getRestaurantIndex();
	}

	// 시작 시간, 종료 시간 체크
	@Override
	public Restaurant_scheduleVO getTime(Restaurant_scheduleVO dto) {
		log.debug("dao.getTime()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getTime(dto);
	}

	// 주문 추가 처리
	@Override
	public int addFoodHistory(Map<String, Object> map) {
		log.debug("dao.addFoodHistory()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addFoodHistory(map);
	}

	// 회원 아이디가 있는지, 있다면 스텝이 몇인지 조회
	@Override
	public Integer confirmId(String id) {
		log.debug("dao.confirmId()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.confirmId(id);
	}

	// 이용 내역 추가 처리
	@Override
	public int addHistory(String id) {
		log.debug("dao.addHistory()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addHistory(id);
	}

	// 이미 주문한 메뉴인지 확인
	@Override
	public Integer getMenuCount(Map<String, Object> map) {
		log.debug("dao.getMenuCount()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getMenuCount(map);
	}

	// 주문한 메뉴인 경우 수량 누적
	@Override
	public Integer modFoodHistory(Map<String, Object> map) {
		log.debug("dao.modFoodHistory()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.modFoodHistory(map);
	}

	// 주문 취소 처리
	@Override
	public Integer delFoodHistory(Map<String, Object> map) {
		log.debug("dao.delFoodHistory()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.delFoodHistory(map);
	}

	// 주문 가격 계산(테이블별 결산)
	@Override
	public Integer getBill(Map<String, Object> map) {
		log.debug("dao.getBill()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getBill(map);
	}

	// '사용중'인 테이블 '사용가능'으로 상태 변경
	@Override
	public int modState(Map<String, Object> map) {
		log.debug("dao.modState()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.modState(map);
	}

	// 레스토랑 히스토리 테이블에 이용 내역 추가
	@Override
	public int addRestaurantHistory(Map<String, Object> map) {
		log.debug("dao.addRestaurantHistory()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addRestaurantHistory(map);
	}

	// 회원 포인트 조회
	@Override
	public int getPoint(String id) {
		log.debug("dao.getPoint()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getPoint(id);
	}

	// 회원 포인트 수정
	@Override
	public int modMemberPoint(Map<String, Object> map) {
		log.debug("dao.modMemberPoint()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.modMemberPoint(map);
	}

	// 모든 메뉴 이름 조회
	@Override
	public String[] getMenuName(int restaurant_index) {
		log.debug("dao.getMenuName()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getMenuName(restaurant_index);
	}

	// 결산 차트
	@Override
	public List<Restaurant_ChartVO> getMenuCountChart(int restaurant_index) {
		log.debug("dao.getMenuCountChart()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getMenuCountChart(restaurant_index);
	}

	// 성별 매출
	@Override
	public Object getSexChart(int restaurant_index) {
		log.debug("dao.getSexChart()");
		
		Map<String, Integer> m = null;

		m = new HashMap<String, Integer>();
		m.put("total", 0);
		m.put("남", 0);
		m.put("여", 0);

		List<Member> list = new ArrayList();
		
		for (int i = 0; i < m.size(); i++) {
			list = getSexChartContent(restaurant_index);
			String str = String.valueOf(list.get(i));
			
			System.out.println("str : " + str);
			
			String str2[] = str.split(",");
			String str3[] = str2[0].split("=");
			String str4[] = str2[1].split("=");
			String str5[] = str4[1].split("}");

			m.put(str3[1], Integer.parseInt(str5[0]));
		}

		return m;
	}
	
	// 성별 차트 내용
	@Override
	public List<Member> getSexChartContent(int restaurant_index) {
		log.debug("dao.getSexChartContent()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getSexChartContent(restaurant_index);
	}

}
