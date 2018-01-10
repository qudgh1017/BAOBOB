package spring.mvc.baobob.host_restaurant.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.MenuVO;

@Repository
public class Host_restaurantDAOImpl implements Host_restaurantDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 식당[1] 메뉴 추가
	@Override
	public int addMenu(MenuVO dto) {
		// TODO Auto-generated method stub
		System.out.println("dao.addMenu()");
		
		Host_restaurantDAO dao = sqlSession.getMapper(Host_restaurantDAO.class);
		
		return dao.addMenu(dto);
	}
}
