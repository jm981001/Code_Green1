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
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.Code_Green.service.CartService;
import com.itwillbs.Code_Green.vo.CartVO;

@Controller
public class CartController {

	@Autowired
	private CartService service;

//	CREATE TABLE CART (
//			CART_IDX INT PRIMARY KEY,
//			RF_ITEM_IDX INT,
//			RF_MEMBER_IDX INT,
//			CART_AMOUNT INT,
//			FOREIGN KEY (RF_ITEM_IDX) REFERENCES ITEM(ITEM_IDX),
//			FOREIGN KEY (RF_MEMBER_IDX) REFERENCES MEMBER(MEMBER_IDX)
//			);

	//  장바구니 추가
	@ResponseBody
	@GetMapping(value = "addCart")
	public String addCart(@ModelAttribute CartVO cart, HttpSession session, int member_idx) {
		String sId = (String) session.getAttribute("sId");
		cart.setRf_member_idx(member_idx);
		// 장바구니에 기존 상품이 있는지 검사
		int count = service.checkCart(cart.getRf_item_idx(), sId);
		if (count == 0) {
			// 없으면 insert
			service.insertCart(cart);
		} else {
			// 있으면 update
			service.updateCart(cart);
		}
		return "redirect:/cart/shopping_cart";// 제품페이지,게시판으로
	}

	//  장바구니 목록
	@GetMapping(value = "cart")
	public String cart(@RequestParam String member_id, HttpSession session, Model model, ModelAndView mav) {
//		Map<String, Object> map = new HashMap<String, Object>();
		session.setAttribute(member_id, "member_id");
//		String member_id = (String) session.getAttribute("member_id"); // session에 저장된 member_id
		List<CartVO> cartList = service.selectCart(member_id); // 장바구니 정보
		
//		int sumMoney = service.sumMoney(member_id); // 장바구니 전체 금액 호출
		// 장바구니 전체 긍액에 따라 배송비 구분
		// 배송료(5만원이상 => 무료, 미만 => 3000원)
//		int fee = sumMoney >= 50000 ? 0 : 3000;

//		map.put("list", cartList);			// 장바구니 정보를 map에 저장
//		map.put("count", cartList.size());	// 장바구니 상품의 유무
//		map.put("sumMoney", sumMoney);		// 장바구니 전체 금액
//		map.put("fee", fee); 				// 배송금액
//		map.put("allSum", sumMoney+fee);	// 주문 상품 전체 금액 
//		mav.setViewName("cart/shopping_cart");	// view(jsp)의 이름 저장
//		mav.addObject("map", map);			// map 변수 저장
		
		model.addAttribute("cartList", cartList);

		return "cart/shopping_cart";
	}

	// 장바구니 삭제
	@GetMapping("deleteCart")
	public String delete(@RequestParam int cart_idx) {
		service.deleteCart(cart_idx);
		return "redirect:/";
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
