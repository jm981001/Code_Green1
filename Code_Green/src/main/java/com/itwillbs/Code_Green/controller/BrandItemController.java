package com.itwillbs.Code_Green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.Code_Green.service.BrandItemService;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.ManagerVO;

@Controller
public class BrandItemController {

	
	@Autowired
	private BrandItemService service;
	
	// 브랜드별 메인페이지 화면 
	@GetMapping(value = "/BrandMain.br")
	public String brandMain(Model model) {
		
		List<ManagerVO> brandList = service.selectBrandList();
		model.addAttribute("brandList", brandList);
		
		return "item/brand_main";
	}
	
	
	@PostMapping(value = "/GetBrandItemList.br")
	public String getBrandItemList(@RequestParam(defaultValue = "0") int manager_idx,Model model) {
		
		System.out.println(manager_idx);
		
		List<ItemVO> brandItemList = service.selectBrandItemList(manager_idx);
		List<ManagerVO> brandList = service.selectBrandList();
		ManagerVO brandDetail = service.selectBrandDetail(manager_idx);
		
		model.addAttribute("brandItemList", brandItemList);
		model.addAttribute("brandList", brandList);
		model.addAttribute("brandDetail", brandDetail);
		
		System.out.println(brandItemList);
		return "item/brand_inner";
	}
	
	@PostMapping(value = "/GetWholeItemList.br")
	public String getWholeItemList(Model model) {
		
		List<ItemVO> brandItemList = service.selectBrandItemList(0);
		List<ManagerVO> brandList = service.selectBrandList();
		
		model.addAttribute("brandItemList", brandItemList);
		model.addAttribute("brandList", brandList);
		
		return "item/brand_whole";
	}
	
	// 브랜드 팔로우 유무체크
	@PostMapping(value = "/FollowCheck.br")
	public int brandFollowCheck(@RequestParam int manager_idx,@RequestParam String member_id) {
		
		int status = service.brandFollowCheck(manager_idx,member_id);
		return status;
	}
	
}
