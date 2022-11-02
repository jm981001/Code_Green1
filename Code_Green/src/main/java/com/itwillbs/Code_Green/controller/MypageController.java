package com.itwillbs.Code_Green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.Code_Green.service.MemberService;
import com.itwillbs.Code_Green.vo.MemberVO;


@Controller
public class MypageController {

	@Autowired
	private MemberService service;
	
	//------------마이페이지 메인-------------------------------------------
	@GetMapping(value = "/MemberInfo.me")
	public String getMemberInfo(
			@RequestParam String member_id, Model model, HttpSession session) {
		// 세션 아이디 가져와서 sId 변수에 저장
		String sId = (String)session.getAttribute("sId");
		System.out.println(member_id + ", " + sId);
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "member/fail_back";
		} else {
			MemberVO member = service.getMemberInfo(member_id); // 파라미터는 검색할 아이디 전달
			// Model 객체에 "member" 속성명으로 MemberVO 객체 저장
			System.out.println(member);
			model.addAttribute("member", member);
			// member/member_info.jsp 페이지로 이동
			return "member/myPage_main";
		}
	}
	
	//------------마이페이지 찜한상품-------------------------------------------
	@GetMapping(value = "/myPage_heart")
	public String myPage_heart(@RequestParam String member_id, Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		System.out.println(member_id + ", " + sId);
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "member/fail_back";
		} else {
			MemberVO member = service.getMemberInfo(member_id); // 파라미터는 검색할 아이디 전달
			// Model 객체에 "member" 속성명으로 MemberVO 객체 저장
			System.out.println(member);
			model.addAttribute("member", member);
			// member/member_info.jsp 페이지로 이동
		return "member/myPage_heart";
		}
	}
	
	//------------마이페이지 팔로우-------------------------------------------
	@RequestMapping(value = "myPage_following", method = RequestMethod.GET)
	public String myPage_fllowing() {
		return "member/myPage_following";
	}
	
	//------------마이페이지 적립금-------------------------------------------
	@RequestMapping(value = "myPage_emoney", method = RequestMethod.GET)
	public String myPage_emoney() {
		return "member/myPage_emoney";
	}
	
	//------------마이페이지 주문목록-------------------------------------------
	@RequestMapping(value = "myPage_buyListNull", method = RequestMethod.GET)
	public String myPage_buyListNull() {
		return "member/myPage_buyListNull";
	}
	
	//------------마이페이지 구매목록-------------------------------------------
	@RequestMapping(value = "myPage_buyList", method = RequestMethod.GET)
	public String myPage_buyList() {
		return "member/myPage_buyList";
	}
	
	//------------마이페이지 상품후기-------------------------------------------
	@RequestMapping(value = "myPage_review", method = RequestMethod.GET)
	public String myPage_review() {
		return "member/myPage_review";
	}
	
	//------------마이페이지 상품후기 작성-------------------------------------------
	@RequestMapping(value = "myPage_review_Write", method = RequestMethod.GET)
	public String myPage_review_Write() {
		return "member/myPage_review_Write";
	}
	
	//------------마이페이지 문의내역-------------------------------------------
	@RequestMapping(value = "myPage_qnaDetail", method = RequestMethod.GET)
	public String myPage_qnaDetail() {
		return "member/myPage_qnaDetail";
	}
	
	//------------마이페이지 작성글-------------------------------------------
	@RequestMapping(value = "myPage_board", method = RequestMethod.GET)
	public String myPage_board() {
		return "member/myPage_board";
	}
	
	//------------마이페이지 개인정보 수정-------------------------------------------
	@RequestMapping(value = "myPage_userInfo", method = RequestMethod.GET)
	public String myPage_userInfo() {
		return "member/myPage_userInfo";
	}
	
	
	
	
	
	
	
}
