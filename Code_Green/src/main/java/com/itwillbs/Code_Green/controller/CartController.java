package com.itwillbs.Code_Green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CartController {
	
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String cart() {
		return "cart/shopping_cart";
	}
	
}
