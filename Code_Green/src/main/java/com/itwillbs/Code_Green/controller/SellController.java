package com.itwillbs.Code_Green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.Code_Green.service.CartService;
import com.itwillbs.Code_Green.service.MemberService;
import com.itwillbs.Code_Green.service.SellService;
import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.SellVO;

@Controller
public class SellController {
	@Autowired
	private MemberService member_service;
	
	@Autowired
	private SellService sell_service;
	
	// 결제
	@RequestMapping(value = "payment", method = RequestMethod.GET)
	public String payment(@RequestParam String member_id, HttpSession session, Model model) {
		MemberVO memberInfo = member_service.getMemberInfo(member_id);
		
		model.addAttribute("memberInfo", memberInfo);
		
		session.setAttribute(member_id, "member_id");
		
		List<CartVO> cartList = sell_service.selectCart(member_id);
		
		model.addAttribute("cartList", cartList);
		
		
		
		return "payment/payment";
	}
	

	// 결제 완료
	@RequestMapping(value = "payment_success", method = RequestMethod.POST)
	public String payment_success_account(@ModelAttribute SellVO sell) {
		
		System.out.println(sell);
		
		return "payment/payment_success";
	}	

}
