package com.itwillbs.Code_Green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.Code_Green.service.ItemCategoryService;
import com.itwillbs.Code_Green.vo.ItemVO;

@Controller
public class ItemCategoryController {
	
	@Autowired
	private ItemCategoryService service;
	
	List<ItemVO> itemList;
	
	// 유제품 / 음료
	@RequestMapping(value = "category_dairy_drink", method = RequestMethod.GET)
	public String category_dairy_drink(Model model) {
		
		itemList = service.select_dairy_drink();
		
		model.addAttribute("itemList", itemList);
		
		System.out.println(itemList);
		
		return "item/category_dairy_drink";
	}
	
	// 해산물
	@RequestMapping(value = "category_fish", method = RequestMethod.GET)
	public String category_fish(Model model) {
		
		itemList = service.select_fish();
		
		model.addAttribute("itemList", itemList);
		
		System.out.println(itemList);
		
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
