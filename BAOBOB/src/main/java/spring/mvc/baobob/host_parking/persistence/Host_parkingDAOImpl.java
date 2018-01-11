package spring.mvc.baobob.host_parking.persistence;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.Parking;
import spring.mvc.baobob.vo.ParkingFee;
import spring.mvc.baobob.vo.ParkingSpace;

@Repository
public class Host_parkingDAOImpl implements Host_parkingDAO {

	@Autowired
	SqlSession sqlSession;

	//주차장 구역 정보, 존재 여부
	@Override
	public ParkingSpace getParkingSpace() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		ParkingSpace ps = mapper.getParkingSpace();
		return ps;
	}

	//주차장 구역 정보 등록
	@Override
	public int parkingSpaceChange(ParkingSpace ps) {
		ParkingSpace tmp = getParkingSpace();
		
		int cnt = 0;
		if(tmp != null) {
			cnt = parkingSpaceUpdate(ps);
		} else {
			Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
			cnt = mapper.parkingSpaceChange(ps);
		}
		return cnt;
	}

	//주차장 구역 정보 수정
	@Override
	public int parkingSpaceUpdate(ParkingSpace ps) {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		int cnt = mapper.parkingSpaceUpdate(ps);
		return cnt;
	}

	//주차장 해당 구역 정보
	public Parking getParking(int park_index) {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		Parking p = mapper.getParking(park_index);
		return p;
	}
	
	//주차장 각 구역 정보 등록
	@Override
	public int parkingChange(Parking space) {
		//해당 구역 정보 존재 여부
		Parking p = getParking(space.getPark_index());

		int cnt = 0;
		if(p != null) {
			space.setPark_last_date(p.getPark_last_date());
			parkingUpdate(space);
			cnt = 1;
		} else {
			Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
			cnt = mapper.parkingChange(space);
		}
		return cnt;
	}
	
	//주차장 각 구역 정보 수정
	@Override
	public int parkingUpdate(Parking space) {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		int cnt = mapper.parkingUpdate(space);
		return cnt;
	}

	//주차장 구역 상태 정보
	@Override
	public ArrayList<String> getParkingStates(int last_idx) {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		ArrayList<String> list = mapper.getParkingStates(last_idx);
		return list;
	}

	//주차 기본 요금 설정 확인
	@Override
	public ParkingFee getParkingFee() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		ParkingFee pf =  mapper.getParkingFee();
		return pf;
	}
	
	//주차 기본 요금 존재 여부
	@Override
	public int getParkingFeeCount() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		int cnt = mapper.getParkingFeeCount();
		return cnt;
	}

	//주차 기본 요금 등록
	@Override
	public int parkingFeeChange(ParkingFee pf) {
		int count = getParkingFeeCount();
		
		int cnt = 0;
		if(count == 0) {
			Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
			cnt = mapper.parkingFeeChange(pf);
		} else {
			parkingFeeUpdate(pf);
			cnt = 1;
		}
		return cnt;
	}

	//주차 기본 요금 수정
	@Override
	public int parkingFeeUpdate(ParkingFee pf) {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		int cnt = mapper.parkingFeeUpdate(pf);
		return cnt;
	}
	
}
