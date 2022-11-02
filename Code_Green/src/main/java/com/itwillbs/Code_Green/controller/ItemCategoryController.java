package com.itwillbs.Code_Green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ItemCategoryController {
	
	// 유제품 / 음료
	@RequestMapping(value = "category_dairy_drink", method = RequestMethod.GET)
	public String category_dairy_drink() {
		return "item/category_dairy_drink";
	}
	
	// 해산물
	@RequestMapping(value = "category_fish", method = RequestMethod.GET)
	public String category_fish() {
		return "item/category_fish";
	}
	
	// 과일 / 채소
	@RequestMapping(value = "category_fruit_vegi", method = RequestMethod.GET)
	public String category_fruit_vegi() {
		return "item/category_fruit_vegi";
	}
	
	// 냉동 / 간편 식품
	@RequestMapping(value = "category_iced_easy", method = RequestMethod.GET)
	public String category_iced_easy() {
		return "item/category_iced_easy";
	}
	
	// 식물성 단백질
	@RequestMapping(value = "category_protein", method = RequestMethod.GET)
	public String category_protein() {
		return "item/category_protein";
	}
	
	// 특가 상품
	@RequestMapping(value = "category_sale", method = RequestMethod.GET)
	public String category_sale() {
		return "item/category_sale";
	}
	
	// 간식류
	@RequestMapping(value = "category_snack", method = RequestMethod.GET)
	public String category_snack() {
		return "item/category_snack";
	}

	
	
	
	
	
}
