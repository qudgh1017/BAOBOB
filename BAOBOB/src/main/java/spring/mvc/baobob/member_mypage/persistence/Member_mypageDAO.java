package spring.mvc.baobob.member_mypage.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.BoardVO;

public interface Member_mypageDAO {
	
	//1:1문의 글갯수 구하기
	public int getArticleCnt();
	
	//1:1문의글 목록 조회
	public ArrayList<BoardVO> getArticleList(Map<String, Integer> map);

}
