package spring.mvc.baobob.host_parking.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.ParkingSpace;

@Repository
public class Host_parkingDAOImpl implements Host_parkingDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int hostParkingSettingChange(ParkingSpace ps) {
		Host_parkingDAO dao = sqlSession.getMapper(Host_parkingDAO.class);
		int cnt = dao.hostParkingSettingChange(ps);
		return cnt;
	}
	
}
