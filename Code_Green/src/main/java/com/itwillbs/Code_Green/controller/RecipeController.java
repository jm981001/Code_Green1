package com.itwillbs.Code_Green.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.Code_Green.service.RecipeService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.PageInfo;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService service;

	
	//레시피 메인(리스트)
	@GetMapping(value = "recipe_main")
	public String recipe_main(
			@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
		// -------------------------------------------------------------------
		// 페이징 처리를 위한 계산 작업
		int listLimit = 9; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
	
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// Service 객체의 getRecipeList() 메서드를 호출하여 레시피 목록 조회
		// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
		// => 리턴타입 : List<BoardVO>(RecipeList)
		List<BoardVO> RecipeList = service.recipeList(startRow, listLimit, searchType, keyword);
		
		// Service 객체의 getRecipeListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		int listCount = service.recipeListCount(searchType, keyword);
		
		// 페이지 계산 작업 수행
		// 전체 페이지 수 계산
		// Math 클래스의 ceil() 메서드를 활용하여 소수점 올림 처리를 통해 전체 페이지 수 계산
		// => listCount / listLimit 를 실수 연산으로 수행하여 소수점까지 계산하고
		//    Math.ceil() 메서드를 통해 올림 처리 후 결과값을 정수로 변환
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
		//		System.out.println(pageInfo);
		// --------------------------------------------------------------------------------
		// 게시물 목록(boardList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("RecipeList", RecipeList);
		
		
		return "recipe/recipe_main";
	}
	
	
	
	
	//레시피 상세보기
	@GetMapping(value = "recipe_detail")
	public String recipe_detail(@RequestParam int board_idx,Model model) {
		// service 객체의 increaseReadcount() 메서드 호출하여 게시물 조회 증가
		service.increaseReadcount(board_idx);
		
		// service 객체의 getBoardDetail() 메서드를 호출하여 게시물 상세정보 조회 
		// => 파라미터 : 글번호, 리턴타입 : BoardVO(board)
		BoardVO board = service.recipeDetail(board_idx);
		
		// Model 객체에 BoardVO 객체 추가
		model.addAttribute("board", board);
		
		return "recipe/recipe_detail";
	}
	
	
	
	
	
	
	// 글 쓰기 폼 - POST
	@PostMapping(value = "/recipe_formPro")
	public String writePro(@ModelAttribute BoardVO board, Model model, HttpSession session) {
		int insertCount = service.registRecipe(board);

		if (insertCount > 0) {
			return "redirect:/recipe_main";
		} else {
			model.addAttribute("msg", "글 쓰기 실패!");
			return "member/fail_back";
		}
	}


















}
