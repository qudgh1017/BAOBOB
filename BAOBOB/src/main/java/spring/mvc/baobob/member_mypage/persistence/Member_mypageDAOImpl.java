package spring.mvc.baobob.member_mypage.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.BoardVO;
import spring.mvc.baobob.vo.HistoryVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieHistoryVO;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.ParkingHistory;
import spring.mvc.baobob.vo.RestaurantLogVO;
import spring.mvc.baobob.vo.WishListVO;

@Repository
public class Member_mypageDAOImpl implements Member_mypageDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//1:1문의 글갯수 구하기
	public int getArticleCnt() {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.getArticleCnt();
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//1:1문의글 목록 조회
	public ArrayList<BoardVO> getArticleList(Map<String, Integer> map){
		ArrayList<BoardVO> dtos = null;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		dtos = dao.getArticleList(map);
		
		return dtos;
	}
	
/*----------------------------------------------------------------------------*/
	
	//1:1문의 상세페이지 가져오기
	public BoardVO getArticle(int num) {
		BoardVO dto = new BoardVO();
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		dto = dao.getArticle(num);
		
		return dto;
	}
	
/*----------------------------------------------------------------------------*/

	//조회수 증가
	public void addReadCnt(int num) {
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		dao.addReadCnt(num);
	}
	
/*----------------------------------------------------------------------------*/
	
	//비밀번호 확인
	public int pwdCheck(Map<String,Object> map) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.pwdCheck(map);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//1:1문의 수정처리
	public int updateQuestion(BoardVO dto) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.updateQuestion(dto);
		
		return cnt;
		
	}
	
