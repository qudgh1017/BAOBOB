package spring.mvc.baobob.member_mypage.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.member_mypage.persistence.Member_mypageDAO;
import spring.mvc.baobob.vo.BoardVO;
import spring.mvc.baobob.vo.HistoryVO;
import spring.mvc.baobob.vo.Member;
import spring.mvc.baobob.vo.MovieHistoryVO;
import spring.mvc.baobob.vo.MovieVO;
import spring.mvc.baobob.vo.ParkingHistory;
import spring.mvc.baobob.vo.RestaurantLogVO;
import spring.mvc.baobob.vo.TableVO;
import spring.mvc.baobob.vo.Theater_seatVO;
import spring.mvc.baobob.vo.WishListVO;

@Service
public class Member_mypageServiceImpl implements Member_mypageService{
	
	@Autowired
	Member_mypageDAO dao;
	
	
	//1:1문의 리스트
	public void memQuestionList(HttpServletRequest req, Model model) {
		
		int pageSize = 10;		// 한 페이지당 출력할 글 개수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
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
		cnt = dao.getArticleCnt();
		
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
			ArrayList<BoardVO> dtos = dao.getArticleList(map);
			model.addAttribute("QuestionDtos", dtos);
			
		}
		
		//4=(5/3)*3+1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock; // (5 % 3 == 0)
		
		//6=4+3-1; 
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("memQuestionCnt", cnt); //글갯수
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
	
	//1:1문의 상세
	public void memQuestionContentForm(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		//상세페이지 가져오기...1건
		BoardVO dto = dao.getArticle(num);
		
		//조회수 증가
		dao.addReadCnt(num);
		
		//jsp로 값을 넘긴다. (dto, pageNum, number)
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
	}
	
/*----------------------------------------------------------------------------*/
	
	//1:1문의 수정 상세 페이지
	public void memQModifyView(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String strPwd = req.getParameter("pwd");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("strPwd", strPwd);
		
		int selectCnt = dao.pwdCheck(map);
		
		if(selectCnt == 1) {
			BoardVO dto = dao.getArticle(num);
			model.addAttribute("dto", dto);
		}
		
		//jsp에 값들을 넘긴다.
		model.addAttribute("selectCnt", selectCnt); //selectCnt가 0이면 패스워드가 틀렸다고 뿌려주기위해
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
	}
	
/*----------------------------------------------------------------------------*/
	
	//1:1문의 수정 처리
	public void memQModifyPro(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		BoardVO dto = new BoardVO();
		
		dto.setBoard_index(num);
		dto.setBoard_subject(req.getParameter("subject"));
		dto.setBoard_content(req.getParameter("content"));
		dto.setBoard_pwd(req.getParameter("pwd"));
		
		int cnt = dao.updateQuestion(dto);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
	}
	
/*----------------------------------------------------------------------------*/
	
	//1:1문의 작성 처리페이지
	public void memQWritePro(HttpServletRequest req, Model model) {
		BoardVO dto = new BoardVO();
		
		//2.화면으로부터 입력받은 내용을 작은바구니(DTO)에 담는다.
		dto.setMember_id((String)req.getSession().getAttribute("memId"));
		dto.setBoard_pwd(req.getParameter("pwd"));
		dto.setBoard_subject(req.getParameter("subject"));
		dto.setBoard_content(req.getParameter("content"));
		
		//3.hidden으로부터 넘겨받은 값을 작은 바구니(DTO)에 담는다.
		dto.setBoard_index(Integer.parseInt(req.getParameter("num")));
		dto.setBoard_ref(Integer.parseInt(req.getParameter("ref")));
		dto.setBoard_ref_step(Integer.parseInt(req.getParameter("ref_step")));
		dto.setBoard_ref_level(Integer.parseInt(req.getParameter("ref_level")));
		dto.setBoard_reg_date(new Timestamp(System.currentTimeMillis()));
		dto.setBoard_ip(req.getRemoteAddr()); 
		
		//5.insertBoard()
		int cnt = dao.insertQuestion(dto);
		
		//6.jsp에 넘길 값을 셋팅한다.(setAttribute)
		model.addAttribute("cnt", cnt);
	}
	
/*----------------------------------------------------------------------------*/
	
