package com.itwillbs.Code_Green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.Code_Green.service.MemberService;
import com.itwillbs.Code_Green.vo.MemberVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value = "join_result", method = RequestMethod.GET)
	public String join_reult() {
		return "member/join_result";
	}
	
	// "/MemberLoginForm.me" 요청에 대해 member/member_login_form.jsp 페이지 실행
	@GetMapping(value = "/login")
	public String login() {
		return "member/login";
	}
	
		
	// "/MemberLoginPro.me" 요청에 대해 비즈니스 로직 처리 - POST
	@PostMapping(value = "/MemberLoginPro.me")
	public String loginPro(@ModelAttribute MemberVO member, Model model, HttpSession session) {
		MemberVO memberResult = service.loginMember(member);
		
		if(memberResult == null) {
			model.addAttribute("msg", "로그인 실패! 힝~");
			System.out.println(member.getMember_id() + ", " + member.getMember_pass());
			return "member/fail_back";
		} else {
			session.setAttribute("sId", memberResult.getMember_id());
			return "redirect:/";
		}
		
	}

	// MemberLogout.me 요청에 대한 로그아웃 처리
		@GetMapping(value = "/MemberLogout.me")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
	
	
	
	
	
	
	
	
	
}
