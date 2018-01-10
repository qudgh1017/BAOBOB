package spring.mvc.baobob.host_parking.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.ParkingSpace;

@Repository
public class Host_parkingDAOImpl implements Host_parkingDAO {

	@Autowired
	SqlSession sqlSession;

	//주차장 구역 정보, 존재 여부
	@Override
	public ParkingSpace getParkingSpace() {
		Host_parkingDAO dao = sqlSession.getMapper(Host_parkingDAO.class);
		ParkingSpace ps = dao.getParkingSpace();
		return ps;
	}

	//주차장 구역 정보 등록
	@Override
	public int parkingSpaceChange(ParkingSpace ps) {
		Host_parkingDAO dao = sqlSession.getMapper(Host_parkingDAO.class);
		
		ParkingSpace tmp = getParkingSpace();
		
		int cnt = 0;
		if(tmp != null) {
			cnt = parkingSpaceUpdate(ps);
		} else {
			cnt = dao.parkingSpaceChange(ps);
		}
		return cnt;
	}

	//주차장 구역 정보 수정
	@Override
	public int parkingSpaceUpdate(ParkingSpace ps) {
		Host_parkingDAO dao = sqlSession.getMapper(Host_parkingDAO.class);
		int cnt = dao.parkingSpaceUpdate(ps);
		return cnt;
	}
	
}
