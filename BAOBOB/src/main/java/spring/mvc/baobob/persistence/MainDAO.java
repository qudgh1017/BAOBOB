package spring.mvc.baobob.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.FaqVO;
import spring.mvc.baobob.vo.Member;

public interface MainDAO {

	//아이디 중복 확인
	public int confirmId(String id);
	
	//가입 처리
	public int memberInsert(Member m);
	
	//인증키 저장
	public int memberKeyInsert(Map<String, String> map);

	//이메일 존재 여부 => id
	public String memberEmailId(String member_email);

	//인증키 존재 여부 확인
	public int memberKeySelect(Map<String, String> map);
	
	//인증키 삭제
	public int memberKeyDelete(String member_key);
	
	//이메일 전송
	public int sendEmail(String email, String id, String key);
	
	//비밀번호 찾기 이메일 인증
	public String memberConfirmPwdKey(Map<String, String> map);
	
	//회원 등급 수정
	public int memberStepUpdate(Map<String, String> map);
	
	//아이디, 비밀번호 존재 여부 => 존재하면 step
	public String confirmIdPwd(Map<String, String> map);
	
	//아이디 존재 여부
	public int getMemberCheck(String userId);
	
	//고객센터
	public ArrayList<FaqVO> getHelper(Map<String, Integer> map);
}
