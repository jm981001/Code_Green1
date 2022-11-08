package com.itwillbs.Code_Green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	@GetMapping(value = "/ReviewModify.bo")
	public String brand_main() {
		return "item/review_modify";
	}
	
	
	
	//------------리뷰 삭제-------------------------------------------
	

	
	@GetMapping(value = "/ReviewDelete.bo")
	public String deletePro(@RequestParam String board_idx, Model model, HttpSession session,@RequestParam String item_idx) {
		// Service - removeBoard() 메서드 호출하여 삭제 작업 요청
		// => 파라미터 : BoardVO 객체, 리턴타입 : int(deleteCount)
			int deleteCount = service.removeReview(board_idx);
			model.addAttribute("item_idx", item_idx);
			System.out.println("야야야야양"+item_idx);
			// 삭제 실패 시 "패스워드 틀림!" 메세지 저장 후 fail_back.jsp 페이지로 포워딩
			// 아니면, BoardList.bo 서블릿 요청(페이지번호 전달)
			if(deleteCount > 0) {
				return "redirect:/ItemDetail.bo";
//				return "redirect:/ItemList.bo?";
			}
		return "member/fail_back";
	}	
	
	//------------내 리뷰 리스트 (할...꺼야...?)-------------------------------------------
	


	
	
	
	
	
	
	
}
