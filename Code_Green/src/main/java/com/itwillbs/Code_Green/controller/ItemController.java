package com.itwillbs.Code_Green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.Code_Green.service.ItemService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.PageInfo;



@Controller
public class ItemController {

	@Autowired
	private ItemService service;
	
	//------------ 신상품리스트 -------------------------------------------
	@RequestMapping(value = "item_list", method = RequestMethod.GET)
	public String item_list() {
		return "item/item_list";
	}
	
	//------------ 베스트리스트 -------------------------------------------
	@RequestMapping(value = "item_best", method = RequestMethod.GET)
	public String item_best() {
		return "item/item_best";
	}
	
	//------------ 상품 상세 페이지 -------------------------------------------
	@GetMapping(value = "/ItemDetail.bo")
	public String item_detail(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam int item_idx, Model model) {
		
		int listLimit = 5; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 3; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
 
		List<BoardVO> itemList = service.getReview(startRow, listLimit, searchType,item_idx);
 
		int listCount = service.getReviewListCount(searchType);
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		
		// 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		// 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
		// 끝 페이지 번호를 최대 페이지 번호로 교체
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		
		
		service.increaseReadcount(item_idx);
		ItemVO item = service.getItem(item_idx);
		model.addAttribute("item", item);
		model.addAttribute("itemList", itemList);
		return "item/item_detail";
	}
	
	
	//----------- 브랜드별 상품리스트 -------------------------------------------
	@RequestMapping(value = "brand_main", method = RequestMethod.GET)
	public String brand_main() {
		return "item/brand_main";
	}
	
	
	
	
	
	
	
	
}
