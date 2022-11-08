package com.itwillbs.Code_Green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.Code_Green.service.QnaService;
import com.itwillbs.Code_Green.vo.QnaVO;

@Controller
public class QnaController {
	@Autowired
	private QnaService service;

	//------------상품 문의 작성-------------------------------------------
	@PostMapping(value = "/QnaWritePro.bo")
	public String reviewWritePro(@ModelAttribute QnaVO qna, Model model,int item_idx ) {
		int insertCount = service.registQna(qna);
		model.addAttribute("item_idx", item_idx);
		System.out.println(item_idx);
		if(insertCount > 0) {
			return "redirect:/ItemDetail.bo";
		} else {
			model.addAttribute("msg", "글 쓰기 실패!");
			return "member/fail_back";
		}
		
	}	
	
	//------------상품문의 삭제-------------------------------------------
	@GetMapping(value = "/QnaDelete.bo")
	public String deletePro(@RequestParam String qna_idx, Model model, HttpSession session,@RequestParam String item_idx) {
		// Service - removeBoard() 메서드 호출하여 삭제 작업 요청
		// => 파라미터 : BoardVO 객체, 리턴타입 : int(deleteCount)
			int deleteCount = service.removeQna(qna_idx);
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
	
	
	//------------상품문의 수정-------------------------------------------
	@GetMapping(value = "/QnaModify.bo")
	public String qna_modify(@RequestParam int qna_idx, Model model, String item_idx) {
		QnaVO qna = service.getQna(qna_idx);
		model.addAttribute("qna",qna);
		return "item/qna_modify";
	}	
	@PostMapping(value = "/QnaModifyPro.bo")
	public String modifyPro(@ModelAttribute QnaVO qna, Model model, String item_idx) {
		// Service - modifyBoard() 메서드 호출하여 수정 작업 요청
		// => 파라미터 : BoardVO 객체, 리턴타입 : int(updateCount)
		int updateCount = service.modifyQna(qna);
		model.addAttribute("item_idx", item_idx);
		// 수정 실패 시 "패스워드 틀림!" 메세지 저장 후 fail_back.jsp 페이지로 포워딩
		// 아니면, BoardDetail.bo 서블릿 요청(글번호, 페이지번호 전달)
		if(updateCount == 0) {
			model.addAttribute("msg", "수정 실패!");
			return "member/fail_back";
		}
		
		return "redirect:/ItemDetail.bo" ;
	}
	
	
	
	
}
