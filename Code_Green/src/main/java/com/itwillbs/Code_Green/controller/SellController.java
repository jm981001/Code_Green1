package com.itwillbs.Code_Green.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment(@RequestParam String member_id, HttpSession session, Model model) {
		
		MemberVO memberInfo = member_service.getMemberInfo(member_id);
		// 주문자 기본 정보 불러오기
		model.addAttribute("memberInfo", memberInfo);
		session.setAttribute(member_id, "member_id");
		
		// 장바구니 정보 불러오기
		List<CartVO> cartList = sell_service.selectCart(member_id);
		model.addAttribute("cartList", cartList);
		
		// 적립금 불러오기
		CoinVO coin = sell_service.selectCoin(member_id);
		model.addAttribute("coin", coin);
				
		
		return "payment/payment";
	}
	
	

	// 주문하기
	@RequestMapping(value = "payment_success", method = RequestMethod.POST)
	public String payment_success(@RequestParam String member_id, @ModelAttribute SellVO sell) {
		
		System.out.println(member_id);
		
		System.out.println(sell);
		
		int orderNum = 0;

//		int insertCount = sell_service.insertOrder(member_id, orderNum);
		
		return "payment/payment_success";
	}	

}
