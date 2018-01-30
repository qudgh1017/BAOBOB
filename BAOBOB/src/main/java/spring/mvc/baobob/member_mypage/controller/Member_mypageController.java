package spring.mvc.baobob.member_mypage.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.member_mypage.service.Member_mypageService;

@Controller
public class Member_mypageController {
	
	@Autowired
	Member_mypageService service;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	//회원 마이페이지 메인
	@RequestMapping("memMyPageMain")
	public String memberMypage(HttpServletRequest req, Model model) {
		log.debug("====== Member_mypageController/memMypage() ======");
		
		service.memberCard(req, model);
		//MY예매내역
		service.moviePaidList(req,model);
		//MY1:1문의
		service.memQuestionList(req, model);
		//MY분실물 문의
		service.memLostList(req, model);
		
		return "guest/member_myPage/member_myPage_main";
	}

/*----------------------------- 정보수정 ----------------------------------------*/
	
	//정보수정 폼페이지
	@RequestMapping("memPForm")
	public String memPView(HttpServletRequest req, Model model) {
		service.memberCard(req, model);
		return "guest/member_myPage/memPersonal/member_myPage_memPForm";
	}
	
	//정보수정 입력페이지	
	@RequestMapping("memPModifyView")
	public String memPModifyView(HttpServletRequest req, Model model) {
		log.debug("====== Member_mypageController/memPModifyView() ======");
		service.memberCard(req, model);
		service.memPModifyView(req, model);
		
		return "guest/member_myPage/memPersonal/member_myPage_memPView";
	}
	
	//정보수정 처리페이지
	@RequestMapping(value="memPPro", method=RequestMethod.POST)
	public String memPPro(MultipartHttpServletRequest req, Model model) {
		log.debug("====== Member_mypageController/memPPro() ======");
		service.memberCard(req, model);
		service.memPPro(req, model);
		
		return "guest/member_myPage/memPersonal/member_myPage_memPPro";
	}
	
	//회원탈퇴 폼페이지
	@RequestMapping("memPDelForm")
	public String memPDelForm(HttpServletRequest req, Model model) {
		service.memberCard(req, model);
		
		return "guest/member_myPage/memPersonal/member_myPage_memPDelForm";
	}
	
	//회원탈퇴 처리페이지
	@RequestMapping("memPDelPro")
	public String memPDelPro(HttpServletRequest req, Model model) {
		
		service.memPDelPro(req, model);
		
		return "guest/member_myPage/memPersonal/member_myPage_memPDelPro";
	}
	
	
/*----------------------------- 1:1문의 ----------------------------------------*/
	
	//1:1문의 리스트
	@RequestMapping("memQuestion")
	public String memQuestion(HttpServletRequest req, Model model) {
		log.debug("====== Member_mypageController/memQuestion() ======");
		if(req.getSession().getAttribute("memId") != null) {
			service.memberCard(req, model);
			service.memQuestionList(req, model);
		}
		return "guest/member_myPage/memQuestion/member_myPage_memQuestion";
	}
	
	//1:1문의 상세
	@RequestMapping("memQuestionContentForm")
	public String memQuestionContentForm(HttpServletRequest req, Model model) {
		service.memberCard(req, model);
		service.memQuestionContentForm(req, model);
		
		return "guest/member_myPage/memQuestion/member_myPage_memQContentForm";
	}

	//1:1문의 수정 폼 페이지
	@RequestMapping("memQModifyForm")
	public String memQModifyForm(HttpServletRequest req, Model model) {
		
		service.memberCard(req, model);
		
		//contentForm에서 글수정버튼을 눌렀을때 넘긴 값들을 받는다.
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		//받아온값들을 저장해서 modifyForm.jsp에서 받아라
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		
		return "guest/member_myPage/memQuestion/member_myPage_memQModifyForm";
	}
	
