package com.itwillbs.Code_Green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.Code_Green.service.ReviewService;
import com.itwillbs.Code_Green.vo.BoardVO;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	//------------리뷰작성-------------------------------------------
	@PostMapping(value = "/ReviewWritePro.bo")
	public String reviewWritePro(@ModelAttribute BoardVO board, Model model,int item_idx ) {
		int insertCount = service.registReview(board);
		model.addAttribute("item_idx", item_idx);
		System.out.println(item_idx);
		if(insertCount > 0) {
			return "redirect:/ItemDetail.bo";
		} else {
			model.addAttribute("msg", "글 쓰기 실패!");
			return "member/fail_back";
		}
		
	}	
	
	
	
	//------------리뷰 등록 처리-------------------------------------------
	
	
	
	//------------리뷰 수정 (할...꺼야..?)-------------------------------------------
	
	
	
	//------------리뷰 삭제-------------------------------------------
	
	
	
	//------------내 리뷰 리스트 (할...꺼야...?)-------------------------------------------
	


	
	
	
	
	
	
	
}
