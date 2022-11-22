package com.itwillbs.Code_Green.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.Code_Green.service.CartService;
import com.itwillbs.Code_Green.vo.CartVO;
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
		if(insertCount > 0) {
			
			return insertCount+""; //데이터만 전달 나머진 뷰페이지
		}
		return "비어있음";	
	}

	//  장바구니 목록
	@GetMapping(value = "/cart")
	public ModelAndView cart(@RequestParam String member_id, HttpSession session, Model model,ModelAndView mav,@ModelAttribute CartVO cart) {
		String sId = (String) session.getAttribute("sId");
		
		List<CartVO> cartList = service.selectCart(member_id); // 장바구니 정보
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(cartList);
		String sumMoney =  service.sumMoney(cartList.get(0).getRf_member_idx());
		model.addAttribute("cartList", cartList);
		
		int sumM = (int)(Double.parseDouble(sumMoney));
		int fee = (sumM >= 50000 ? 0 : 2500);
		map.put("cartList", cartList);				// 장바구니 정보를 map에 저장
		map.put("count", cartList.size());		// 장바구니 상품의 유무
		map.put("sumM", sumM);		// 장바구니 전체 금액
		map.put("fee", fee); 				// 배송금액
		map.put("allSum", sumM+fee);	// 주문 상품 전체 금액 
		mav.setViewName("cart/shopping_cart");	// view(jsp)의 이름 저장
		mav.addObject("map", map);			// map 변수 저장

		return mav;
	}

	// 장바구니 삭제
	@ResponseBody
	@GetMapping("deleteCart")
	public String delete(@RequestParam int cart_idx, HttpSession session) {
		String sId = (String) session.getAttribute("sId");
		
		System.out.println(cart_idx);
		int del = service.deleteCart(cart_idx);
		System.out.println(cart_idx);
		if(del > 0 ) {
			return del+"";
		} else {
			return "삭제실패";
		}
	}
	
	// 장바구니 수정
	@ResponseBody
	@GetMapping("updateCart")
	public String update(@ModelAttribute CartVO cart,@RequestParam int cart_idx, HttpSession session) {
		String sId = (String) session.getAttribute("sId");
		System.out.println(cart_idx);
		int update = service.modifyCart(cart);

		return update+"";
	}
	
	
	
	
	
	
	
	
}