	//1:1문의 수정 상세 페이지
	@RequestMapping("memQModifyView")
	public String boardModifyView(HttpServletRequest req, Model model) {
		service.memberCard(req, model);
		service.memQModifyView(req, model);
		
		return "guest/member_myPage/memQuestion/member_myPage_memQModifyView";
	}
	
	//1:1문의 수정 처리
	@RequestMapping("memQModifyPro")
	public String memQModifyPro(HttpServletRequest req, Model model) {
		service.memberCard(req, model);
		service.memQModifyPro(req, model);
		
		return "guest/member_myPage/memQuestion/member_myPage_memQModifyPro";
	}
	
	//1:1문의하기 작성폼 페이지
	@RequestMapping("memQWriteForm")
	public String memQWriteForm(HttpServletRequest req, Model model) {
		
		service.memberCard(req, model);
		
		//제목글쓰기(답변글이 아닌경우)
		int num = 0;
		int ref = 0; //그룹화 아이디
		int ref_step = 0; //답변글 순서(행)
		int ref_level = 0; //답변글 레벨(들여쓰기) 
		
		//답글쓰기
		//contentForm에서 답글쓰기 버튼을 눌렀을때 넘긴 값들을 받는다.
		if(req.getParameter("num") != null) {
			num = Integer.parseInt(req.getParameter("num"));
			ref = Integer.parseInt(req.getParameter("ref"));
			ref_step = Integer.parseInt(req.getParameter("ref_step"));
			ref_level = Integer.parseInt(req.getParameter("ref_level"));
		}
		
		//받아온값들을 저장해서 writeForm.jsp에서 받아라
		req.setAttribute("num", num);
		req.setAttribute("ref", ref);
		req.setAttribute("ref_step", ref_step);
		req.setAttribute("ref_level", ref_level);
		
		return "guest/member_myPage/memQuestion/member_myPage_memQWriteForm";
	}
	
	//1:1문의하기 처리페이지	
	@RequestMapping("memQWritePro")
	public String memQWritePro(HttpServletRequest req, Model model) {
		service.memberCard(req, model);
		service.memQWritePro(req, model);
		
		return "guest/member_myPage/memQuestion/member_myPage_memQWritePro";
	}
	
	//1:1문의하기 삭제폼 페이지	
	@RequestMapping("memQDelForm")
	public String memQDelForm(HttpServletRequest req, Model model) {
		
		service.memberCard(req, model);
		
		//contentForm.jsp에서 삭제button을 눌렀을떄 get방식으로 넘긴 값을 가져온다.
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		
		return "guest/member_myPage/memQuestion/member_myPage_memQDelForm";
	}
	
	//1:1문의하기 삭제 처리페이지
	@RequestMapping("memQDelPro")
	public String memQDelPro(HttpServletRequest req, Model model) {
		service.memberCard(req, model);
		service.memQDelPro(req, model);
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		
		return "guest/member_myPage/memQuestion/member_myPage_memQDelPro";
	}
	
/*----------------------------- 분실물 문의 ----------------------------------------*/	
	
	//분실물 문의 리스트
	@RequestMapping("memLost")
	public String memLost(HttpServletRequest req, Model model) {
		log.debug("====== Member_mypageController/memLost() ======");
		if(req.getSession().getAttribute("memId") != null) {
			service.memberCard(req, model);
			service.memLostList(req, model);
		}
		return "guest/member_myPage/memLost/member_myPage_memLost";
	}
	
	//분실물 문의 상세
	@RequestMapping("memLostContentForm")
	public String memLostContentForm(HttpServletRequest req, Model model) {
		service.memberCard(req, model);
		service.memQuestionContentForm(req, model);
		
		return "guest/member_myPage/memLost/member_myPage_memLContentForm";
	}
	
	//분실물 문의 수정 폼 페이지
	@RequestMapping("memLModifyForm")
	public String memLModifyForm(HttpServletRequest req, Model model) {
		
		service.memberCard(req, model);
		
		//contentForm에서 글수정버튼을 눌렀을때 넘긴 값들을 받는다.
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		//받아온값들을 저장해서 modifyForm.jsp에서 받아라
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		
		return "guest/member_myPage/memLost/member_myPage_memLModifyForm";
	}
	
