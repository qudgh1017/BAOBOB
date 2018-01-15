package spring.mvc.baobob.guest_parking.persistence;

import java.sql.Timestamp;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.ParkingHistory;

@Repository
public class Guest_parkingDAOImpl implements Guest_parkingDAO {

	@Autowired
	SqlSession sqlSession;

	//주차자 입장 -1) HISTORY 내역 확인
	@Override
	public String historyDateCheck(String member_id) {
		Guest_parkingDAO mapper = sqlSession.getMapper(Guest_parkingDAO.class);
		String chk = mapper.historyDateCheck(member_id);
		return chk;
	}

	//주차자 입장-2) HISTORY 기록
	@Override
	public int historyInsert(String member_id) {
		Guest_parkingDAO mapper = sqlSession.getMapper(Guest_parkingDAO.class);
		int cnt = mapper.historyInsert(member_id);
		return cnt;
	}
	
	//주차장 입장 -3) 주차 기록
	public int parkInHistoryInsert(Map<String, Object> map) {
		Guest_parkingDAO mapper = sqlSession.getMapper(Guest_parkingDAO.class);
		int cnt = mapper.parkInHistoryInsert(map);
		return cnt;
	}

	//퇴장 번호 확인
	@Override
	public int parkingOutKeyCheck(String key) {
		Guest_parkingDAO mapper = sqlSession.getMapper(Guest_parkingDAO.class);
		int cnt = mapper.parkingOutKeyCheck(key);
		return cnt;
	}

	//퇴장 - 카드 등록된 회원 구분
	@Override
	public int parkingOutMemberCheck(String key) {
		Guest_parkingDAO mapper = sqlSession.getMapper(Guest_parkingDAO.class);
		int cnt = mapper.parkingOutMemberCheck(key);
		return cnt;
	}
	
	//입차 시간
	@Override
	public Timestamp getParkingInTime(String key) {
		Guest_parkingDAO mapper = sqlSession.getMapper(Guest_parkingDAO.class);
		Timestamp time = mapper.getParkingInTime(key);
		return time;
	}

	//영화 건수
	public int getMovieHistoryCount(String key) {
		Guest_parkingDAO mapper = sqlSession.getMapper(Guest_parkingDAO.class);
		int cnt = mapper.getMovieHistoryCount(key);
		return cnt;
	}
	
	//식당 건수
	public int getRestaurantHistoryCount(String key) {
		Guest_parkingDAO mapper = sqlSession.getMapper(Guest_parkingDAO.class);
		int cnt = mapper.getMovieHistoryCount(key);
		return cnt;
	}
	
	//퇴장
	@Override
	public int parkingHistoryUpdate(Map<String, Object> map) {
		Guest_parkingDAO mapper = sqlSession.getMapper(Guest_parkingDAO.class);
		int cnt = mapper.parkingHistoryUpdate(map);
		return cnt;
	}

	//해당 주차 정보
	@Override
	public ParkingHistory getParkingHistory(String key) {
		Guest_parkingDAO mapper = sqlSession.getMapper(Guest_parkingDAO.class);
		ParkingHistory ph = mapper.getParkingHistory(key);
		return ph;
	}

}