/*----------------------------------------------------------------------------*/
	
	//제목글인 경우
	public int getMaxNum() {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.getMaxNum();
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//답변글일 경우
	public void updateReply(BoardVO dto) {
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		dao.updateReply(dto);
	}
	
/*----------------------------------------------------------------------------*/
	
	//1:1문의 작성
	public int insertQuestion(BoardVO dto) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		
		int num = dto.getBoard_index();
		int ref = dto.getBoard_ref();
		int ref_step = dto.getBoard_ref_step();
		int ref_level = dto.getBoard_ref_level();
		
		//제목글인 경우
		if(num == 0) {
			cnt = getArticleCnt();
			System.out.println(cnt);
			//첫글이 아닌 경우
			if(cnt > 0) {
				ref = getMaxNum() + 1;
				System.out.println(ref);
			//첫글인 경우
			} else {
				ref = 1;
			}
			
			//초기화
			ref_step = 0;
			ref_level = 0;
			
		//답변글인 경우
		} else {
			//삽입할 글보다 아래쪽 글들을 update
			dao.updateReply(dto);
			ref_step++;
			ref_level++;
		}
		
		//주의사항!
		//밑에 3가지는 위에서 값이 바뀌었기때문에 바뀐 그값을 dto에 넣어서 insertBoard에서 받아야 한다.
		dto.setBoard_ref(ref);
		dto.setBoard_ref_step(ref_step);
		dto.setBoard_ref_level(ref_level);
		
		cnt = dao.insertQuestion(dto);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//답글이 존재하는지 여부
	public int checkReply(BoardVO dto) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.checkReply(dto);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//답글이 없는 경우
	public void updateRef_step(BoardVO dto) {
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		dao.updateRef_step(dto);
		
	}
	
	
/*----------------------------------------------------------------------------*/
	
	//1:1문의 삭제
	public int deleteQuestion(int num) {
		int cnt = 0;
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		
		//상세조회
		BoardVO dto = dao.getArticle(num);
		
		//답글이 존재하는지 여부
		int chkReply = checkReply(dto);
			
		//답글이 있는 경우 삭제하지 않겠다.
		if(chkReply != 0) {
			cnt = -1;
		
		}else {

			//답글이 없는 경우 삭제(제목글, 답글없는 답글)
			updateRef_step(dto);
			
			// 2.삭제
			cnt = dao.deleteQuestion(num);
		}
				
			return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//중복확인 체크
	@Override
	public int idCheck(String strId) {
		int cnt = 0;
				
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.idCheck(strId);
		
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
		
	//로그인 체크
	public int memPCheck(Map<String, Object> map) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		int idChkCnt = dao.idCheck((String)map.get("strId"));
		
		if(idChkCnt == 1) {
			int pwdChkCnt = dao.memPCheck(map);
			
			if(pwdChkCnt == 1) {
				//패스워드가 일치하면 cnt=1
				cnt = 1;
			}else {
				//패스워드가 일치하지 않으면 cnt=-1
				cnt = -1;
			}
		}
			
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원정보 가져오기
	public Member getMemberInfo(String strId) {
		Member vo = new Member();
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		vo = dao.getMemberInfo(strId);
		
		return vo;
		
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원정보 수정 처리
	public int updateMember(Member vo) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.updateMember(vo);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//분실물문의 글갯수 구하기
	public int getArticleLCnt() {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.getArticleLCnt();
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//분실물 문의글 목록 조회
	public ArrayList<BoardVO> getArticleLList(Map<String, Integer> map){
		ArrayList<BoardVO> dtos = null;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		dtos = dao.getArticleLList(map);
		
		return dtos;
	}

/*----------------------------------------------------------------------------*/	
	
	//분실물 문의 작성
	public int insertLost(BoardVO dto) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		
		int num = dto.getBoard_index();
		int ref = dto.getBoard_ref();
		int ref_step = dto.getBoard_ref_step();
		int ref_level = dto.getBoard_ref_level();
		
		//제목글인 경우
		if(num == 0) {
			cnt = getArticleCnt();
			//첫글이 아닌 경우
			if(cnt > 0) {
				ref = getMaxNum() + 1;
			//첫글인 경우
			} else {
				ref = 1;
			}
			
			//초기화
			ref_step = 0;
			ref_level = 0;
			
		//답변글인 경우
		} else {
			//삽입할 글보다 아래쪽 글들을 update
			dao.updateReply(dto);
			ref_step++;
			ref_level++;
		}
		
		//주의사항!
		//밑에 3가지는 위에서 값이 바뀌었기때문에 바뀐 그값을 dto에 넣어서 insertBoard에서 받아야 한다.
		dto.setBoard_ref(ref);
		dto.setBoard_ref_step(ref_step);
		dto.setBoard_ref_level(ref_level);
		
		cnt = dao.insertLost(dto);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원탈퇴 처리
	public int memPDelPro(String strId) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.memPDelPro(strId);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//wishList 갯수
	@Override
	public int wishListCnt(String strId) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.wishListCnt(strId);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//wishList 리스트
	public ArrayList<MovieVO> getWishListMovies(Map<String,Object> map){
		ArrayList<MovieVO> movies = null;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		movies = dao.getWishListMovies(map);
		
		return movies;
	}
	
/*----------------------------------------------------------------------------*/

	//내가본 영화 갯수	
	public int movieClearCnt(String strId) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.movieClearCnt(strId);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//내가 본 영화 리스트	
	public ArrayList<MovieHistoryVO> getMovieClear(Map<String,Object> map){
		ArrayList<MovieHistoryVO> movies = null;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		movies = dao.getMovieClear(map);
		
		return movies;
	}
	
/*----------------------------------------------------------------------------*/
	
	//무비 다이어리 글갯수 구하기
	public int getMovieDiaryCnt(String strId) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.getMovieDiaryCnt(strId);
		
		return cnt;
		
	}
	
/*----------------------------------------------------------------------------*/
	
	//무비다이어리 목록 조회
	public ArrayList<BoardVO> getMovieDiaryList(Map<String, Object> map){
		ArrayList<BoardVO> dtos = null;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		dtos = dao.getMovieDiaryList(map);
		
		return dtos;
	}
	
/*----------------------------------------------------------------------------*/
	
	//무비다이어리 작성
	public int insertMovieDiary(BoardVO dto) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		
		cnt = dao.insertMovieDiary(dto);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//무비다이어리 삭제
	public int deleteMovieDiary(int num) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		
		cnt = dao.deleteMovieDiary(num);
				
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//위시리스트 추가
	public int addWishList(WishListVO dto) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.addWishList(dto);
		
		return cnt;
	}

/*----------------------------------------------------------------------------*/
	
	//위시리스트 삭제
	public int delMovieWishList(int num) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		
		cnt = dao.delMovieWishList(num);
				
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//예매내역 삭제
	public int moviePaidDelPro(int num) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		
		cnt = dao.moviePaidDelPro(num);
				
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//내가 이용한 식당 글갯수 구하기
	public int restaurantLogCnt(String strId) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.restaurantLogCnt(strId);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//내가 이용한 식당 목록 조회
	public ArrayList<RestaurantLogVO> restaurantLogList(Map<String, Object> map){
		ArrayList<RestaurantLogVO> dtos = null;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		dtos = dao.restaurantLogList(map);
		
		return dtos;
	}
	
/*----------------------------------------------------------------------------*/
	
	//주차장 내역 갯수 구하기
	public int parkHistoryCnt(String strId) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.parkHistoryCnt(strId);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//주차장 내역 목록 조회
	public ArrayList<ParkingHistory> parkHistoryList(Map<String, Object> map){
		ArrayList<ParkingHistory> dtos = null;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		dtos = dao.parkHistoryList(map);
		
		return dtos;
	}
	
/*----------------------------------------------------------------------------*/
	
	//개인별 히스토리 목록 수 조회
	public int getHistoryListCnt(String strId) {
		int cnt = 0;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		cnt = dao.getHistoryListCnt(strId);
		
		return cnt;
	}
	
/*----------------------------------------------------------------------------*/
	
	//개인별 히스토리 목록 조회
	public ArrayList<HistoryVO> getHistoryList(Map<String, Object> map){
		ArrayList<HistoryVO> dtos = null;
		
		Member_mypageDAO dao = sqlSession.getMapper(Member_mypageDAO.class);
		dtos = dao.getHistoryList(map);
		
		return dtos;
	}
	
	
	
}
