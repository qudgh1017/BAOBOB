package spring.mvc.baobob.host_parking.persistence;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.Parking;
import spring.mvc.baobob.vo.ParkingFee;
import spring.mvc.baobob.vo.ParkingHistory;
import spring.mvc.baobob.vo.ParkingSpace;

@Repository
public class Host_parkingDAOImpl implements Host_parkingDAO {

	@Autowired
	SqlSession sqlSession;

	// 현재 이용자 수 
	public int getParkingMember() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		int cnt = mapper.getParkingMember();
		return cnt;
	}

	//평균 주차 시간
	public List<Map<String, Object>> getAvgPakingTime(){
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		List<Map<String, Object>> list = mapper.getAvgPakingTime();
		return list;
	}

	// 오늘 영화 이용자 수 
	public int getParkingMovieMember() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		int cnt = mapper.getParkingMovieMember();
		return cnt;
	}
	
	// 오늘 식당 이용자 수 
	public int getParkingRestaurantMember() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		int cnt = mapper.getParkingMovieMember();
		return cnt;
	}

	//ajax 구역 변화
	public ArrayList<Parking> getParkChageState() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		ArrayList<Parking> ps = mapper.getParkChageState();
		return ps;
	}
	
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

	//주차 차트 - 입차 시간별 이용자수
	public List<Map<String, Object>> getDayInTimeAvg() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		List<Map<String, Object>> list = mapper.getDayInTimeAvg();
		return list;
	}
	
	//주차 차트 - 출차 시간별 이용자수
	public List<Map<String, Object>> getDayOutTimeAvg() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		List<Map<String, Object>> list = mapper.getDayOutTimeAvg();
		return list;
	}

	//주차 차트 - 요일별 입차 수
	public List<Map<String, Object>> getWeekIn(){
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		List<Map<String, Object>> list = mapper.getWeekIn();
		return list;
	}

	//주차 차트 - 요일별 출차 수
	public List<Map<String, Object>> getWeekOut() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		List<Map<String, Object>> list = mapper.getWeekOut();
		return list;
	}
	

	//주차 차트 - 월별 입차 수
	public List<Map<String, Object>> getMonthIn(){
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		List<Map<String, Object>> list = mapper.getMonthIn();
		return list;
	}

	//주차 차트 - 월별 출차 수
	public List<Map<String, Object>> getMonthOut(){
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		List<Map<String, Object>> list = mapper.getMonthIn();
		return list;
	}
	
	//주차 내역 총개수
	/*@Override
	public int getParkingHistoryCnt() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		int cnt = mapper.getParkingHistoryCnt();;
		return cnt;
	}*/

	//주차 내역
	/*@Override
	public ArrayList<ParkingHistory> getParkingHistory(Map<String, Integer> map) {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		ArrayList<ParkingHistory> list = mapper.getParkingHistory(map);
		return list;
	}*/

	//납부 내역 총개수
	public int getParkingPayCnt() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		return mapper.getParkingPayCnt();
	}
	
	//납부 내역
	@Override
	public ArrayList<ParkingHistory> getParkingPayList(Map<String, Object> map) {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		ArrayList<ParkingHistory> list = mapper.getParkingPayList(map);
		return list;
	}

	//해당 주차 구역 정보
	@Override
	public Parking getSpaceState(int park_index) {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		Parking space = mapper.getSpaceState(park_index);
		return space;
	}

	//해당 주차 구역의 마지막 사용자
	public ArrayList<String> getParkLastDateMember(Timestamp park_last_date) {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		ArrayList<String> lasts = mapper.getParkLastDateMember(park_last_date);
		return lasts;
	}

	//올해 납부 내역
	public ArrayList<ParkingHistory> getThisYearPayList() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		ArrayList<ParkingHistory> list = mapper.getThisYearPayList();
		return list;
	}

	//성비율
	@Override
	public List<Map<String, Object>> getParkingSexRatio() {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		List<Map<String, Object>> list = mapper.getParkingSexRatio(); 
		return list;
	}
	

	//아두이노. 주차 구역 상태 수정
	@Override
	public int arduinoInput(Map<String, Object> map) {
		Host_parkingDAO mapper = sqlSession.getMapper(Host_parkingDAO.class);
		int cnt = mapper.arduinoInput(map);
		return cnt;
	}
}
