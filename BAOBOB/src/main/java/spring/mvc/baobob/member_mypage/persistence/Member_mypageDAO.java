package spring.mvc.baobob.member_mypage.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.BoardVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieHistoryVO;
import spring.mvc.baobob.vo.MovieVO;

public interface Member_mypageDAO {
	
	//1:1문의 글갯수 구하기
	public int getArticleCnt();
	
	//분실물문의 글갯수 구하기
	public int getArticleLCnt();
	
	//1:1문의글 목록 조회
	public ArrayList<BoardVO> getArticleList(Map<String, Integer> map);
	
	//분실물 문의글 목록 조회
	public ArrayList<BoardVO> getArticleLList(Map<String, Integer> map);
	
	//1:1문의 상세페이지 가져오기
	public BoardVO getArticle(int num);
	
	//조회수 증가
	public void addReadCnt(int num);
	
	//비밀번호 확인
	public int pwdCheck(Map<String,Object> map);
	
	//1:1문의 수정처리
	public int updateQuestion(BoardVO dto);
	
	//제목글인 경우
	public int getMaxNum();
	
	//답변글일 경우
	public void updateReply(BoardVO dto);
	
	//1:1문의 작성
	public int insertQuestion(BoardVO dto);
	
	//분실물 문의 작성
	public int insertLost(BoardVO dto);
	
	//답글이 존재하는지 여부
	public int checkReply(BoardVO dto);
	
	//답글이 없는 경우
	public void updateRef_step(BoardVO dto);
	
	//1:1문의 삭제
	public int deleteQuestion(int num);
	
	//중복확인 체크
	public int idCheck(String strId);
		
	//체크
	public int memPCheck(Map<String, Object> map);
	
	//회원정보 가져오기
	public Member getMemberInfo(String strId);
	
	//회원정보 수정 처리
	public int updateMember(Member vo);
	
	//회원탈퇴 처리
	public int memPDelPro(String strId);
	
	//wishList 갯수
	public int wishListCnt(String strId);
	
	//wishList 리스트
	public ArrayList<MovieVO> getWishListMovies(Map<String,Object> map);
		
	//내가본 영화 갯수	
	public int movieClearCnt(String strId);	
		
	//내가 본 영화 리스트	
	public ArrayList<MovieHistoryVO> getMovieClear(Map<String,Object> map);
		
	//무비 다이어리 글갯수 구하기
	public int getMovieDiaryCnt(String strId);	
	
	//무비 다이어리 목록 조회
	public ArrayList<BoardVO> getMovieDiaryList(Map<String, Object> map);
	
	//무비다이어리 작성
	public int insertMovieDiary(BoardVO dto);
	
	//무비다이어리 삭제
	public int deleteMovieDiary(int num);
	
	//위시리스트 삭제
	public int delMovieWishList(int num);
	
	//예매내역 삭제
	public int moviePaidDelPro(int num);

}
