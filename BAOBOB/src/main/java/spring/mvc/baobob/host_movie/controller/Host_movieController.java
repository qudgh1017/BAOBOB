package spring.mvc.baobob.host_movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.host_movie.service.Host_movieServiceImpl;


@Controller
public class Host_movieController {
	@Autowired
	Host_movieServiceImpl service = new Host_movieServiceImpl();
	
	// 관리자 영화
	@RequestMapping(value="hostMovie")
	public String hostMovie(HttpServletRequest req, Model model) {
		System.out.println("hostMovie");
		
		service.hostMovieList(req, model);
		
		return "host/host_movie/hostMovie";
	}
	
	// 영화 추가
	@RequestMapping(value="hostMovieAddForm")
	public String hostMovieAddForm() {
		System.out.println("hostMovieAddForm");
		
		return "host/host_movie/hostMovieAddForm";
	}

	// 영화 추가 처리
	@RequestMapping(value="hostMovieAddPro")
	public String hostMovieAddPro(MultipartHttpServletRequest req, Model model) {
		System.out.println("hostMovieAddPro");
		
		service.hostMovieAddPro(req, model);
		
		return "host/host_movie/hostMovieAddPro";
	}
	
	// 영화 삭제 처리
	@RequestMapping(value="hostMovieDel")
	public String hostMovieDel(HttpServletRequest req, Model model) {
		System.out.println("hostMovieDel");
		
		service.hostMovieDel(req, model);
		
		return "host/host_movie/hostMovieDel";
	}
	
	// 영화 상세 페이지
	@RequestMapping(value="hostMovieDetail")
	public String hostMovieDetail(HttpServletRequest req, Model model) {
		System.out.println("hostMovieDetail");
		
		service.hostMovieDetail(req, model);
		
		return "host/host_movie/hostMovieDetail";
	}
	
	// 영화 수정 처리
	@RequestMapping(value="hostMovieModPro")
	public String hostMovieModPro(MultipartHttpServletRequest req, Model model) {
		System.out.println("hostMovieModPro");
		
		service.hostMovieModPro(req, model);
		
		return "host/host_movie/hostMovieModPro";
	}
	
	// 관리자 상영관
	@RequestMapping(value="hostTheater")
	public String hostTheater(HttpServletRequest req, Model model) {
		System.out.println("hostTheater");
		
		service.hostTheaterList(req, model);
		
		return "host/host_movie/hostTheater";
	}
	
	// 상영관 등록하기
	@RequestMapping(value="hostTheaterAddForm")
	public String hostTheaterAddForm() {
		System.out.println("hostTheaterAddForm");
		
		return "host/host_movie/hostTheaterAddForm";
	}
	
	// 상영관 좌석 업데이트
	@RequestMapping(value="hostTheaterAddPro")
	public String hostTheaterSettingChange(HttpServletRequest req, Model model) {
		System.out.println("hostTheaterSettingChange");
		
		service.hostTheaterAddPro(req, model);
		
		return "host/host_movie/hostTheaterAddPro";
	}
	
	// 상영관 상세
	@RequestMapping(value="hostTheaterDetail")
	public String hostTheaterDetail(HttpServletRequest req, Model model) {
		System.out.println("hostTheaterDetail");
		
		service.hostTheaterDetail(req, model);
		
		return "host/host_movie/hostTheaterDetail";
	}
	
	// 상영관 수정 처리
	@RequestMapping(value="hostTheaterModPro")
	public String hostTheaterModPro(HttpServletRequest req, Model model) {
		System.out.println("hostTheaterModPro");
		
		service.hostTheaterModPro(req, model);
		
		return "host/host_movie/hostTheaterModPro";
	}
	
	// 상영관 삭제
	@RequestMapping(value="hostTheaterDel")
	public String hostTheaterDel(HttpServletRequest req, Model model) {
		System.out.println("hostTheaterDel");
		
		service.hostTheaterDel(req, model);
		
		return "host/host_movie/hostTheaterDel";
	} 
	
