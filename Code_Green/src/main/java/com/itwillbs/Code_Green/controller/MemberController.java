package com.itwillbs.Code_Green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.Code_Green.service.ItemService;
import com.itwillbs.Code_Green.service.MailSendService;
import com.itwillbs.Code_Green.service.MemberService;
import com.itwillbs.Code_Green.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MailSendService mailService;
	@Autowired
	private MemberService service;
	@Autowired
	private ItemService Iservice;
	
	
	// "/MemberLoginPro.me" 요청에 대해 비즈니스 로직 처리 - POST
	@PostMapping(value = "/MemberLoginPro.me")
	public String loginPro(@ModelAttribute MemberVO member, Model model, HttpSession session) {
		System.out.println(member);
		// ------------------ BCryptPasswordEncoder 활용한 로그인 판별 ----------------------
		// 1. BCryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		// 2. member 테이블에서 id 에 해당하는 패스워드 조회 후 리턴값 저장(getPasswd())
		// => 파라미터 : 아이디 리턴타입 : String(passwd)
		String passwd = service.getPasswd(member.getMember_id());
//		System.out.println(passwd);
		

		// 3. 조회 결과를 활용하여 로그인 성공 여부 판별
		// 1) 아이디가 없을 경우(passwd 값이 null) 실패
		// 2) 패스워드 비교(BCryptPasswordEncoder 객체의 matches() 메서드 활용)
		// 2-1) 다를 경우 실패
		// 2-2) 같을 경우 성공
		if (passwd == null || !encoder.matches(member.getMember_pass(), passwd)) {
			model.addAttribute("msg", "로그인 실패! 힝~");
//			System.out.println(member.getMember_id() + ", " + member.getMember_pass()+"로그인 실패..");
			return "member/fail_back";
		} else {

			MemberVO getMem = service.getMemberInfo(member.getMember_id());
			System.out.println(getMem);
			session.setAttribute("sId", member.getMember_id());
			session.setAttribute("sIdx", getMem.getMember_idx());

			System.out.println("세션값" + ((Integer)session.getAttribute("sIdx")));
			int WishlistCount = Iservice.getWishListCount( member.getMember_id());
			session.setAttribute("WishlistCount", WishlistCount);
			model.addAttribute("item_category",WishlistCount);
			
			return "redirect:/";
		}

	}

	
	//회원가입 페이지 요청
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}

	// "/MemberJoinPro.me" 요청에 대해 비즈니스 로직 처리할 joinPro() 메서드 정의 - POST
	// => 파라미터 : 회원 가입 정보(MemberVO), Model 객체
	@PostMapping(value = "/MemberJoinPro.me")
	public String joinMemberPro(@ModelAttribute MemberVO member, Model model, @RequestParam int member_idx) {

		// ------------------ BCryptPasswordEncoder 활용한 해싱 ----------------------

		// 1. BCryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// 2. BCryptPasswordEncoder 객체의 encode() 메서드를 호출하여 해싱 결과 리턴
		String securePasswd = encoder.encode(member.getMember_pass());
		// 3. MemberVO 객체의 패스워드에 암호문 저장
		member.setMember_pass(securePasswd);

		int insertCount = service.joinMember(member);

		if (insertCount > 0) { // 가입 성공
			System.out.println("가입 성공!");
			//가입 성공시 기본적립금 적립
			service.setCoin(member_idx);
			
			return "redirect:/join_result";
		} else { // 가입 실패
			model.addAttribute("msg", "가입 실패!");
			return "member/fail_back";
		}
	}

	

	@RequestMapping(value = "/join_result", method = RequestMethod.GET)
	public String join_reult() {
		return "member/join_result";
	}

	// MemberLogout.me 요청에 대한 로그아웃 처리
	@GetMapping(value = "/MemberLogout.me")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(@ModelAttribute MemberVO member, Model model, HttpSession session, String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);

	}

}
