package spring.mvc.baobob.member_mypage.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface Member_mypageService {
	
	//1:1문의 리스트
	public void memQuestionList(HttpServletRequest req, Model model);
	
	//분실물 문의 리스트
	public void memLostList(HttpServletRequest req, Model model);
	
	//1:1문의 상세
	public void memQuestionContentForm(HttpServletRequest req, Model model);
	
	//1:1문의 수정 상세 페이지
	public void memQModifyView(HttpServletRequest req, Model model);
	
	//1:1문의 수정 처리
	public void memQModifyPro(HttpServletRequest req, Model model);
	
	//1:1문의 작성 처리페이지
	public void memQWritePro(HttpServletRequest req, Model model);
	
	//분실물 문의 작성 처리페이지
	public void memLWritePro(MultipartHttpServletRequest req, Model model);
	
	//1:1문의 삭제 처리페이지
	public void memQDelPro(HttpServletRequest req, Model model);
	
	//회원카드정보 가져오기
	public void memberCard(HttpServletRequest req, Model model);
	
	//정보수정 입력페이지
	public void memPModifyView(HttpServletRequest req, Model model);
	
	//정보수정 처리페이지
	public void memPPro(MultipartHttpServletRequest req, Model model);
	
	//회원탈퇴 처리페이지
	public void memPDelPro(HttpServletRequest req, Model model);
	
	//무비로그-위시리스트
	public void movieWishList(HttpServletRequest req, Model model);
	
	//무비로그-무비다이어리
	public void movieDiaryList(HttpServletRequest req, Model model);
	
	//무비로그-무비다이어리 글쓰기 처리
	public void movieDiaryPro(HttpServletRequest req, Model model);
	
	//무비로그-무비다이어리 글삭제처리
	public void movieDiaryDelPro(HttpServletRequest req, Model model);
	
	//위시리스트 추가
	public void addWishList(HttpServletRequest req, Model model);

	
	//무비로그-위시리스트 삭제처리
	public void delMovieWishList(HttpServletRequest req, Model model);
	
	//예매내역
	public void moviePaidList(HttpServletRequest req, Model model);
	
	//예매내역 취소처리
	public void moviePaidDelPro(HttpServletRequest req, Model model);
	
	//내가 이용한 레스토랑
	public void restaurantLog(HttpServletRequest req, Model model);
	
	//방문내역
	public void visitList(HttpServletRequest req, Model model);
}
