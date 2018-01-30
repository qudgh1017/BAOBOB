package spring.mvc.baobob.android.persistence;

import java.util.ArrayList;

import spring.mvc.baobob.vo.Android;
import spring.mvc.baobob.vo.BoardVO;
import spring.mvc.baobob.vo.Member;

public interface AndroidDAO {

	//영화 이용 건수
	public int getUseMovieCnt(String id);
	
	//식당 이용 건수
	public int getUseRestaurantCnt(String id);
	
	//주차장 이용 건수
	public int getUseParkingCnt(String id);
	
	//최근 10일간의 문의 내역
	public ArrayList<BoardVO> getBoardList(String id);
	
	//영화 예매 내역
	public ArrayList<Android> getMemberMovieTicketing(String id);
	
	//주차 이용 내역
	public ArrayList<Android> getMemberParking(String id);
	
	//회원 정보 수정
	public int anMemberUpdate(Member m);
}
