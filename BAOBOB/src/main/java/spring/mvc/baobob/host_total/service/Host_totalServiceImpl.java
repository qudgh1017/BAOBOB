package spring.mvc.baobob.host_total.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.baobob.host_total.persistence.Host_totalDAO;
import spring.mvc.baobob.vo.Member;

@Service
public class Host_totalServiceImpl implements Host_totalService{
	
	@Autowired
	Host_totalDAO dao;
	
/*----------------------------------------------------------------------------*/
	
	//회원 리스트
	public void memList(HttpServletRequest req, Model model) {
		
		int pageSize = 15;		// 한 페이지당 출력할 글 개수
		int pageBlock = 5;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재 페이지의 글 시작번호
		int end = 0;			// 현재 페이지의 글 마지막번호
		int number = 0;			// 출력할 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		
		//글 갯수 구하기
		cnt = dao.getMemCnt();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	//첫페이지를 1페이지로 설정
		}
		
		currentPage = Integer.parseInt(pageNum); //현재 페이지
		
		//페이지 갯수 (pageSize가 5이고 전체 글갯수가 12면 2개가 남는데 그 2개도 페이지를 할당해 줘야한다.)
		//pageCnt = 12 / 5 + 1; ... 나머지 2건이 1페이지로 할당되므로 3페이지(2페이지+1페이지)
		pageCount = (cnt / pageSize) + ((cnt % pageSize > 0) ? 1 : 0); 
		
		//현재 페이지 시작번호
		start = (currentPage - 1) * pageSize + 1; 
		
		//현재 페이지 끝번호
		end = start + pageSize - 1;
		
		if(end > cnt) end = cnt;
		
		//1=21-(5(현제페이지)-1)*5
		number = cnt - (currentPage -1) * pageSize; //출력할 글번호..최신글(큰페이지)가 1페이지 출력할 글번호
		
		if(cnt > 0) {
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			
			//게시글 목록 조회
			ArrayList<Member> dtos = dao.getMemList(map);
			model.addAttribute("dtos", dtos);
			
		}
		
		//4=(5/3)*3+1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock; // (5 % 3 == 0)
		
		//6=4+3-1; 
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt); //글갯수
		model.addAttribute("number", number); //글번호
		model.addAttribute("pageNum", pageNum); //페이지 번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); //시작 페이지
			model.addAttribute("endPage", endPage);//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);//페이지 갯수
			model.addAttribute("currentPage", currentPage);//현재 페이지
		}
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원 추가
	public void memAddPro(HttpServletRequest req, Model model) {
		Member vo = new Member();
		
		vo.setMember_name(req.getParameter("name"));
		vo.setMember_id(req.getParameter("id"));
		vo.setMember_step(Integer.parseInt(req.getParameter("step")));
		vo.setMember_pwd(req.getParameter("pwd"));
		vo.setMember_email(req.getParameter("email"));
		vo.setMember_birth(req.getParameter("birth"));
		vo.setMember_sex(req.getParameter("sex"));
		vo.setMember_tel(req.getParameter("tel"));
		vo.setMember_address(req.getParameter("address"));
		
		vo.setMember_reg_date(new Timestamp(System.currentTimeMillis()));
		
		int cnt = dao.insertMember(vo);
		
		model.addAttribute("cnt", cnt);
	}
	
/*----------------------------------------------------------------------------*/
	
	//아이디 중복검사
	public void confirmId(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		int cnt = dao.confirmId(id);
		System.out.println("confirmId: " + cnt);
		model.addAttribute("cnt", cnt);
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원 정보, 수정뷰페이지
	public void hostTMemView(HttpServletRequest req, Model model) {
		String strId=req.getParameter("member_id");
		
		Member vo = dao.getMemberInfo(strId);
		model.addAttribute("vo", vo);
		
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원 정보 수정처리
	public void hostTMemModifyPro(HttpServletRequest req, Model model) {
		Member vo = new Member();
		
		vo.setMember_id(req.getParameter("memId"));
		vo.setMember_name(req.getParameter("name"));
		vo.setMember_step(Integer.parseInt(req.getParameter("step")));
		vo.setMember_pwd(req.getParameter("pwd"));
		vo.setMember_email(req.getParameter("email"));
		vo.setMember_tel(req.getParameter("tel"));
		vo.setMember_address(req.getParameter("address"));
		
		int cnt = dao.hostTMemModifyPro(vo);
		System.out.println("보자2: " + req.getParameter("memId"));
		model.addAttribute("cnt", cnt);
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원삭제 처리페이지
	public void hostTMemDelPro(HttpServletRequest req, Model model) {
		int deleteCnt =0;
		
		String strId = req.getParameter("member_id");
		
		deleteCnt = dao.hostTMemDelPro(strId);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
/*----------------------------------------------------------------------------*/
	
	//영화관 결산페이지
	public void movieChart(HttpServletRequest req, Model model) {
		System.out.println("결산서비스");
		
		//총판매액을 가져옴
		int movieSale = dao.getMovieSale(); 
		model.addAttribute("movieSale",movieSale);
		System.out.println("총액" + movieSale);
		
		//상품종류별 구매수
		//Map<String,Integer> map = (Map<String,Integer>)dao.getMovieChart(); 
		//model.addAttribute("movieChart",map);
	}
	
	
	
	
	
	
	
	
	
	
	

}
