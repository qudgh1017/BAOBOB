package spring.mvc.baobob.guest_restaurant.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.MenuVO;
import spring.mvc.baobob.vo.RestaurantVO;
import spring.mvc.baobob.vo.ReviewVO;
import spring.mvc.baobob.vo.TableVO;

public interface Guest_restaurantDAO {

	//==========================================================================
	//============================== 2. 레스토랑-메뉴 ==============================
	//==========================================================================
	//2-1.레스토랑 메뉴 갯수
	public int getArticleCnt_menu(int restaurant_index);
	//2-1.레스토랑 메뉴 정보
	public ArrayList<MenuVO> getArticle_menu(int restaurant_index);
	//==========================================================================
	//============================== 3. 레스토랑 예약 ==============================
	//==========================================================================
	//3.특정 매장 정보 조회
	public RestaurantVO reserv_tableList(int index);
	//3.매장 내 테이블 정보 조회를 위한 좌석 수 조회
	public TableVO getColRow(int index);
	//매장 내 테이블 정보 조회를 위한 테이블 상태 조회
	public String getState(Map<String, Object> map);
	//예약 추가
	public int addReserv(Map<String, Object> map);
	//선택 날짜 예약 조회
	public int modTable2(Map<String, Object> map);
	//예약 내역 추가
	public int AddHistory(Map<String, Object> map);
	//레스토랑 예약 내역 추가 
	public int AddRHistory(Map<String, Object> map);
	//==========================================================================
	//============================== 4. 레스토랑 리뷰 ==============================
	//==========================================================================
	//4-1. 리뷰 개수
	public int getReviewCnt(int restaurant_index);
	//4-1. 리뷰 보기
	public ArrayList<ReviewVO> getReviewList(Map<String, Integer> map);
	//4-2-1. 리뷰 작성
	public int insertReviewPro(ReviewVO dto);
	//4-2-2. 리뷰작성
	public int insertRestaurant_review_Pro(Map<String, Object> map);
	//4-3-1. 리뷰 수정(작성한 글 확인)-> 수정
	public ReviewVO getReviewInfo(Map<String, Object> map);
	//4-3-2. 리뷰 수정
	public int updateReviewPro(ReviewVO dto);
	//4-4-1. 레스토랑 리뷰 삭제(restaurant_review_tbl)
	public int delete_RestaurantReviewPro(Map<String, Object> map);
	//4-4-2. 리뷰 삭제(review_tbl)
	public int delete_ReviewPro(Map<String, Object> map);
	
	
	
	//아이디 확인
	public int idCheck(String member_id);
	//비밀번호 확인
	public int pwdCheck(Map<String, Object> map);
	//public Member getMemberInfo(String strId);
}
