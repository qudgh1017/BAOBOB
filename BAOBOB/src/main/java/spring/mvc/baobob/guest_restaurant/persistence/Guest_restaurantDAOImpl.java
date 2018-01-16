package spring.mvc.baobob.guest_restaurant.persistence;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.MenuVO;
import spring.mvc.baobob.vo.ReviewVO;

@Repository
public class Guest_restaurantDAOImpl implements Guest_restaurantDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//==========================================================================
	//============================== 2. 레스토랑-메뉴 ==============================
	//==========================================================================
	//2-1.레스토랑 메뉴 갯수
	@Override
	public int getArticleCnt_menu(int restaurant_index) {
		int cnt = 0;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		cnt = dao.getArticleCnt_menu(restaurant_index);
		
		return cnt;
	}
	
	//2-2. 레스토랑-메뉴내용
	@Override
	public ArrayList<MenuVO> getArticle_menu(int restaurant_index) {
		ArrayList<MenuVO> dtos = null;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		dtos = dao.getArticle_menu(restaurant_index);
			
		return dtos;
	}
	//==========================================================================
	//============================== 3. 레스토랑 예약 ==============================
	//==========================================================================
	
	
	//==========================================================================
	//============================== 4. 레스토랑 리뷰 ==============================
	//==========================================================================
	//4-1. 리뷰 갯수
	@Override
	public int getReviewCnt(int restaurant_index) {
		int cnt = 0;
		
		Guest_restaurantDAO dao =  sqlSession.getMapper(Guest_restaurantDAO.class);
		cnt = dao.getReviewCnt(restaurant_index);
		
		return cnt;
	}
	
	//4-1.리뷰 확인
	@Override
	public ArrayList<ReviewVO> getReviewList(Map<String, Integer> map){
	
		ArrayList<ReviewVO> dtos = null;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		dtos = dao.getReviewList(map);
		
		return dtos;
	}
	
	//4-2-1. 리뷰 추가(Review_tbl)
	public int insertReviewPro(ReviewVO dto) {
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
		ReviewVO dto = new ReviewVO();
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		dto = dao.getReviewInfo(map);
		
		return dto;
	}

	//4-3. 리뷰 수정
	@Override
	public int updateReviewPro(ReviewVO dto) {
		int updateCnt = 0;
		System.out.println("===== DAO - updateReviewPro =====");
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		updateCnt = dao.updateReviewPro(dto);
		
		return updateCnt;
	}

	
	
	
	//4-4. 리뷰 삭제
	@Override
	public int delete_ReviewPro(Map<String, Object> map) {
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
		int deleteCnt = 0;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		deleteCnt = dao.delete_RestaurantReviewPro(map);
		
		return deleteCnt;
	}
	
	
	
	
	
	//아이디 확인
	@Override
	public int idCheck(String member_id) {
		int cnt=0;
		
		Guest_restaurantDAO dao = sqlSession.getMapper(Guest_restaurantDAO.class);
		cnt = dao.idCheck(member_id);
		
		if(cnt>0) System.out.println("아이디 확인");
		
		return cnt;
	}
	
	//로그인 처리, 정보수정, 정보삭제
	@Override
	public int pwdCheck(Map<String, Object> map) {
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
