package com.itwillbs.Code_Green.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.Code_Green.service.CartService;
import com.itwillbs.Code_Green.vo.CartVO;

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
//		int count = service.checkCart(cart.getRf_item_idx(), cart.getRf_member_idx());
//		if(count == 0){		
			// 없으면 insert
			int insertCount = service.insertCart(cart);
//		} else {
			// 있으면 update
//			service.ucpdateCart(cart);
//		}
		
		return insertCount+""; //데이터만 전달 나머진 뷰페이지
	}

	//  장바구니 목록
	@GetMapping(value = "/cart")
	public ModelAndView cart(@RequestParam String member_id, HttpSession session, Model model,ModelAndView mav,@ModelAttribute CartVO cart) {
		session.setAttribute(member_id, "member_id");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<CartVO> cartList = service.selectCart(member_id); // 장바구니 정보

		
//		int sumMoney =  service.sumMoney(cart.getRf_member_idx());//String->Int 에러 뜨는중
		
		model.addAttribute("cartList", cartList);
		
//		int fee = sumMoney >= 50000 ? 0 : 2500;
		map.put("cartList", cartList);				// 장바구니 정보를 map에 저장
		map.put("count", cartList.size());		// 장바구니 상품의 유무
//		map.put("sumMoney", sumMoney);		// 장바구니 전체 금액
//		map.put("fee", fee); 				// 배송금액
//		map.put("allSum", sumMoney+fee);	// 주문 상품 전체 금액 
		mav.setViewName("cart/shopping_cart");	// view(jsp)의 이름 저장
		mav.addObject("map", map);			// map 변수 저장

		return mav;
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
