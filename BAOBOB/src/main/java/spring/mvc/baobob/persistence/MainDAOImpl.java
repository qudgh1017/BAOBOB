package spring.mvc.baobob.persistence;

import java.util.ArrayList;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.quartz.SimpleThreadPoolTaskExecutor;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.service.EmailHandler;
import spring.mvc.baobob.vo.FaqVO;
import spring.mvc.baobob.vo.Member;

@Repository
public class MainDAOImpl implements MainDAO {

	@Autowired
	SqlSession sqlSession;

	// 아이디 중복 확인
	@Override
	public int confirmId(String id) {
		System.out.println("confirmId 시작");

		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		int cnt = dao.confirmId(id);

		System.out.println("confirmId 종료");
		return cnt;
	}

	// 가입처리
	@Override
	public int memberInsert(Member m) {
		System.out.println("memberInsert 시작");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		int cnt = dao.memberInsert(m);
		System.out.println("memberInsert 종료");
		return cnt;
	}

	@Autowired
	private JavaMailSender mailSender;

	// 인증 메일 전송
	@Override
	public int sendEmail(String email, String id, String key) {
		int cnt = 0;
		try {
			EmailHandler sendMail = new EmailHandler(mailSender);
			if (id != null) {
				sendMail.setSubject("BAOBOB 가입 인증 메일");
				sendMail.setText(new StringBuffer("링크를 눌러 인증을 완료하세요.<br><br>")
						.append("<a href='http://192.168.0.158/baobob/mainConfirmEmail?key=").append(key)
						.append("&id=" + id + "'>인증<a>").toString());
			} else {
				sendMail.setSubject("BAOBOB 비밀번호 찾기 인증 메일");
				sendMail.setText(new StringBuffer("<html>링크를 눌어 인증을 완료하세요.<br><br>")
						.append("<a href='http://192.168.0.158/baobob/mainConfirmPwdEmail?key=").append(key)
						.append("&email=" + email + "'>인증</a></html>").toString());
			}
			sendMail.setFrom("admin@baobob.com", "BAOBOB");
			sendMail.setTo(email);
			sendMail.send();

			cnt = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}

	// 인증키 저장
	public int memberKeyInsert(Map<String, String> map) {
		System.out.println("memberKeyInsert 시작");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		int cnt = mapper.memberKeyInsert(map);
		System.out.println("memberKeyInsert 종료");
		return cnt;
	}

	// 이메일 존재 여부 => id
	public String memberEmailId(String member_email) {
		System.out.println("memberEmailId 시작");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		String member_id = mapper.memberEmailId(member_email);
		System.out.println("memberEmailId 종료");
		return member_id;
	}

	// 인증키 존재 여부 확인
	public int memberKeySelect(Map<String, String> map) {
		System.out.println("memberKeySelect 시작");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		int cnt = mapper.memberKeySelect(map);
		System.out.println("memberKeySelect 종료");
		return cnt;
	}

	// 인증키 삭제
	public int memberKeyDelete(String member_key) {
		System.out.println("memberKeyDelete 시작");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		int cnt = mapper.memberKeyDelete(member_key);
		System.out.println("memberKeyDelete 종료");
		return cnt;
	}

	// 회원 등급 수정
	@Override
	public int memberStepUpdate(Map<String, String> map) {
		System.out.println("memberStepUpdate 시작");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		int cnt = mapper.memberStepUpdate(map);
		System.out.println("memberStepUpdate 종료");
		return cnt;
	}

	// 아이디, 비밀번호 존재 여부 => 존재하면 step
	@Override
	public String confirmIdPwd(Map<String, String> map) {
		System.out.println("confirmIdPwd 시작");
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		String step = mapper.confirmIdPwd(map);
		System.out.println("confirmIdPwd 종료");
		return step;
	}

	// 비밀번호 찾기 이메일 전송
	public String memberConfirmPwdKey(Map<String, String> map) {
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		String member_pwd = mapper.memberConfirmPwdKey(map);
		return member_pwd;
	};

	// 아이디 존재 여부
	@Override
	public int getMemberCheck(String userId) {
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		int cnt = mapper.getMemberCheck(userId);
		return cnt;
	}

	//고객센터
	public ArrayList<FaqVO> getHelper(Map<String, Integer> map) {
		MainDAO mapper = sqlSession.getMapper(MainDAO.class);
		ArrayList<FaqVO> list = mapper.getHelper(map);
		return list;
	}
}
