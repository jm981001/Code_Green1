package com.itwillbs.Code_Green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.Code_Green.service.CommunityService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.PageInfo;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService service;
	
	
	
	//------------ 어서와 비건은 처음이지 페이지 -------------------------------------------
		@RequestMapping(value = "welcome_vegun", method = RequestMethod.GET)
		public String welcome_vegun() {
			return "community/welcome_vegun";
		}

		
		
		
	//------------ 커뮤니티 메인(커뮤니티 글목록) 페이지 -------------------------------------------
	@GetMapping(value = "/CommunityList.bo")	
	public String list(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum, Model model){
		// -------------------------------------------------------------------
		// 페이징 처리를 위한 계산 작업
		int listLimit = 15; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// Service 객체의 getBoardList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
		// => 리턴타입 : List<BoardVO>(communityList)
		List<BoardVO> communityList = service.getCommunityList(startRow, listLimit, searchType, keyword);
		// -------------------------------------------
		// Service 객체의 getBoardListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
		// => 파라미터 : 없음, 리턴타입 : int(listCount)
		int listCount = service.getCommunityListCount(searchType, keyword);
		
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
//				System.out.println(pageInfo);
		// --------------------------------------------------------------------------------
		// 게시물 목록(boardList) 과 페이징 처리 정보(pageInfo)를 Model 객체에 저장
		model.addAttribute("communityList", communityList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "community/community_main";
	}
	
	
	
	
	//------------ 커뮤니티 글 상세보기 페이지 -------------------------------------------
	@GetMapping(value = "/CommunityDetail.bo")
	public String communityDetail(@RequestParam int board_idx,Model model) {
		// service 객체의 increaseReadcount() 메서드 호출하여 게시물 조회 증가
		service.increaseReadcount(board_idx);
		
		// service 객체의 getBoardDetail() 메서드를 호출하여 게시물 상세정보 조회 
		// => 파라미터 : 글번호, 리턴타입 : BoardVO(board)
		BoardVO cBoard = service.getBoardDetail(board_idx);
		
		// Model 객체에 BoardVO 객체 추가
		model.addAttribute("cBoard", cBoard);
	
		return "community/community_detail";
	}
	
	//------------ 커뮤니티 새글 작성 페이지 -------------------------------------------
	@RequestMapping(value = "/CommunityWrite.bo", method = RequestMethod.GET)
	public String communityWrite() {
		return "community/community_write";
	}
		
	//------------ 커뮤니티 글 수정 페이지------------------------------------------- 
	@RequestMapping(value = "CommunityModify.bo", method = RequestMethod.GET)
	public String communityModify() {
		return "community/community_modify";
	}
	
	//------------ 커뮤니티 글 수정 페이지------------------------------------------- 
	@RequestMapping(value = "/CommunityModifyPro.bo", method = RequestMethod.GET)
	public String communityModifyPro() {
		return "community/community_modify";
	}

	
	
	//------------ 커뮤니티 글 삭제 페이지------------------------------------------- 
	@GetMapping(value = "/CommunityDelete.bo")
	public String communityDelete(@ModelAttribute BoardVO board,@RequestParam int pageNum, Model model) {
		int deleteCount = service.removeBoard(board);
		
		if(deleteCount == 0) {

			model.addAttribute("msg", "글 삭제 실패!<br>다시 확인해주세요");
			return "member/fail_back";
			
		} else {
			
			return "redirect:/CommunityList.bo?pageNum=" + pageNum;
		}
		
	}
		
	
	
		
		
		
		
		
		
}