	//분실물 문의 수정 상세 페이지
	@RequestMapping("memLModifyView")
	public String memLModifyView(HttpServletRequest req, Model model) {
		service.memberCard(req, model);
		service.memQModifyView(req, model);
		
		return "guest/member_myPage/memLost/member_myPage_memLModifyView";
	}
	
	//분실물 문의 수정 처리
	@RequestMapping("memLModifyPro")
	public String memLModifyPro(HttpServletRequest req, Model model) {
		service.memberCard(req, model);
		service.memQModifyPro(req, model);
		
		return "guest/member_myPage/memLost/member_myPage_memLModifyPro";
	}
	
	//분실물 문의하기 삭제폼 페이지	
	@RequestMapping("memLDelForm")
	public String memLDelForm(HttpServletRequest req, Model model) {
		
		service.memberCard(req, model);
		
		//contentForm.jsp에서 삭제button을 눌렀을떄 get방식으로 넘긴 값을 가져온다.
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		
		return "guest/member_myPage/memLost/member_myPage_memLDelForm";
	}

	//분실물 문의하기 삭제 처리페이지
	@RequestMapping("memLDelPro")
	public String memLDelPro(HttpServletRequest req, Model model) {
		service.memberCard(req, model);
		service.memQDelPro(req, model);
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		
		return "guest/member_myPage/memLost/member_myPage_memLDelPro";
	}
	
	//분실물 문의하기 작성폼 페이지
	@RequestMapping("memLWriteForm")
	public String memLWriteForm(HttpServletRequest req, Model model) {
		
		service.memberCard(req, model);
		
		//제목글쓰기(답변글이 아닌경우)
		int num = 0;
		int ref = 0; //그룹화 아이디
		int ref_step = 0; //답변글 순서(행)
		int ref_level = 0; //답변글 레벨(들여쓰기) 
		
		//답글쓰기
		//contentForm에서 답글쓰기 버튼을 눌렀을때 넘긴 값들을 받는다.
		if(req.getParameter("num") != null) {
			num = Integer.parseInt(req.getParameter("num"));
			ref = Integer.parseInt(req.getParameter("ref"));
			ref_step = Integer.parseInt(req.getParameter("ref_step"));
			ref_level = Integer.parseInt(req.getParameter("ref_level"));
		}
		
		//받아온값들을 저장해서 writeForm.jsp에서 받아라
		req.setAttribute("num", num);
		req.setAttribute("ref", ref);
		req.setAttribute("ref_step", ref_step);
		req.setAttribute("ref_level", ref_level);
		
		return "guest/member_myPage/memLost/member_myPage_memLWriteForm";
	}
	
	//분실물 문의하기 처리페이지	
	@RequestMapping(value="memLWritePro", method=RequestMethod.POST)
	public String memLWritePro(MultipartHttpServletRequest req, Model model) {
		
		log.debug("====== Member_mypageController/memLWritePro() ======");
		
		service.memberCard(req, model);
		service.memLWritePro(req, model);
		
		return "guest/member_myPage/memLost/member_myPage_memLWritePro";
	}
	
/*----------------------------- 무비 로그 ----------------------------------------*/	
	
	//무비로그
	@RequestMapping("MovieLog")
	public String MovieLog(HttpServletRequest req, Model model) {
		service.memberCard(req, model);
		service.movieWishList(req, model);
		
		return "guest/member_myPage/memMovie/member_myPage_MovieLog";
	}
	
	//무비로그 위시리스트
	@RequestMapping("wishList")
	public String wishList(HttpServletRequest req, Model model) {
		
		service.movieWishList(req, model);
		
		return "guest/member_myPage/memMovie/member_myPage_WishList";
	}
	
