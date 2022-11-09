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

import com.itwillbs.Code_Green.service.ManagerService;
import com.itwillbs.Code_Green.service.MemberService;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}

	// "/MemberJoinPro.me" 요청에 대해 비즈니스 로직 처리할 joinPro() 메서드 정의 - POST
	// => 파라미터 : 회원 가입 정보(MemberVO), Model 객체
	@PostMapping(value = "/MemberJoinPro")
	public String joinMemberPro(@ModelAttribute MemberVO member, Model model) {

		int insertCount = service.joinMember(member);

		if (insertCount > 0) { // 가입 성공
			System.out.println("가입 성공!");
			return "redirect:/join_result";
		} else { // 가입 실패
			model.addAttribute("msg", "가입 실패!");
			return "member/login";
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

}
