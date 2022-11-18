package com.itwillbs.Code_Green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.Code_Green.service.CartService;
import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.MemberVO;

@Controller
public class CartController {

	@Autowired
	private CartService service;

	//  장바구니 추가
	@ResponseBody
	@GetMapping(value = "/addCart")
	public String addCart(@ModelAttribute CartVO cart,HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");
		System.out.println(cart);
		int insertCount = service.insertCart(cart);
		
		return insertCount+""; //데이터만 전달 나머진 뷰페이지
	}

	//  장바구니 목록
	@GetMapping(value = "/cart")
	public String cart(@RequestParam String member_id, HttpSession session, Model model) {
		session.setAttribute(member_id, "member_id");
		List<CartVO> cartList = service.selectCart(member_id); // 장바구니 정보
		
		model.addAttribute("cartList", cartList);

		return "cart/shopping_cart";
	}

	// 장바구니 삭제
	@ResponseBody
	@GetMapping("deleteCart")
	public String delete(@RequestParam int cart_idx) {
		System.out.println(cart_idx);
		int del =service.deleteCart(cart_idx);
		System.out.println(cart_idx);
			return del+"";
	}
	
	// 장바구니 수정
	@GetMapping("updateCart")
	public String update(@RequestParam int[] cart_amount, @RequestParam int[] item_idx, HttpSession session) {
		// session의 id
		String member_id = (String) session.getAttribute("member_id");
		
		// 레코드의 갯수 만큰 반복문 실행
		for(int i=0; i<item_idx.length; i++){
			CartVO cart = new CartVO();
//			cart.setRf_member_idx(member_id);
			cart.setCart_amount(cart_amount[i]);
			cart.setRf_item_idx(item_idx[i]);
			service.modifyCart(cart);
		}
		
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
}
