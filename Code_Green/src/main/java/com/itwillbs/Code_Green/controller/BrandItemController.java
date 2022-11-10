package com.itwillbs.Code_Green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.Code_Green.service.BrandItemService;

@Controller
public class BrandItemController {

	
	@Autowired
	private BrandItemService service;
	
	// 브랜드별 메인페이지 화면 
	@GetMapping(value = "/BrandMain.mo")
	public String brandMain() {
		
		return "item/brand_main";
	}
	
	
	// 브랜드별 이름 클릭시 브랜드별 상품리스트 출력
	@GetMapping(value = "/BrandItemList.mo")
	public String brandItemList() {
		
		return "";
	}
	
}
