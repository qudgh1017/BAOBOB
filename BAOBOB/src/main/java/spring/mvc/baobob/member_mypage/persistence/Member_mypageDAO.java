package spring.mvc.baobob.member_mypage.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.BoardVO;
import spring.mvc.baobob.vo.Member;

public interface Member_mypageDAO {
	
	//1:1문의 글갯수 구하기
	public int getArticleCnt();
	
	//1:1문의글 목록 조회
	public ArrayList<BoardVO> getArticleList(Map<String, Integer> map);
	
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
	

}
