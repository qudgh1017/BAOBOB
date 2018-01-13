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

@Repository
public class Host_restaurantDAOImpl implements Host_restaurantDAO {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private SqlSession sqlSession;

	// 식당 총 관리자 - 식당 추가 처리
	@Override
	public int addRestaurant(Map<String, Object> map) {
		// TODO Auto-generated method stub
		log.debug("dao.addRestaurant()");
		
		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);
		
		return dao.addRestaurant(map);
	}

	// 식당 총 관리자 - 식당 내 테이블 추가 처리
	@Override
	public int addTable(Map<String, Object> map) {
		// TODO Auto-generated method stub
		log.debug("dao.addTable()");
		
		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);
		
		return dao.addTable(map);
	}
	
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

	// 식당[1] 메뉴 정보 상세보기
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

	// 식당[1] 직원으로 등록할 회원 정보 보기
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
}
