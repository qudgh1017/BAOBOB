package spring.mvc.baobob.host_parking.persistence;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import spring.mvc.baobob.vo.Parking;
import spring.mvc.baobob.vo.ParkingFee;
import spring.mvc.baobob.vo.ParkingHistory;
import spring.mvc.baobob.vo.ParkingSpace;

public interface Host_parkingDAO {

	// 현재 이용자 수 
	public int getParkingMember();
	
	//평균 주차 시간
	public List<Map<String, Object>> getAvgPakingTime();

	// 오늘 영화 이용자 수 
	public int getParkingMovieMember();
	
	// 오늘 식당 이용자 수 
	public int getParkingRestaurantMember();
	
	//ajax 구역 변화
	public ArrayList<Parking> getParkChageState(Map<String, Integer> map);
	
	//주차장 구역 정보
	public ParkingSpace getParkingSpace();
	
	//주차장 구역 정보 등록
	public int parkingSpaceChange(ParkingSpace ps);
	
	//주차장 구역 정보 수정
	public int parkingSpaceUpdate(ParkingSpace ps);
	
	//주차장 해당 구역 정보
	public Parking getParking(int park_index);
	
	//주차장 각 구역 정보 등록, 수정
	public int parkingChange(Parking space);
	
	//주차장 각 구역 정보 수정
	public int parkingUpdate(Parking space);
	
	//주차장 구역 상태 정보
	public ArrayList<String> getParkingStates(int last_idx);
	
	//주차 기본 요금
	public ParkingFee getParkingFee();
	
	//주차 기본 요금 존재 여부
	public int getParkingFeeCount();
	
	//주차 기본 요금 등록, 수정
	public int parkingFeeChange(ParkingFee pf);
	
	//주차 기본 요금 수정
	public int parkingFeeUpdate(ParkingFee pf);

	//주차 차트 - 입차 시간별 이용자수
	public List<Map<String, Object>> getDayInTimeAvg();
	
	//주차 차트 - 출차 시간별 이용자수
	public List<Map<String, Object>> getDayOutTimeAvg();

	//주차 차트 - 요일별 입차 수
	public List<Map<String, Object>> getWeekIn();

	//주차 차트 - 요일별 출차 수
	public List<Map<String, Object>> getWeekOut();

	//주차 차트 - 월별 입차 수
	public List<Map<String, Object>> getMonthIn();

	//주차 차트 - 월별 출차 수
	public List<Map<String, Object>> getMonthOut();
	
	//주차 내역 총개수
	/*public int getParkingHistoryCnt();*/
	
	//주차 내역
	/*public ArrayList<ParkingHistory> getParkingHistory(Map<String, Integer> map);*/

	//납부 내역 총개수
	public int getParkingPayCnt();
	
	//납부 내역
	public ArrayList<ParkingHistory> getParkingPayList(Map<String, Object> map);
	
	//해당 주차 구역 정보
	public Parking getSpaceState(int park_index);
	
	//해당 주차 구역의 마지막 사용자
	public ArrayList<String> getParkLastDateMember(Timestamp park_last_date);
	
	//성비율
	public List<Map<String, Object>> getParkingSexRatio();
	
	//올해 납부 내역
	public ArrayList<ParkingHistory> getThisYearPayList();
	
	//총 수익
	public String getTotalPrice(Map<String, Integer> map);
	
	//아두이노. 주차 구역 상태 수정
	public int arduinoInput(Map<String, Object> map);
}
