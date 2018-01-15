package spring.mvc.baobob.member_mypage.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
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
import spring.mvc.baobob.vo.Member;

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
		
		Member vo = dao.getMemberInfo(strId);
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
	
	
	
	
}
