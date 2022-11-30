package com.itwillbs.Code_Green.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.itwillbs.Code_Green.vo.MemberVO;

@Component
public class MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	private MemberService mService;
	
	private int authNumber;

	// 인증코드 생성기
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}

	// 이메일 양식
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = "CodeGreen@gmail.com";
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목
		String content = "" + // html 형식으로 작성 !
				"<br><br>" + "인증 번호는 " + authNumber + " 입니다." + "<br>" + "해당 인증번호를 입력해주세요."; // 이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}

	// 아이디 찾아주는 이메일 양식
	public String idFindEmail(String email,HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		MemberVO member = mService.getMemberInfo(sId);
		String memberId = member.getMember_id();
		
		String setFrom = "CodeGreen@gmail.com";
		String toMail = email;
		String title = "회원님의 아이디 입니다."; // 이메일 제목
		String content = "" + // html 형식으로 작성 !
				"<br><br>" + "아이디는 " + member.getMember_id() + " 입니다."; // 이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return memberId;
	}

	// 이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}


}