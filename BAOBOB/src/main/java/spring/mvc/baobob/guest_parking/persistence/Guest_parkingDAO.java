package spring.mvc.baobob.guest_parking.persistence;

import java.util.Map;

public interface Guest_parkingDAO {

	//주차자 입장 -1) HISTORY 내역 확인
	public String historyDateCheck(String member_id);
	
	//주차자 입장-2) HISTORY 기록
	public int historyInsert(String member_id);
	
	//주차장 입장 -3) 주차 기록
	public int parkInHistoryInsert(Map<String, Object> map);
	
	//퇴장 번호 확인
	public int parkingOutKeyCheck(String key);
}
