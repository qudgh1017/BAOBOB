package spring.mvc.baobob.guest_restaurant.persistence;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.MenuVO;
import spring.mvc.baobob.vo.RestaurantVO;
import spring.mvc.baobob.vo.ReviewVO;
import spring.mvc.baobob.vo.TableVO;

@Repository
public class Guest_restaurantDAOImpl implements Guest_restaurantDAO{
	private Logger log = Logger.getLogger(this.getClass());

	
	@Autowired
	private SqlSession sqlSession;
	
	//==========================================================================
	//============================== 2. 레스토랑-메뉴 ==============================
	//==========================================================================
	//2-1.레스토랑 메뉴 갯수
	@Override
	public int getArticleCnt_menu(int restaurant_index) {
		log.debug("===== DAO/getArticleCnt_menu() =====");

		int cnt = 0;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		cnt = dao.getArticleCnt_menu(restaurant_index);
		
		return cnt;
	}
	
	//2-2. 레스토랑-메뉴내용
	@Override
	public ArrayList<MenuVO> getArticle_menu(int restaurant_index) {
		log.debug("===== DAO/getArticle_menu() =====");
		ArrayList<MenuVO> dtos = null;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		dtos = dao.getArticle_menu(restaurant_index);
			
		return dtos;
	}
	//==========================================================================
	//============================== 3. 레스토랑 예약 ==============================
	//==========================================================================
	//매장 내 테이블 정보 조회
	@Override
	public RestaurantVO reserv_tableList(int index) {
		log.debug("===== DAO/reserv_tableList() =====");
		System.out.println("index : " + index);
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		
		return dao.reserv_tableList(index);
	}
	
	//매장 내 테이블 정보 조회를 위한 좌석 수 조회
	@Override
	public TableVO getColRow(int index) {
		log.debug("===== DAO/getColRow() =====");

		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		
		return dao.getColRow(index);
	}
	
	//매장 내 테이블 정보 조회를 위한 테이블 상태 조회
	@Override
	public String getState(Map<String, Object> map) {
		log.debug("===== DAO/getState() =====");

		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		
		return dao.getState(map);
	}
	
	// 식당[1] 예약 추가
	@Override
	public int addReserv(Map<String, Object> map) {
		log.debug("===== DAO/modTable2() =====");
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		
		return dao.addReserv(map);
	}
	
	// 식당[1] 선택 날짜 예약 조회
	@Override
	public int modTable2(Map<String, Object> map) {
		log.debug("===== DAO/modTable2() =====");
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		
		return dao.modTable2(map);
	}
	
	//예약 내역 추가
	@Override
	public int AddHistory(Map<String, Object> map) {
		log.debug("===== DAO/AddHistory() =====");
		int cnt = 0;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		cnt = dao.AddHistory(map);

		System.out.println(cnt<1? "실패":"AddHistory 성공");
		
		return cnt;
	}
		
	//레스토랑 예약 내역 추가 
	@Override
	public int AddRHistory(Map<String, Object> map) {
		log.debug("===== DAO/AddRHistory() =====");
		int cnt = 0;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		cnt = dao.AddRHistory(map);
		
		System.out.println(cnt<1 ? "실패":"AddRHistory 성공");
		
		return cnt;
	}
	//==========================================================================
	//============================== 4. 레스토랑 리뷰 ==============================
	//==========================================================================
	//4-1. 리뷰 갯수
	@Override
	public int getReviewCnt(int restaurant_index) {
		log.debug("===== DAO/getReviewCnt() =====");

		int cnt = 0;
		
		Guest_restaurantDAO dao =  sqlSession.getMapper(Guest_restaurantDAO.class);
		cnt = dao.getReviewCnt(restaurant_index);
		
		return cnt;
	}
	
	//4-1.리뷰 확인
	@Override
	public ArrayList<ReviewVO> getReviewList(Map<String, Integer> map){
		log.debug("===== DAO/getReviewList() =====");

		ArrayList<ReviewVO> dtos = null;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		dtos = dao.getReviewList(map);
		
		return dtos;
	}
	
