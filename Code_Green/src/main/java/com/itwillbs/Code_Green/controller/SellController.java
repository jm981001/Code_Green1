package com.itwillbs.Code_Green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.Code_Green.service.CartService;
import com.itwillbs.Code_Green.service.MemberService;
import com.itwillbs.Code_Green.service.SellService;
import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.CoinVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.SellVO;

@Controller
public class SellController {
	@Autowired
	private MemberService member_service;
	
	@Autowired
	private SellService sell_service;
	
	@Autowired
	private CartService cart_service;
	
	
	@GetMapping(value = "/payment")
	public String payment(@RequestParam String member_id, HttpSession session, Model model, @RequestParam String cart_total,@RequestParam String shipping_fee) {
		
		MemberVO memberInfo = member_service.getMemberInfo(member_id);
		// 주문자 기본 정보 불러오기
		model.addAttribute("memberInfo", memberInfo);
		session.setAttribute(member_id, "member_id");
		
		// 장바구니 정보 불러오기
		List<CartVO> cartList = sell_service.getCart(member_id);
		model.addAttribute("cartList", cartList);
		
		// 적립금 불러오기
		CoinVO coin = sell_service.getCoin(member_id);
		model.addAttribute("coin", coin);
		
		model.addAttribute("cart_total", cart_total);
		model.addAttribute("shipping_fee", shipping_fee);
	
		return "payment/payment";
	}
	
	

	// 주문하기
	@PostMapping(value = "payment_success")
	public String payment_success(@RequestParam String member_id, @ModelAttribute SellVO sell, @RequestParam int member_idx) {
		
		List<CartVO> cartList = cart_service.selectCart(member_id); // 장바구니 정보
		
		System.out.println("cartList : " + cartList);
		
		System.out.println("member_id : " + member_id);
		
		System.out.println("sell : " + sell);

		System.out.println("member_idx : " + member_idx);
		int orderNum = 0;

//		int insertCount = sell_service.insertOrder(member_id, orderNum);
		
		return "payment/payment_success";
	}	

}