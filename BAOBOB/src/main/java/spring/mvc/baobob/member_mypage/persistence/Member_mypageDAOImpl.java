package spring.mvc.baobob.member_mypage.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.BoardVO;

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
		System.out.println(cnt);
		
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
	
}
