package com.itwillbs.Code_Green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import com.itwillbs.Code_Green.service.CartService;
import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.MemberVO;

@Controller
public class CartController {

	@Autowired
	private CartService service;

	@GetMapping(value = "cart")
	public String cart(@RequestParam String member_id, HttpSession session, Model model) {
		session.setAttribute(member_id, "member_id");

		List<CartVO> cartList = service.selectCart(member_id);

		model.addAttribute("cartList", cartList);

		return "cart/shopping_cart";
	}

//	CREATE TABLE CART (
//			CART_IDX INT PRIMARY KEY,
//			RF_ITEM_IDX INT,
//			RF_MEMBER_IDX INT,
//			CART_AMOUNT INT,
//			FOREIGN KEY (RF_ITEM_IDX) REFERENCES ITEM(ITEM_IDX),
//			FOREIGN KEY (RF_MEMBER_IDX) REFERENCES MEMBER(MEMBER_IDX)
//			);
	
	
	
	// 장바구니 추가
	@ResponseBody
	@GetMapping(value = "addCart")
	public String addCart(@ModelAttribute CartVO cart, HttpSession session,int member_idx) {
		String sId = (String) session.getAttribute("sId");
		cart.setRf_member_idx(member_idx);
		// 장바구니에 기존 상품이 있는지 검사
		int count = service.checkCart(cart.getRf_item_idx(), sId);
		if(count == 0){		
			// 없으면 insert
			service.insertCart(cart);
		} else {
			// 있으면 update
			service.updateCart(cart);
		}
		return "redirect:/shop/cart/list.do";
		
		
		
	}
	
	
	
	
	
	
	
	
}
