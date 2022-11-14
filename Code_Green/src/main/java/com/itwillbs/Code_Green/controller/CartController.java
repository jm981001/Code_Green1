package com.itwillbs.Code_Green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.Code_Green.service.CartService;
import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.ItemVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String cart(@RequestParam String member_id, HttpSession session, Model model) {
		session.setAttribute(member_id, "member_id");
		
		List<CartVO> cartList = service.selectCart(member_id);

		model.addAttribute("cartList", cartList);
		
		return "cart/shopping_cart";
	}
	
	
	@GetMapping(value =  "addCart")
	public String addart(@RequestParam String member_id,CartVO cart,ItemVO item, HttpSession session, Model model) {
		session.setAttribute(member_id, "member_id");
		
		
		
		
		
		return "redirect:/";
		
	}
	
	
	
}
