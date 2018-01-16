package spring.mvc.baobob.host_restaurant.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.EmployeeVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MenuVO;
import spring.mvc.baobob.vo.RestaurantVO;
import spring.mvc.baobob.vo.Restaurant_scheduleVO;
import spring.mvc.baobob.vo.TableVO;

@Repository
public class Host_restaurantDAOImpl implements Host_restaurantDAO {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private SqlSession sqlSession;

	// 식당 총 관리자 - 매장 수
	@Override
	public int getRestaurantCnt() {
		// TODO Auto-generated method stub
		log.debug("dao.getRestaurantCnt()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getRestaurantCnt();
	}

	// 식당 총 관리자 - 각 매장 정보
	@Override
	public ArrayList<RestaurantVO> getRestaurantList() {
		// TODO Auto-generated method stub
		log.debug("dao.getRestaurantList()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getRestaurantList();
	}

	// 식당 총 관리자 - 매장 추가 처리
	@Override
	public int addRestaurant(RestaurantVO dto) {
		// TODO Auto-generated method stub
		log.debug("dao.addRestaurant()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addRestaurant(dto);
	}

	// 식당 총 관리자 - 매장 내 테이블 추가 처리
	@Override
	public int addTable(TableVO dto) {
		// TODO Auto-generated method stub
		log.debug("dao.addTable()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addTable(dto);
	}

	// 식당 총 관리자 - 수정할 매장 정보 조회 / 수정할 정보 입력
	@Override
	public RestaurantVO viewRestaurant(String index) {
		// TODO Auto-generated method stub
		log.debug("dao.viewRestaurant()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.viewRestaurant(index);
	}

	// 식당 총 관리자 - 매장 내 테이블 정보 조회를 위한 좌석 수 조회
	@Override
	public TableVO getColRow(String index) {
		// TODO Auto-generated method stub
		log.debug("dao.getRowCol()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getColRow(index);
	}

	// 식당 총 관리자 - 매장 내 테이블 정보 조회를 위한 테이블 상태 조회
	@Override
	public String getState(Map<String, Object> map) {
		// TODO Auto-generated method stub
		log.debug("dao.getState()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getState(map);
	}

	// 식당 총 관리자 - 매장 수정 처리
	@Override
	public int modRestaurant(RestaurantVO dto) {
		// TODO Auto-generated method stub
		log.debug("dao.modRestaurant()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.modRestaurant(dto);
	}

	// 식당 총 관리자 - 매장 내 테이블 수정 처리 전 테이블 초기화
	@Override
	public int resetTable(RestaurantVO dto) {
		// TODO Auto-generated method stub
		log.debug("dao.resetTable()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.resetTable(dto);
	}
	
	// 식당 총 관리자 - 매장 내 테이블 수정 처리
	@Override
	public int modTable(Map<String, Object> map) {
		// TODO Auto-generated method stub
		log.debug("dao.modTable()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.modTable(map);
	}

	// 식당 총 관리자 - 매장 삭제 처리
	@Override
	public int delRestaurant(RestaurantVO dto) {
		// TODO Auto-generated method stub
		log.debug("dao.delRestaurant()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.delRestaurant(dto);
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////

	// 식당[1] 메뉴 개수 조회
	@Override
	public int getMenuCnt() {
		// TODO Auto-generated method stub
		log.debug("dao.getMenuCnt()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getMenuCnt();
	}

	// 식당[1] 각 메뉴 정보 조회
	@Override
	public ArrayList<MenuVO> getMenuList() {
		// TODO Auto-generated method stub
		log.debug("dao.getMenuList()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getMenuList();
	}

	// 식당[1] 메뉴 추가 처리
	@Override
	public int addMenu(MenuVO dto) {
		// TODO Auto-generated method stub
		log.debug("dao.addMenu()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addMenu(dto);
	}

	// 식당[1] 메뉴 수정 처리
	@Override
	public int modMenu(MenuVO dto) {
		// TODO Auto-generated method stub
		log.debug("dao.modMenu()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.modMenu(dto);
	}

	// 식당[1] 메뉴 정보 상세조회
	@Override
	public MenuVO viewMenu(int index) {
		// TODO Auto-generated method stub
		log.debug("dao.viewMenu()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.viewMenu(index);
	}

	// 식당[1] 메뉴 삭제 처리
	@Override
	public int delMenu(MenuVO dto) {
		// TODO Auto-generated method stub
		log.debug("dao.delMenu()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.delMenu(dto);
	}

	// 식당[1] 직원 수 조회
	@Override
	public int getEmployeeCnt() {
		// TODO Auto-generated method stub
		log.debug("dao.getEmployeeCnt()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getEmployeeCnt();
	}

	// 식당[1] 각 직원 정보 조회
	@Override
	public ArrayList<EmployeeVO> getEmployeeList() {
		// TODO Auto-generated method stub
		log.debug("dao.getEmployeeList()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getEmployeeList();
	}

	// 전체 회원 수 조회(식당[1] 직원 제외)
	@Override
	public int getMemberCnt() {
		// TODO Auto-generated method stub
		log.debug("dao.getMemberCnt()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getMemberCnt();
	}

	// 각 회원 정보 조회(식당[1] 직원 제외)
	@Override
	public ArrayList<Member> getMemberList() {
		// TODO Auto-generated method stub
		log.debug("dao.getEmployeeList()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getMemberList();
	}

	// 식당[1] 직원으로 등록할 회원 정보 조회
	@Override
	public Member viewMember(String id) {
		// TODO Auto-generated method stub
		log.debug("dao.viewMember()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.viewMember(id);
	}

	// 식당[1] 직원 등록 처리(member_step 변경)
	@Override
	public int updateStep(Map<String, Object> map) {
		// TODO Auto-generated method stub
		log.debug("dao.updateStep()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.updateStep(map);
	}

	// 식당[1] 직원 등록 처리
	@Override
	public int addEmployee(Map<String, Object> map) {
		// TODO Auto-generated method stub
		log.debug("dao.addEmployee()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addEmployee(map);
	}

	// 식당[1] 직원 정보 조회
	@Override
	public EmployeeVO viewEmployee(String id) {
		// TODO Auto-generated method stub
		log.debug("dao.viewMember()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.viewEmployee(id);
	}

	// 식당[1] 직원 정보 삭제 처리(member_step 계산)
	@Override
	public int getCumPoint(String id) {
		// TODO Auto-generated method stub
		log.debug("dao.getCumPoint()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getCumPoint(id);
	}

	// 식당[1] 직원 정보 삭제
	@Override
	public int delEmployee(Map<String, Object> map) {
		// TODO Auto-generated method stub
		log.debug("dao.delEmployee()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.delEmployee(map);
	}

	// 식당[1] 예약 추가
	@Override
	public int addReserv(Map<String, Object> map) {
		// TODO Auto-generated method stub
		log.debug("dao.addReserv()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.addReserv(map);
	}

	// 식당[1] 날짜별 예약 조회
	@Override
	public ArrayList<Restaurant_scheduleVO> getReservList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		log.debug("dao.getReservList()");

		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);

		return dao.getReservList(map);
	}
}
