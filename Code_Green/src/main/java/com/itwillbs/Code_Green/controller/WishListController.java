package com.itwillbs.Code_Green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.Code_Green.service.WishListService;
import com.itwillbs.Code_Green.vo.WishListVO;

@Controller
public class WishListController {

	@Autowired
	private WishListService service;
	
	
	//------------ 위시리스트 추가-------------------------------------------
	@GetMapping(value = "/WishList.bo")
	public String WishList(@RequestParam(defaultValue = "1") int pageNum, Model model, HttpSession session,@ModelAttribute WishListVO wishList,
			@RequestParam int item_idx, @RequestParam String item_category,@RequestParam String manager_brandname,@RequestParam String member_id ) {
		String sId = (String)session.getAttribute("sId");
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "member/fail_back";
		}
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("member_id", member_id);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("manager_brandname",manager_brandname);
		model.addAttribute("item_category",item_category);
		
		
		
		//위시리스트 있는지 없는지
		int checkWish = service.checkWish(wishList, item_idx, member_id);
		if(checkWish == 0) {
			//위시리스트 추가
			int insertWish = service.insertWish(wishList, item_idx, member_id);
			
			if(insertWish > 0) {
				model.addAttribute("msg", "추천했습니다!!");
			}
			return "member/fail_back";
		}else {
			//위시리스트 삭제
			int deleteCount = service.removeWish(wishList, item_idx, member_id);
			
			if(deleteCount > 0) {
				model.addAttribute("msg", "위시리스트 삭제 완료");
			}
			return "member/fail_back";
		}
		
	}

	// 위시리스트 갯수
	@ResponseBody
	@PostMapping("/WishCount.bo")
	public int WishCount(@RequestParam(defaultValue = "0") int item_idx, Model model ) {
		
		int count = service.WishCount(item_idx);
		model.addAttribute("item_idx", item_idx);
		model.addAttribute("count", count);
		
		return count;
	}
	
	
	
}
