package spring.mvc.baobob.host_total.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;

import spring.mvc.baobob.vo.Member;

public interface Host_totalDAO {
	
	//회원수 구하기
	public int getMemCnt();
	
	//회원 목록 구하기
	public ArrayList<Member> getMemList(Map<String, Integer> map);
	
	//회원 추가
	public int insertMember(Member vo);
	
	// 아이디 중복 확인
	public int confirmId(String id);
	
	//회원정보 가져오기
	public Member getMemberInfo(String strId);
	
	//회원정보 수정 처리
	public int hostTMemModifyPro(Member vo);
	
	//회원삭제 처리
	public int hostTMemDelPro(String strId);
	
	//영화관 결산 총액 구하기
	public int getMovieSale();
	
	//영화관 결산페이지(챠트)
	@MapKey("kind")
	public Map<String,Integer> getMovieChart();
	
	
	
	
}