	//1:1문의 삭제 처리페이지
	public void memQDelPro(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String strPwd = req.getParameter("pwd");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("strPwd", strPwd);
		
		//num과 일치할 경우 비밀번호 일치하는지 확인
		int selectCnt = dao.pwdCheck(map);
		
		if(selectCnt == 1) {
			int deleteCnt = dao.deleteQuestion(num);
			model.addAttribute("deleteCnt", deleteCnt);
		}
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("pageNum", pageNum);
	}
	
/*----------------------------------------------------------------------------*/

	//회원카드정보 가져오기
	public void memberCard(HttpServletRequest req, Model model) {
		String strId=(String) req.getSession().getAttribute("memId"); 
		
		//세션에 저장된 아이디의 정보 가져오기
		Member vo = dao.getMemberInfo(strId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strId", strId);
		map.put("member_cumpoint", vo.getMember_cumPoint());
		
		//누적포인트에따라 회원등급(member_step)업데이트해주기
		dao.updateMemberStep(map);
		
		model.addAttribute("vo", vo);
	}
	
	
/*----------------------------------------------------------------------------*/	
	//정보수정 입력페이지
	public void memPModifyView(HttpServletRequest req, Model model) {
		//1단계. 화면으로부터 아이디, 패스워드 값을 받아온다.
		String strId=(String) req.getSession().getAttribute("memId"); 
		String strPwd=req.getParameter("pwd");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strId", strId);
		map.put("strPwd", strPwd);
		
		int selectCnt=dao.memPCheck(map);
		
		//아이디와 패스워드가 일치하면, 수정하기위해서 입력한 정보를 읽어온다.
		if(selectCnt == 1) {
			System.out.println("selectCnt == 1");
			Member vo = dao.getMemberInfo(strId);
			model.addAttribute("vo", vo);
		}
		
		//3단계. request나 session에 처리 결과를 저장하고 jsp(view)에서 받는다.
		model.addAttribute("selectCnt", selectCnt);
	}
	
/*----------------------------------------------------------------------------*/
	
	//정보수정 처리페이지
	@Override
	public void memPPro(MultipartHttpServletRequest req, Model model) {
		
		MultipartFile file = req.getFile("profile");
        
		//저장 경로(C:\Dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SPRING_BMS_Project\resources\images\)
        String saveDir = req.getRealPath("/resources/images/lgt/profile/"); 
        String realDir="C:\\Dev\\workspace_baobob\\BAOBOB\\BAOBOB\\src\\main\\webapp\\resources\\images\\lgt\\profile\\"; // 저장 경로
        //C:/Dev/workspace_baobob/BAOBOB/BAOBOB/src/main/webapp/resources/images/lgt/profile
        
        try {
            file.transferTo(new File(saveDir+file.getOriginalFilename()));
            
            FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
            FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
            
            int data = 0;
            
            while((data = fis.read()) != -1) {
                fos.write(data);
            }
            fis.close();
            fos.close();
 
            Member vo = new Member();
            
    		String id = (String)req.getSession().getAttribute("memId");
    		String fileName = file.getOriginalFilename();
    		vo.setMember_id(id);
    		vo.setMember_pwd(req.getParameter("pwd"));
    		vo.setMember_name(req.getParameter("name"));
    		vo.setMember_address(req.getParameter("address"));
    		vo.setMember_img(fileName);
    		
    		//hp
    		String hp = "";
    		String hp1=req.getParameter("hp1");
    		String hp2=req.getParameter("hp2");
    		String hp3=req.getParameter("hp3");
    		
    		//필수입력 항목이 아니므로 null 체크없이 무조건 insert하면 null pointer Exception 발생
    		if(!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) {
    			 hp = hp1 + "-" + hp2 + "-" + hp3;
    		}
    		//핸드폰 번호가 없어졌다면 if문을 타지않은	hp = "";이 들어간다.
    		vo.setMember_tel(hp);
    		
    		//email
    		String email="";
    		String email1=req.getParameter("email1");
    		String email2=req.getParameter("email2");
    		email = email1 + "@" + email2;
    		vo.setMember_email(email);
    		
    		int cnt = dao.updateMember(vo);
    		
    		model.addAttribute("cnt", cnt);
            
            
        } catch(IOException e) {
            e.printStackTrace();
        }
		
	}

/*----------------------------------------------------------------------------*/
	
	//분실물 문의 리스트
	public void memLostList(HttpServletRequest req, Model model) {
		int pageSize = 10;		// 한 페이지당 출력할 글 개수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
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
		cnt = dao.getArticleLCnt();
		
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
			ArrayList<BoardVO> dtos = dao.getArticleLList(map);
			model.addAttribute("lostDtos", dtos);
			
		}
		
		//4=(5/3)*3+1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock; // (5 % 3 == 0)
		
		//6=4+3-1; 
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("lostCnt", cnt); //글갯수
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
	
	//분실물 문의 작성 처리페이지
	public void memLWritePro(MultipartHttpServletRequest req, Model model) {
		
		MultipartFile file = req.getFile("file");
        
		//저장 경로(C:\Dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SPRING_BMS_Project\resources\images\)
        String saveDir = req.getRealPath("/resources/images/lgt/lost/"); 
        String realDir="C:\\Dev\\workspace_baobob\\BAOBOB\\BAOBOB\\src\\main\\webapp\\resources\\images\\lgt\\lost\\"; // 저장 경로
        String originFileName = file.getOriginalFilename();
        
        if(originFileName != "") {
        	
        try {
        	
        	/*if(originFileName == null) {
        		originFileName += "The-Baobab-Tree-4.jpg";
        	}*/
            
        	file.transferTo(new File(saveDir+file.getOriginalFilename()));
            
            FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
            FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
            
            int data = 0;
            
            while((data = fis.read()) != -1) {
                fos.write(data);
            }
            fis.close();
            fos.close();
		
			BoardVO dto = new BoardVO();
			
			//2.화면으로부터 입력받은 내용을 작은바구니(DTO)에 담는다.
			String fileName = file.getOriginalFilename();
			dto.setBoard_img(fileName);
			dto.setMember_id((String)req.getSession().getAttribute("memId"));
			dto.setBoard_pwd(req.getParameter("pwd"));
			dto.setBoard_subject(req.getParameter("subject"));
			dto.setBoard_content(req.getParameter("content"));
			
			//3.hidden으로부터 넘겨받은 값을 작은 바구니(DTO)에 담는다.
			dto.setBoard_index(Integer.parseInt(req.getParameter("num")));
			dto.setBoard_ref(Integer.parseInt(req.getParameter("ref")));
			dto.setBoard_ref_step(Integer.parseInt(req.getParameter("ref_step")));
			dto.setBoard_ref_level(Integer.parseInt(req.getParameter("ref_level")));
			dto.setBoard_reg_date(new Timestamp(System.currentTimeMillis()));
			dto.setBoard_ip(req.getRemoteAddr()); 
			
			int cnt = dao.insertLost(dto);
			
			model.addAttribute("cnt", cnt);
			
	        } catch(IOException e) {
	            e.printStackTrace();
	        }
        
        }else {
        	BoardVO dto = new BoardVO();
    		
    		dto.setMember_id((String)req.getSession().getAttribute("memId"));
    		dto.setBoard_pwd(req.getParameter("pwd"));
    		dto.setBoard_subject(req.getParameter("subject")+" (Not Img)");
    		dto.setBoard_content(req.getParameter("content"));
    		dto.setBoard_img("The-Baobab-Tree-4.jpg");
    		
    		dto.setBoard_index(Integer.parseInt(req.getParameter("num")));
    		dto.setBoard_ref(Integer.parseInt(req.getParameter("ref")));
    		dto.setBoard_ref_step(Integer.parseInt(req.getParameter("ref_step")));
    		dto.setBoard_ref_level(Integer.parseInt(req.getParameter("ref_level")));
    		dto.setBoard_reg_date(new Timestamp(System.currentTimeMillis()));
    		dto.setBoard_ip(req.getRemoteAddr()); 
    		
    		int cnt = dao.insertLost(dto);
    		
    		model.addAttribute("cnt", cnt);
        }
        
	}
	
/*----------------------------------------------------------------------------*/
	
	//회원탈퇴 처리페이지
	public void memPDelPro(HttpServletRequest req, Model model) {
		String strId = (String)req.getSession().getAttribute("memId");
		String strPwd = req.getParameter("pwd");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strId", strId);
		map.put("strPwd", strPwd);
		
		int selectCnt = dao.memPCheck(map);
		int deleteCnt =0;
		
		//아이디와 패스워드가 일치하면 회원탈퇴
		if(selectCnt == 1) {
			deleteCnt = dao.memPDelPro(strId);
		}
		
		//3단계. request나 session에 처리 결과를 저장하고 jsp(view)에서 받는다.
		//deletePro.jsp에서 selectCnt 뿌려줄것
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
/*----------------------------------------------------------------------------*/
	
	//무비로그-위시리스트
	public void movieWishList(HttpServletRequest req, Model model) {
		
		int pageSize = 4;		// 한 페이지당 출력할 글 개수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재 페이지의 글 시작번호
		int end = 0;			// 현재 페이지의 글 마지막번호
		int number = 0;			// 출력할 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		String strId = (String)req.getSession().getAttribute("memId");

		//글 갯수 구하기
		cnt = dao.wishListCnt(strId);
		
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
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("strId", strId);
			
			//게시글 목록 조회
			ArrayList<MovieVO> dtos = dao.getWishListMovies(map);
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
		
	//무비로그-무비다이어리
	public void movieDiaryList(HttpServletRequest req, Model model) {
		int pageSize = 10;		// 한 페이지당 출력할 글 개수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재 페이지의 글 시작번호
		int end = 0;			// 현재 페이지의 글 마지막번호
		int number = 0;			// 출력할 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		String strId = (String)req.getSession().getAttribute("memId");
		
		//글 갯수 구하기
		cnt = dao.getMovieDiaryCnt(strId);
		
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
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("strId", strId);
			
			//게시글 목록 조회
			ArrayList<BoardVO> dtos = dao.getMovieDiaryList(map);
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
		
	//무비로그-무비다이어리 글쓰기 처리
	public void movieDiaryPro(HttpServletRequest req, Model model) {
		BoardVO dto = new BoardVO();
		
		//2.화면으로부터 입력받은 내용을 작은바구니(DTO)에 담는다.
		dto.setMember_id((String)req.getSession().getAttribute("memId"));
		dto.setBoard_subject(req.getParameter("subject"));
		dto.setBoard_content(req.getParameter("content"));
		
		//3.hidden으로부터 넘겨받은 값을 작은 바구니(DTO)에 담는다.
		//dto.setBoard_index(Integer.parseInt(req.getParameter("num")));
		//dto.setBoard_ref(Integer.parseInt(req.getParameter("ref")));
		//dto.setBoard_ref_step(Integer.parseInt(req.getParameter("ref_step")));
		//dto.setBoard_ref_level(Integer.parseInt(req.getParameter("ref_level")));
		dto.setBoard_reg_date(new Timestamp(System.currentTimeMillis()));
		dto.setBoard_ip(req.getRemoteAddr()); 
		
		//5.insertBoard()
		//int cnt = dao.insertQuestion(dto);
		int cnt = dao.insertMovieDiary(dto);
		
		//6.jsp에 넘길 값을 셋팅한다.(setAttribute)
		model.addAttribute("cnt", cnt);
	}
		
/*----------------------------------------------------------------------------*/
		
	//무비다이어리 글삭제처리
	public void movieDiaryDelPro(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		
		int deleteCnt = dao.deleteMovieDiary(num);
		model.addAttribute("deleteCnt", deleteCnt);
		
	}
	
/*----------------------------------------------------------------------------*/
	
	//무비로그 위시리스트 추가
	public void addWishList(HttpServletRequest req, Model model) {
		WishListVO dto = new WishListVO();
		
		//2.화면으로부터 입력받은 내용을 작은바구니(DTO)에 담는다.
		dto.setMember_id((String)req.getSession().getAttribute("memId"));
		dto.setMovie_index(Integer.parseInt(req.getParameter("movie_index")));
		
		int cnt = dao.addWishList(dto);
		
		//6.jsp에 넘길 값을 셋팅한다.(setAttribute)
		model.addAttribute("cnt", cnt);
		model.addAttribute("movie_index",dto.getMovie_index());
	}

/*----------------------------------------------------------------------------*/
		
	//무비로그-위시리스트 삭제처리
	public void delMovieWishList(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		
		int deleteCnt = dao.delMovieWishList(num);
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
/*----------------------------------------------------------------------------*/
		
	//예매내역
	public void moviePaidList(HttpServletRequest req, Model model) {
		int pageSize = 10;		// 한 페이지당 출력할 글 개수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재 페이지의 글 시작번호
		int end = 0;			// 현재 페이지의 글 마지막번호
		int number = 0;			// 출력할 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		String strId = (String)req.getSession().getAttribute("memId");
		
		//글 갯수 구하기
		cnt = dao.movieClearCnt(strId);
		
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
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("strId", strId);
			
			//영화정보VO
			ArrayList<MovieHistoryVO> movieDtos = dao.getMovieClear(map);
			
			//좌석정보VO
			ArrayList<Theater_seatVO> seatDtos = dao.getMovieSeat(map);
			
			String[] seatRow = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
			
			for(MovieHistoryVO mVO : movieDtos) {
				
				String[] seat;
				int seatSize = 0;
				
				for(Theater_seatVO sVO : seatDtos) {
					if(mVO.getTheater_schedule_index()==sVO.getTheater_schedule_index()) {
						seatSize++;
					}
				}
				
				seat = new String[seatSize];
				
				int i=0;
				for(Theater_seatVO sVO : seatDtos) {
					if(mVO.getTheater_schedule_index()==sVO.getTheater_schedule_index()) {
						
						String seatInfo = seatRow[sVO.getSeat_row()-1]+sVO.getSeat_col();
						seat[i++] = seatInfo;
					}
				}
				mVO.setSeat(Arrays.toString(seat));
			}
			
			model.addAttribute("dtos", movieDtos);
			model.addAttribute("seatDtos",seatDtos);

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
		
	// 예매내역 취소처리
	public void moviePaidDelPro(HttpServletRequest req, Model model) {
		int schedule_index = Integer.parseInt(req.getParameter("schedule_index"));
		String memId = (String) req.getSession().getAttribute("memId");
		int history_index = Integer.parseInt(req.getParameter("history_index"));

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schedule_index", schedule_index);
		map.put("memId", memId);
		map.put("history_index", history_index);

		// 예매좌석 정보 가져오기
		ArrayList<Theater_seatVO> seatDtos = dao.getSeatInfo(map);

		int cnt = 0;
		int movieCount = 0;

		for (Theater_seatVO vo : seatDtos) {
			// 예매좌석 취소 - 예매좌석 state 돌려놓기
			if (dao.updateSeatState(vo.getSeat_index()) != 0) {
				// 예매좌석 취소 - 스케쥴에 빈좌석 돌려놓기
				dao.updateEmptySeat(vo.getSeat_index());
				movieCount++;
				cnt = 1;
			}
		}

		if (cnt == 1) {
			map.put("movieCount", movieCount);

			// 예매좌석 취소 - movie_count 돌려놀기
			if (dao.updateMovieCount(map) != 0) {

				// 사용한 포인트만큼 다시 포인트 더하기 결제금액의 10% 빼기, 누적포인트에서 결제금액의 10% 빼기.
				dao.updatePoint(map);

				// 예매내역 삭제(movie_history_tbl)
				if (dao.moviePaidDelPro(history_index) != 0) {

					// 예매내역 삭제(history_tbl)
					int deleteCnt = dao.historyDelPro(history_index);
					model.addAttribute("deleteCnt", deleteCnt);
				}
			}
		}

	}
	
/*----------------------------------------------------------------------------*/
	
	//식당 예약내역 취소처리
	public void memRBookDel(HttpServletRequest req, Model model) {
		int cnt = 0;
		int use_table_count = 0;
		
		// 식당 관리자의 memberStep에서 뒷자리를 구한다.(뒷자리가 restaurant_index와 같음)
		int restaurant_index = Integer.parseInt(req.getParameter("restaurant_index"));
		int schedule_index = Integer.parseInt(req.getParameter("restaurant_schedule_index"));	// 스케줄 index
		int table_Num = Integer.parseInt(req.getParameter("table_Num")); // 테이블 번호
		String member_id = (String)req.getSession().getAttribute("memId");
		
		// 여러 정보를 저장하기 위해 맵 이용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurant_index", restaurant_index);
		map.put("restaurant_schedule_index", schedule_index);
		map.put("member_id", member_id);
		
		//기본 좌석정보VO
		TableVO table_dto = dao.getColRow(restaurant_index);
		
		//매장을 구성하는 타일의 행열 (예:5*5) index가 0부터 시작하기때문에 +1 해준다.
		int col = table_dto.getTable_col() + 1; // 행
		int row = table_dto.getTable_row() + 1; // 열

		int table_index = 0;
		map.put("restaurant_table_index", table_index);
		
		// 열만큼 반복
		for (int i = 0; i < row; i++) {
			
			// 행만큼 반복
			for (int j = 0; j < col; j++) {
				map.replace("restaurant_table_index", table_index);
				
				// state 정보 조회
				int state = dao.getState(map);
				
				// '사용 중'인 테이블이 걸리면 '사용 중'테이블 개수 증가
				if (state == 3) {

					// 예약 된 테이블이 몇개인지 확인
					use_table_count++;
					
					// 예약 취소할 테이블 번호가 되면
					if(table_index == table_Num) {
						
						// 삭제 전 히스토리 인덱스 조회(삭제하면 히스토리 인덱스를 찾을 수 없음)
						int history_index = dao.getHistoryIndex(map);
						map.put("history_index", history_index);

						// 레스토랑 히스토리 테이블에 이용 내역 삭제
						cnt = dao.delRestaurantHistory(map);
						
						// 삭제에 성공했다면
						if(cnt != 0) {
							// 히스토리 테이블에 이용 내역 삭제
							cnt = dao.delHistory(map);
							
							// 삭제에 성공했다면
							if(cnt != 0) {
								// '사용 중'인 테이블 '사용 가능'으로 상태 변경
								cnt = dao.modState(map);
							}
						}
					}
				}
				// 테이블 번호
				table_index++;
			}
		}
		
		// '사용 중'인 테이블이 단 하나였고,'사용 가능'으로 상태 변경에 성공했다면
		if(use_table_count == 1 && cnt == 1) {
			// 테이블 전체 삭제
			cnt = dao.delTable(map);
			
			// 삭제에 성공했다면
			if(cnt != 0) {
				// 스케줄 삭제 처리
				cnt = dao.delSchedule(map);
			}
		}
		
		// 성공 여부 저장
		model.addAttribute("cnt", cnt);
		
	}
	
/*----------------------------------------------------------------------------*/
	
	//내가 이용한 레스토랑
	public void restaurantLog(HttpServletRequest req, Model model) {
		int pageSize = 5;		// 한 페이지당 출력할 글 개수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재 페이지의 글 시작번호
		int end = 0;			// 현재 페이지의 글 마지막번호
		int number = 0;			// 출력할 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		String strId = (String)req.getSession().getAttribute("memId");
		System.out.println("세션: " + strId);
		//식당 예매내역 갯수
		cnt = dao.restaurantLogCnt(strId);
		
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
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("strId", strId);
			
			//게시글 목록 조회
			ArrayList<RestaurantLogVO> resDtos = dao.restaurantLogList(map);
			model.addAttribute("dtos", resDtos);
			
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
		System.out.println("예약갯수: " + cnt);
		
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); //시작 페이지
			model.addAttribute("endPage", endPage);//마지막 페이지
			model.addAttribute("pageBlock", pageBlock);//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);//페이지 갯수
			model.addAttribute("currentPage", currentPage);//현재 페이지
		}
	}
	
/*----------------------------------------------------------------------------*/
	
	//방문내역
	public void visitList(HttpServletRequest req, Model model) {
		int pageSize = 10;		// 한 페이지당 출력할 글 개수
		int pageBlock = 3;		// 한 블럭당 페이지 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재 페이지의 글 시작번호
		int end = 0;			// 현재 페이지의 글 마지막번호
		int number = 0;			// 출력할 글번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		String strId = (String)req.getSession().getAttribute("memId");
		
		//개인별 히스토리 목록 수 조회
		cnt = dao.getHistoryListCnt(strId);
		
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
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("strId", strId);
			
			//주차장, 영화관, 레스토랑 이용내역 목록 구해서 Attribute에 저장
			ArrayList<ParkingHistory> parkDtos = dao.parkHistoryList(map);
			ArrayList<RestaurantLogVO> restaurantDtos = dao.restaurantLogList(map);
			ArrayList<MovieHistoryVO> movieDtos = dao.getMovieClear(map);
			ArrayList<HistoryVO> historyDtos = dao.getHistoryList(map);
			
			model.addAttribute("historyDtos", historyDtos);
			model.addAttribute("parkDtos", parkDtos);
			model.addAttribute("restaurantDtos", restaurantDtos);
			model.addAttribute("movieDtos", movieDtos);
			
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
	
	
	
	
	
	
	
	
	
	
		
		
	
}
