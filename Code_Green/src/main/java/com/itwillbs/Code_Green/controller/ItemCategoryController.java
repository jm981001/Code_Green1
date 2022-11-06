package com.itwillbs.Code_Green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.Code_Green.service.ItemCategoryService;
import com.itwillbs.Code_Green.vo.File_ItemVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.PageInfo;

@Controller
public class ItemCategoryController {
	
	@Autowired
	private ItemCategoryService service;
	
	List<ItemVO> itemList;
	int listLimit;
	int pageListLimit;
	int startRow;
	int listCount;
	int maxPage;
	int startPage;
	int endPage;
	List<ItemVO> cheapItemList;
//	int cheapItemListCount;
	
	// 전체 상품
	@RequestMapping(value = "category_all", method = RequestMethod.GET)
	public String category_all(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		listLimit = 16; 
		
		pageListLimit = 10; 

		startRow = (pageNum - 1) * listLimit;
		
		itemList = service.select_all(startRow, listLimit);
		
		listCount = service.selectAllListCount();
		
		maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "item/category_all";
	}
	
	// 유제품 / 음료
	@RequestMapping(value = "category_dairy_drink", method = RequestMethod.GET)
	public String category_dairy_drink(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		listLimit = 16; 
		
		pageListLimit = 10; 

		startRow = (pageNum - 1) * listLimit;

		itemList = service.select_dairy_drink(startRow, listLimit);
		
		listCount = service.selectDairyDrinkListCount();
		
		maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageInfo", pageInfo);
		
		
		// 낮은 가격순
		cheapItemList = service.selectCheapDairyDrinkList(startRow, listLimit);
//		cheapItemListCount = service.selectCheapDairyDrinkListCount();
		System.out.println(cheapItemList);
		
		model.addAttribute("cheapItemList", cheapItemList);
		
		return "item/category_dairy_drink";
	}
	
	// 해산물
	@RequestMapping(value = "category_fish", method = RequestMethod.GET)
	public String category_fish(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		listLimit = 16; 
		
		pageListLimit = 10; 
		
		startRow = (pageNum - 1) * listLimit;
		
		itemList = service.select_fish(startRow, listLimit);
		
		listCount = service.selectFishListCount();
		
		maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "item/category_fish";
	}
	
	// 과일 / 채소
	@RequestMapping(value = "category_fruit_vegi", method = RequestMethod.GET)
	public String category_fruit_vegi(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		listLimit = 16; 
		
		pageListLimit = 10; 
		
		startRow = (pageNum - 1) * listLimit;
		
		itemList = service.select_fruit_vegi(startRow, listLimit);
		
		listCount = service.selectFruitVegiListCount();
		
		maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "item/category_fruit_vegi";
	}
	
	// 냉동 / 간편 식품
	@RequestMapping(value = "category_iced_easy", method = RequestMethod.GET)
	public String category_iced_easy(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		listLimit = 16; 
		
		pageListLimit = 10; 
		
		startRow = (pageNum - 1) * listLimit;
		
		itemList = service.select_iced_easy(startRow, listLimit);
		
		listCount = service.selectIcedEasyListCount();
		
		maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "item/category_iced_easy";
	}
	
	// 특가 상품
	@RequestMapping(value = "category_sale", method = RequestMethod.GET)
	public String category_sale(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		itemList = service.select_sale();
		
		model.addAttribute("itemList", itemList);
		
		return "item/category_sale";
	}
	
	// 간식류
	@RequestMapping(value = "category_snack", method = RequestMethod.GET)
	public String category_snack(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		listLimit = 16; 
		
		pageListLimit = 10; 
		
		startRow = (pageNum - 1) * listLimit;
		
		itemList = service.select_snack(startRow, listLimit);
		
		listCount = service.selectSnackListCount();
		
		maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "item/category_snack";
	}

	
	
	
	
	
}