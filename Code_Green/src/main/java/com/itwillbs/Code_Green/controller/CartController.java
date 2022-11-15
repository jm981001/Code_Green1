package com.itwillbs.Code_Green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import com.itwillbs.Code_Green.service.CartService;
import com.itwillbs.Code_Green.vo.CartVO;

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
	
	
	@ResponseBody
	@GetMapping(value = "addCart")
	public String addCart(@ModelAttribute CartVO cart, HttpSession session,
			@RequestParam int member_idx,
			@RequestParam int item_idx) {
		member_idx= 1;
		item_idx= 1;
		cart.setRf_member_idx(member_idx);
		cart.setRf_item_idx(item_idx);
		System.out.println(item_idx);
		List<CartVO> cartList;
		
		
		String sId = (String)session.getAttribute("sId");

		//상품이 이미 담겨있는지 확인
		CartVO checkCart = service.checkCart(cart);

		if(checkCart != null) {
			
		}
		
		
		
		//장바구니 담기
		int insertCartCount = service.insertCart(cart);
		
		if(insertCartCount > 0) {
			System.out.println("장바구니담기 성공!");
		} else {
			System.out.println("장바구니 담기 실패!");
		}
		
		
		return insertCartCount + "";
		
	}

	
	
	
	
	
	
	
	
	
}
