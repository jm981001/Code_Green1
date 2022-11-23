package com.itwillbs.Code_Green.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		List<ItemVO> itemList = service.itemList(startRow, listLimit, searchType, keyword);
		int listCount = service.getItemListCount(searchType, keyword);
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
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
				
				int listLimit = 5; // 한 페이지 당 표시할 게시물 목록 갯수 
				int pageListLimit = 3; // 한 페이지 당 표시할 페이지 목록 갯수
				
				// 조회 시작 게시물 번호(행 번호) 계산
				int startRow = (pageNum - 1) * listLimit;
		 
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
				
//				int listCount = 9;
				int listCount = service.getReviewListCount(item_idx);
				
				int maxPage = (int)Math.ceil((double)listCount / listLimit);
				
				// 시작 페이지 번호 계산
				int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
				// 끝 페이지 번호 계산
				int endPage = startPage + pageListLimit - 1;
				System.out.println("maxPage -> " + maxPage);
				System.out.println("startPage -> " + startPage);
				System.out.println("listCount -> " + listCount);
				
				// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
				// 끝 페이지 번호를 최대 페이지 번호로 교체
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
				PageInfo pageInfo = new PageInfo(
						pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
				
				
				
				
				
				
				//-------- qna 페이징처리----------------
				int Qna_listLimit = 5; // 한 페이지 당 표시할 게시물 목록 갯수 
				int Qna_pageListLimit = 3; // 한 페이지 당 표시할 페이지 목록 갯수
				// 조회 시작 게시물 번호(행 번호) 계산
				int Qna_startRow = (Qna_pageNum - 1) * Qna_listLimit;
				int Qna_listCount = service.getQnaListCount(item_idx);
				System.out.println("Qna_listCount" + Qna_listCount);
				int Qna_maxPage = (int)Math.ceil((double)Qna_listCount / Qna_listLimit);
				
				// 시작 페이지 번호 계산
				int Qna_startPage = (Qna_pageNum - 1) / Qna_pageListLimit * Qna_pageListLimit + 1;
				// 끝 페이지 번호 계산
				int Qna_endPage = Qna_startPage + Qna_pageListLimit - 1;
				System.out.println("Qna_maxPage -> " + Qna_maxPage);
				System.out.println("Qna_startPage -> " + Qna_startPage);
				System.out.println("Qna_listCount -> " + Qna_listCount);
				
				// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
				// 끝 페이지 번호를 최대 페이지 번호로 교체
				if(Qna_endPage > Qna_maxPage) {
					Qna_endPage = Qna_maxPage;
				}
				// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
				Qna_PageInfo Qna_pageInfo = new Qna_PageInfo(
						Qna_pageNum, Qna_listLimit, Qna_listCount, Qna_pageListLimit, Qna_maxPage, Qna_startPage, Qna_endPage);
				
				//-------- qna 페이징처리 끝----------------
				
				//상품 문의 리스트
				List<QnaVO> qnaList = service.getQna(Qna_startRow, Qna_listLimit, item_idx);
				
				
				
				
				
				
				
				service.increaseReadcount(item_idx);
				ItemVO item = service.getItem(item_idx);
				model.addAttribute("sort", sort);
				System.out.println("sort"+sort);
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
		
	
	//------------ 베스트리스트 -------------------------------------------
	@GetMapping(value = "/BestItemList.bo")
		public String bestItemList(@RequestParam(defaultValue = "") String searchType, 
				@RequestParam(defaultValue = "") String keyword, 
				@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
			int listLimit = 16; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			int startRow = (pageNum - 1) * listLimit;
			
			List<ItemVO> itemBestList = service.itemBestList(startRow, listLimit, searchType, keyword);
			int listCount = service.getItemBestListCount(searchType, keyword);
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			int endPage = startPage + pageListLimit - 1;
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo pageInfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("itemBestList", itemBestList);
			return "item/item_best_list";
		}
		


	
	
	
	
	
	
}