	//위시리스트 추가
	@RequestMapping("addWishList")
	public String addWishList(HttpServletRequest req, Model model) {
		
		service.addWishList(req, model);
		
		return "guest/member_myPage/memMovie/member_myPage_addWishListPro";
	}

	
	//무비로그 위시리스트 삭제
	@RequestMapping("delWishList")
	public String delWishList(HttpServletRequest req, Model model) {
		
		service.delMovieWishList(req, model);
		
		return "guest/member_myPage/memMovie/member_myPage_delWishListPro";
	}
		
	//무비로그 무비다이어리
	@RequestMapping("movieDiaryWriteForm")
	public String movieDiaryWriteForm(HttpServletRequest req, Model model) {
		
		if(req.getSession().getAttribute("memId") != null) {
			service.movieDiaryList(req,model);
		}
		
		//service.movieClear(req, model);
		
		return "guest/member_myPage/memMovie/member_myPage_movieDiaryWriteForm";
	}
	
	//무비로그 무비다이어리 페이징
	@RequestMapping("movieDiaryPage")
	public String movieDiaryPage(HttpServletRequest req, Model model) {
		
		service.movieDiaryList(req,model);
		
		return "guest/member_myPage/memMovie/member_myPage_movieDiaryPage";
	}
	
	//무비다이어리 글쓰기 처리
	@RequestMapping("movieDiaryPro")
	public String movieDiaryPro(HttpServletRequest req, Model model) {
		
		service.movieDiaryPro(req,model);
		
		return "guest/member_myPage/memMovie/member_myPage_movieDiaryPro";
	}
	
	//무비다이어리 글삭제처리
	@RequestMapping("movieDiaryDel")
	public String movieDiaryDel(HttpServletRequest req, Model model) {
		
		service.movieDiaryDelPro(req,model);
		
		return "guest/member_myPage/memMovie/member_myPage_movieDiaryDelPro";
	}
	
/*----------------------------- 예매 내역 ----------------------------------------*/
	
	//예매내역 리스트
	@RequestMapping("moviePaidList")
	public String moviePaidList(HttpServletRequest req, Model model) {
		
		service.memberCard(req, model);
		service.moviePaidList(req,model);
		
		return "guest/member_myPage/memMovie/member_myPage_moviePaidList";
	}
	
	//레스토랑 로그
	@RequestMapping("restaurantLog")
	public String restaurantLog(HttpServletRequest req, Model model) {
		
		service.memberCard(req, model);
		service.restaurantLog(req, model);
		
		return "guest/member_myPage/memRestaurant/member_myPage_restaurantLog";
	}
	
	//레스토랑 예약 내역
	@RequestMapping("memRBookList")
	public String memRBookList(HttpServletRequest req, Model model) {
		
		service.memberCard(req, model);
		service.restaurantLog(req, model);
		
		return "guest/member_myPage/memRestaurant/member_myPage_memRBookList";
	}

	//영화 예매내역 취소처리
	@RequestMapping("moviePaidDelPro")
	public String moviePaidDelPro(HttpServletRequest req, Model model) {
		
		service.moviePaidDelPro(req, model);
		
		return "guest/member_myPage/memMovie/member_myPage_moviePaidDelPro";
	}
	
	//레스토랑 예약내역 삭제
	@RequestMapping("memRBookDel")
	public String memRBookDel(HttpServletRequest req, Model model) {
		
		service.memRBookDel(req, model);
		
		return "guest/member_myPage/memRestaurant/member_myPage_memRBookDelPro";
	}
	
	//방문내역
	@RequestMapping("visit")
	public String visit(HttpServletRequest req, Model model) {
		
		service.memberCard(req, model);
		service.visitList(req, model);
		
		return "guest/member_myPage/service/member_myPage_visit";
	}
	
	//포인트 안내
	@RequestMapping("memPoint")
	public String memPoint(HttpServletRequest req, Model model) {
		
		service.memberCard(req, model);
		
		return "guest/member_myPage/service/member_myPage_memPoint";
	}
	
	
	
	
	
}
