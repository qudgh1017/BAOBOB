package spring.mvc.baobob.guest_parking.persistence;

import java.sql.Timestamp;
import java.util.Map;

import spring.mvc.baobob.vo.ParkingHistory;

public interface Guest_parkingDAO {

	//주차자 입장 -1) HISTORY 내역 확인
	public String historyDateCheck(String member_id);
	
	//주차자 입장-2) HISTORY 기록
	public int historyInsert(String member_id);
	
	//주차장 입장 -3) 주차 기록
	public int parkInHistoryInsert(Map<String, Object> map);
	
	//퇴장 번호 확인
	public int parkingOutKeyCheck(String key);
	
	//퇴장 - 카드 등록된 회원 구분
	public int parkingOutMemberCheck(String key);
	
	//입차 시간
	public Timestamp getParkingInTime(String key);
	
	//영화 건수
	public int getMovieHistoryCount(String key);
	
	//식당 건수
	public int getRestaurantHistoryCount(String key);
	
	//퇴장
	public int parkingHistoryUpdate(Map<String, Object> map);
	
	//해당 주차 정보
	public ParkingHistory getParkingHistory(String key);
}