	// 스케줄
	@RequestMapping(value="hostSchedule")
	public String hostSchedule(HttpServletRequest req, Model model) {
		System.out.println("hostSchedule");
		
		service.hostScheduleList(req, model);
		
		return "host/host_movie/hostSchedule";
	}
	
	// 스케줄 조회하기 버튼
	@RequestMapping(value="hostScheduleSearch")
	public String hostScheduleSearch(HttpServletRequest req, Model model) {
		System.out.println("hostScheduleSearch");
		
		service.hostScheduleSearch(req, model);
		
		return "host/host_movie/hostSchedule";
	}
	
	// 스케줄 추가 폼
	@RequestMapping(value="hostScheduleAddForm")
	public String hostScheduleAddForm(HttpServletRequest req, Model model) {
		System.out.println("hostScheduleAddForm");
		
		service.hostScheduleAddForm(req, model);
		
		return "host/host_movie/hostScheduleAddForm";
	}
	
	// 상영 가능한 상영관 찾기
	@RequestMapping(value="checkPosTheater")
	public String checkPosTheater(HttpServletRequest req, Model model) {
		System.out.println("checkPosTheater");
		
		service.checkPosTheater(req, model);
		
		String schedule_startDate = req.getParameter("schedule_startDate");
		String schedule_startTime = req.getParameter("schedule_startTime");
		model.addAttribute("schedule_startDate", schedule_startDate);
		model.addAttribute("schedule_startTime", schedule_startTime);
		
		return "host/host_movie/hostScheduleAddForm";
	}
	
	// 스케줄 추가 처리
	@RequestMapping(value="hostScheduleAddPro")
	public String hostScheduleAddPro(HttpServletRequest req, Model model) {
		System.out.println("hostScheduleAddPro");
		
		service.hostScheduleAddPro(req, model);
		
		return "host/host_movie/hostScheduleAddPro";
	}
	
	// 스케줄 상세 내용
	@RequestMapping(value="hostScheduleDetail")
	public String hostScheduleDetail(HttpServletRequest req, Model model) {
		System.out.println("hostScheduleDetail");
		
		service.hostScheduleDetail(req, model);
		
		return "host/host_movie/hostScheduleDetail";
	}
	
	// 스케줄 수정 처리
	@RequestMapping(value="hostScheduleModPro")
	public String hostScheduleModPro(HttpServletRequest req, Model model) {
		System.out.println("hostScheduleModPro");
		
		service.hostScheduleModPro(req, model);
		
		return "host/host_movie/hostScheduleModPro";
	}

	// 스케줄 삭제 처리
	@RequestMapping(value="hostScheduleDelPro")
	public String hostScheduleDelPro(HttpServletRequest req, Model model) {
		System.out.println("hostScheduleDelPro");
		
		service.hostScheduleDelPro(req, model);
		
		return "host/host_movie/hostScheduleDelPro";
	}
	
	// 직원 관리
	@RequestMapping(value="hostMovieEmp")
	public String hostMovieEmp(HttpServletRequest req, Model model) {
		System.out.println("hostMovieEmp");
		
		
		
		
		return "host/host_movie/hostMovieEmp";
	}
	
	// 직원 고용하기
	@RequestMapping(value="hostMovieEmpAddForm")
	public String hostMovieEmpAddForm(HttpServletRequest req, Model model) {
		System.out.println("hostMovieEmpAddForm");
		
		
		
		
		return "host/host_movie/hostMovieEmpAddForm";
	}
	
	// 직원 고용을 위한 회원 아이디 확인하기
	@RequestMapping(value="hostMovieEmpChkMemberId")
	public String hostMovieEmpChkMemberId(HttpServletRequest req, Model model) {
		System.out.println("hostMovieEmpChkMemberId");
		
		service.hostMovieEmpChkMemberId(req, model);
		
		return "host/host_movie/hostMovieEmpAddForm";
	}
	
	// 직원 고용 처리
	@RequestMapping(value="hostMovieEmpAddPro")
	public String hostMovieEmpAddPro(HttpServletRequest req, Model model) {
		System.out.println("hostMovieEmpAddPro");
		
		service.hostMovieEmpAddPro(req, model);
		
		return "host/host_movie/hostMovieEmpAddPro";
	}
}
