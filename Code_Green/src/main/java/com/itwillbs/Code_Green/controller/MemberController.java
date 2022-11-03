package com.itwillbs.Code_Green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberController {
	
	
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value = "join_result", method = RequestMethod.GET)
	public String join_reult() {
		return "member/join_result";
	}
	
	

	// MemberLogout.me 요청에 대한 로그아웃 처리
		@GetMapping(value = "/MemberLogout.me")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
	
	
	
	
	
	
	
	
	
}
