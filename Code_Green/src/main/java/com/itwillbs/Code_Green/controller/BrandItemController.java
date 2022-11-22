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
		
		List<ItemVO> itemList = service.selectAllList();

		model.addAttribute("brandList", brandList);
		model.addAttribute("itemList", itemList);
		
		return "item/brand_main";
	}
	
	
	// 브랜드별 이름 클릭시 브랜드별 상품리스트 출력
	@GetMapping(value = "/BrandItemList.br")
	public String brandItemList(@RequestParam int manager_idx,Model model) {
		
		List<ItemVO> brandPageList = service.selectBrandPageList(manager_idx);
		model.addAttribute("brandPageList", brandPageList);
		
		return "item/brand_main";
	}

	// 브랜드별 이름 클릭시 브랜드별 상품리스트 출력
	@GetMapping(value = "/BrandInner.br")
	public String brandInnerItemList(@RequestParam int manager_idx,Model model) {
		
		List<ItemVO> brandPageList = service.selectBrandPageList(manager_idx);
		model.addAttribute("brandPageList", brandPageList);
		
		return "item/brand_inner";
	}
	
	// 박스에 브랜드별이름들 출력
	@ResponseBody
	@PostMapping(value = "/BrandListBox.br")
	public List<ManagerVO> brandNameList(){
		
		List<ManagerVO> brandList = service.selectBrandList();
		return brandList;
	}
	
	
	
	// 브랜드 팔로우 유무체크
	@PostMapping(value = "/FollowCheck.br")
	public int brandFollowCheck(@RequestParam int manager_idx,@RequestParam String member_id) {
		
		int status = service.brandFollowCheck(manager_idx,member_id);
		return status;
	}
	
}
