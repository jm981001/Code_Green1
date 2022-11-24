package com.itwillbs.Code_Green.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.itwillbs.Code_Green.service.ItemService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.itwillbs.Code_Green.vo.Qna_PageInfo;



@Controller
public class ItemController {

	@Autowired
	private ItemService service;
	
	//------------ 신상품리스트 -------------------------------------------

	@GetMapping(value = "/ItemList.bo")
	public String itemList(@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
	
		int listLimit = 16; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		int startRow = (pageNum - 1) * listLimit;
		int listCount = service.getItemListCount(searchType, keyword);
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		List<ItemVO> itemList = service.itemList(startRow, listLimit, searchType, keyword);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("itemList", itemList);
		
		return "item/item_list";
	}
	
	
	//------------ 상품 상세 페이지 -------------------------------------------
	@GetMapping(value = "/ItemDetail.bo")
	public String item_detail(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "1") int pageNum,@RequestParam(defaultValue = "1") int Qna_pageNum,
			@RequestParam int item_idx, Model model,@RequestParam String item_category,@RequestParam String manager_brandname,
			@RequestParam(defaultValue = "new") String sort) {
		
		System.out.println("ItemDetail");
		
		//--------상품문의 페이징처리 ---------------------------------------------------------------------------
		int listLimit = 5;  
		int pageListLimit = 3;  
		int startRow = (pageNum - 1) * listLimit;
		int listCount = service.getReviewListCount(item_idx);
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		//--------상품문의 페이징처리 끝---------------------------------------------------------------------------
		
		
		//-------- qna 페이징처리---------------------------------------------------------------------------
		int Qna_listLimit = 5; 
		int Qna_pageListLimit = 3; 
		int Qna_startRow = (Qna_pageNum - 1) * Qna_listLimit;
		int Qna_listCount = service.getQnaListCount(item_idx);
		int Qna_maxPage = (int)Math.ceil((double)Qna_listCount / Qna_listLimit);
		int Qna_startPage = (Qna_pageNum - 1) / Qna_pageListLimit * Qna_pageListLimit + 1;
		int Qna_endPage = Qna_startPage + Qna_pageListLimit - 1;
		
		if(Qna_endPage > Qna_maxPage) {
			Qna_endPage = Qna_maxPage;
		}
		
		Qna_PageInfo Qna_pageInfo = new Qna_PageInfo(
				Qna_pageNum, Qna_listLimit, Qna_listCount, Qna_pageListLimit, Qna_maxPage, Qna_startPage, Qna_endPage);
		
		//-------- qna 페이징처리 끝---------------------------------------------------------------------------
		
		
		//상품 후기 리스트
		List<BoardVO> itemList = service.getReview(startRow, listLimit, searchType,item_idx);
		
		//상품 후기 별점높은순
		List<BoardVO> goodList = service.selectGoodList(startRow, listLimit, item_idx);
		
		//상품 후기 추천 많은순
		List<BoardVO> bestList = service.selectBestList(startRow, listLimit, item_idx);
		
		//상품 후기 별점낮은순
		List<BoardVO> worstList = service.selectWorstList(startRow, listLimit, item_idx);
		
		//상세상세페이지 안 관련상품 5개
		List<ItemVO> itemList6 = service.itemList6(item_category);
		
		//상세상세페이지 같은 브랜드상품 2개
		List<ItemVO> sameBrand = service.sameBrand(manager_brandname);
		
		//상품 문의 리스트
		List<QnaVO> qnaList = service.getQna(Qna_startRow, Qna_listLimit, item_idx);
		
		//상품 조회수 증가
		service.increaseReadcount(item_idx);
		
		//상품 상세정보 조회
		ItemVO item = service.getItem(item_idx);
		
		model.addAttribute("sort", sort);
		model.addAttribute("itemList", itemList);
		model.addAttribute("goodList", goodList);
		model.addAttribute("bestList", bestList);
		model.addAttribute("worstList", worstList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("Qna_pageInfo", Qna_pageInfo);
		model.addAttribute("Qna_listCount", Qna_listCount);
		model.addAttribute("item", item);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("itemList6", itemList6);
		model.addAttribute("sameBrand", sameBrand);
		
		return "item/item_detail";
	}
	
	// ------------ 상품 상세 페이지 Ajax -------------------------------------------
	@ResponseBody
	@GetMapping(value = "/ItemDetailAjax.bo", produces = "text/plain;charset=UTF-8")
	public String item_detailAjax(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "1") int pageNum,@RequestParam(defaultValue = "1") int Qna_pageNum,
			@RequestParam int item_idx, Model model,@RequestParam String item_category,@RequestParam String manager_brandname,
			@RequestParam(defaultValue = "new") String sort) {
		
		//--------상품문의 페이징처리 ---------------------------------------------------------------------------
		int listLimit = 5;  
		int pageListLimit = 3;  
		int startRow = (pageNum - 1) * listLimit;
		int listCount = service.getReviewListCount(item_idx);
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		//--------상품문의 페이징처리 끝---------------------------------------------------------------------------
		
		
		//-------- qna 페이징처리---------------------------------------------------------------------------
		int Qna_listLimit = 5; 
		int Qna_pageListLimit = 3; 
		int Qna_startRow = (Qna_pageNum - 1) * Qna_listLimit;
		int Qna_listCount = service.getQnaListCount(item_idx);
		int Qna_maxPage = (int)Math.ceil((double)Qna_listCount / Qna_listLimit);
		int Qna_startPage = (Qna_pageNum - 1) / Qna_pageListLimit * Qna_pageListLimit + 1;
		int Qna_endPage = Qna_startPage + Qna_pageListLimit - 1;
		
		if(Qna_endPage > Qna_maxPage) {
			Qna_endPage = Qna_maxPage;
		}
		
		Qna_PageInfo Qna_pageInfo = new Qna_PageInfo(
				Qna_pageNum, Qna_listLimit, Qna_listCount, Qna_pageListLimit, Qna_maxPage, Qna_startPage, Qna_endPage);
		
		//-------- qna 페이징처리 끝---------------------------------------------------------------------------
		
		
		//상품 후기 리스트
		List<BoardVO> itemList = service.getReview(startRow, listLimit, searchType,item_idx);
		
		//상품 후기 별점높은순
		List<BoardVO> goodList = service.selectGoodList(startRow, listLimit, item_idx);
		
		//상품 후기 추천 많은순
		List<BoardVO> bestList = service.selectBestList(startRow, listLimit, item_idx);
		
		//상품 후기 별점낮은순
		List<BoardVO> worstList = service.selectWorstList(startRow, listLimit, item_idx);
		
		//상세상세페이지 안 관련상품 5개
		List<ItemVO> itemList6 = service.itemList6(item_category);
		
		//상세상세페이지 같은 브랜드상품 2개
		List<ItemVO> sameBrand = service.sameBrand(manager_brandname);
		
		//상품 문의 리스트
		List<QnaVO> qnaList = service.getQna(Qna_startRow, Qna_listLimit, item_idx);
		
		//상품 조회수 증가
		service.increaseReadcount(item_idx);
		
		//상품 상세정보 조회
		ItemVO item = service.getItem(item_idx);
		
//		model.addAttribute("sort", sort);
		Gson gson = new Gson();
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("itemList", itemList);
		map.put("goodList", goodList);
		map.put("bestList", bestList);
		map.put("worstList", worstList);
		map.put("pageInfo", pageInfo);
		
		
		/*
		model.addAttribute("itemList", itemList);
		model.addAttribute("goodList", goodList);
		model.addAttribute("bestList", bestList);
		model.addAttribute("worstList", worstList);
		model.addAttribute("pageInfo", pageInfo);
		*/
		
//		model.addAttribute("Qna_pageInfo", Qna_pageInfo);
//		model.addAttribute("Qna_listCount", Qna_listCount);
//		model.addAttribute("item", item);
//		model.addAttribute("qnaList", qnaList);
//		model.addAttribute("itemList6", itemList6);
//		model.addAttribute("sameBrand", sameBrand);
		
//		return "item/item_detail";
		return gson.toJson(map);
	}
		
	
	//------------ 베스트리스트 --------------------------------------------------------------------------------------
	@GetMapping(value = "/BestItemList.bo")
		public String bestItemList(@RequestParam(defaultValue = "") String searchType, 
				@RequestParam(defaultValue = "") String keyword, 
				@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
			int listLimit = 16; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			int startRow = (pageNum - 1) * listLimit;
			
			int listCount = service.getItemBestListCount(searchType, keyword);
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			int endPage = startPage + pageListLimit - 1;
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo pageInfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			List<ItemVO> itemBestList = service.itemBestList(startRow, listLimit, searchType, keyword);
			
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("itemBestList", itemBestList);
			
			return "item/item_best_list";
		}
		


	
	
	
	
	
	
}