	//4-2-1. 리뷰 추가(Review_tbl)
	public int insertReviewPro(ReviewVO dto) {
		log.debug("===== DAO/insertReviewPro() =====");
		int insertCnt = 0;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		insertCnt = dao.insertReviewPro(dto);
		
		if(insertCnt > 0) {
			System.out.println("리뷰 추가(Review_tbl) 성공");
		}else {
			System.out.println("리뷰 추가(Review_tbl) 실패");
		}
		//memberId도 추가해야함
		return insertCnt;
	}
	
	//4-2-2. 리뷰 추가(Restaurant_review_tbl)
	public int insertRestaurant_review_Pro(Map<String, Object> map) {
		log.debug("===== DAO/insertRestaurant_review_Pro() =====");
		int insertCnt = 0;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		insertCnt = dao.insertRestaurant_review_Pro(map);
		
		if(insertCnt > 0) {
			System.out.println("리뷰 추가(Review_tbl), 리뷰 추가(Restaurant_review_tbl) 성공");
		}else {
			System.out.println("리뷰 추가(Restaurant_review_tbl) 실패");
		}
		return insertCnt;
	}
	
	//4-3. 정보가져오기
	@Override
	public ReviewVO getReviewInfo(Map<String, Object> map) {
		log.debug("===== DAO/getReviewInfo() =====");
		ReviewVO dto = new ReviewVO();
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		dto = dao.getReviewInfo(map);
		
		return dto;
	}
	
	//4-3. 리뷰 수정
	@Override
	public int updateReviewPro(ReviewVO dto) {
		log.debug("===== DAO/updateReviewPro() =====");
		int updateCnt = 0;
		System.out.println("===== DAO - updateReviewPro =====");
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		updateCnt = dao.updateReviewPro(dto);
		
		return updateCnt;
	}
	
	//4-4. 리뷰 삭제
	@Override
	public int delete_ReviewPro(Map<String, Object> map) {
		log.debug("===== DAO/delete_ReviewPro() =====");
		int deleteCnt = 0;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		int deleteRCnt = delete_RestaurantReviewPro(map);
		deleteCnt = dao.delete_ReviewPro(map);
		
		System.out.println("레스토랑 리뷰 삭제1 : " + deleteRCnt);
		System.out.println("리뷰 삭제2 : " + deleteCnt);

		return deleteCnt;
	}
	
	@Override
	public int delete_RestaurantReviewPro(Map<String, Object> map) {
		log.debug("===== DAO/delete_RestaurantReviewPro() =====");
		int deleteCnt = 0;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		deleteCnt = dao.delete_RestaurantReviewPro(map);
		
		return deleteCnt;
	}
	
	
	
	
	
	//아이디 확인
	@Override
	public int idCheck(String member_id) {
		log.debug("===== DAO/idCheck() =====");
		int cnt=0;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		cnt = dao.idCheck(member_id);
		
		if(cnt>0) System.out.println("아이디 확인");
		
		return cnt;
	}
	
	//로그인 처리, 정보수정, 정보삭제
	@Override
	public int pwdCheck(Map<String, Object> map) {
		log.debug("===== DAO/pwdCheck() =====");
		int cnt = 0;
		System.out.println("2. pwdCheck - strId : " + map.get("member_id"));
		//로그인 화면에서 입력받은 id와 일치한 데이터가 있는지 확인
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		int idChkCnt = idCheck((String)map.get("member_id"));
		
		//로그인한 id에 해당하는 데이터가있고
		if(idChkCnt>0) {
			//dao=sqlSession.getMapper(MemberDAO.class);
			int pwdChkCnt = dao.pwdCheck(map);
			System.out.println("pwdCheck : "+ pwdChkCnt);
			if(pwdChkCnt==1) {//패스워드가 일치하면 cnt=1
				cnt=1;
			
			}else {// 패스워드가 일치하지 않으면 cnt = -1
				cnt=-1;
			}
		}else {	//아이디 존재 x
			cnt=0;
		}
		return cnt;
	}

	
}
