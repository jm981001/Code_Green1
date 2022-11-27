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
	public String addCart(@ModelAttribute CartVO cart, HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");

		if (sId == null) {
			model.addAttribute("msg", "회원만 이용 가능합니다!");
			return "member/fail_back";
		
		} else {
			int insertCount = service.insertCart(cart);
			if (insertCount > 0) {
				return insertCount + ""; // 데이터만 전달 나머진 뷰페이지
			} else {
				model.addAttribute("msg", "담기 실패!");
				return "redirect:/cart/fail_back.jsp";
			}
		}
	}
	//  장바구니 목록
	@GetMapping(value = "/cart")
	public ModelAndView cart(@RequestParam String member_id, HttpSession session, Model model,ModelAndView mav,@ModelAttribute CartVO cart) {
		String sId = (String) session.getAttribute("sId");

		//		if(cart.get() <= 0) {  //장바구니가 비어있을때 보여주는 페이지
//			mav.setViewName("cart/shopping_cart");
//			return mav;

		if (sId == null) { //로그인 안하면 못들어감
			mav.setViewName("redirect:/login");
			return mav;
		} else {
			List<CartVO> cartList = service.getCart(member_id); // 장바구니 정보

			Map<String, Object> map = new HashMap<String, Object>();

			String sumMoney = service.sumMoney(cartList.get(0).getRf_member_idx());

			int sumM = (int) (Double.parseDouble(sumMoney));
			int fee = (sumM >= 50000 ? 0 : 2500); // 5만원 기준으로 배송비 측정

			model.addAttribute("cartList", cartList);
			map.put("cartList", cartList); // 장바구니 정보를 map에 저장
			map.put("count", cartList.size()); // 장바구니 상품의 유무
			map.put("sumM", sumM); // 장바구니 전체 금액
			map.put("fee", fee); // 배송비
			map.put("allSum", sumM + fee); // 주문 상품 전체 금액

			mav.setViewName("cart/shopping_cart"); // 이동할 view 페이지의 이름 저장
			mav.addObject("map", map); // map 변수 저장
//			System.out.println("cartList : " + cartList);

			return mav;
		}

	}

		
//	}

	// 장바구니 삭제
	@ResponseBody
	@GetMapping("deleteCart")
	public String delete(@RequestParam int cart_idx, HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");
		
		int del = service.deleteCart(cart_idx);
		if(del > 0 ) {
			return del+"";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "redirect:/cart/fail_back.jsp";	
		}
	}
	
	// 장바구니 수정
	@ResponseBody
	@GetMapping("updateCart")
	public String update(@ModelAttribute CartVO cart, HttpSession session, Model model,@RequestParam String member_id,@RequestParam int cart_amount,@RequestParam int cart_idx) {
		String sId = (String) session.getAttribute("sId");
		List<CartVO> cartList = service.getCart(member_id); // 장바구니 정보
		System.out.println("cart_amount : "+cartList.get(0).getCart_amount());
		System.out.println("cart_amount : "+cartList.get(0).getCart_idx());
		
		int update = service.modifyCart(cart_amount,cart_idx);
		System.out.println(update+"");
		if(update > 0 ) {
			return update+"";
		} else {
			model.addAttribute("msg", "변경 실패!");
			return "redirect:/cart/fail_back.jsp";
		}
	}
	
	
	
	
	
	
	
}
