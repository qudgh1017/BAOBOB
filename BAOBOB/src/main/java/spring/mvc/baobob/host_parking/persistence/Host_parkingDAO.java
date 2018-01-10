package spring.mvc.baobob.host_parking.persistence;

import spring.mvc.baobob.vo.ParkingSpace;

public interface Host_parkingDAO {

	//주차장 구역 정보
	public ParkingSpace getParkingSpace();
	
	//주차장 구역 정보 등록
	public int parkingSpaceChange(ParkingSpace ps);
	
	//주차장 구역 정보 수정
	public int parkingSpaceUpdate(ParkingSpace ps);
}
