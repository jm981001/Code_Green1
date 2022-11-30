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
import com.itwillbs.Code_Green.vo.PageInfo;

@Controller
public class BrandItemController {
	
	@Autowired
	private BrandItemService service;
	
	// 브랜드별 메인페이지 화면 
	@GetMapping(value = "/BrandMain.br")
	public String brandMain(Model model) {
		
		List<ManagerVO> brandList = service.selectBrandList();
		model.addAttribute("brandList", brandList);
		
		return "item/brand_main";
	}
	
	
	// 브랜드별 개별브랜드 선택시 출력
	@GetMapping(value = "/GetBrandItemList.br")
	public String getBrandItemList(@RequestParam(defaultValue = "1") int pageNum, 
									@RequestParam(defaultValue = "0") int manager_idx, Model model) {
		
		// 페이징 처리를 위한 계산 작업
		int listLimit = 15; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// 개별브랜드 아이템리스트 출력
		List<ItemVO> brandItemList = service.selectBrandItemList(manager_idx,startRow,listLimit);
		
		// 전체브랜드 아이템수 카운트
		int listCount = service.getBrandListCount(manager_idx);
		
		// 왼쪽 사이드바 브랜드목록&브랜드별아이템수 출력
		List<ManagerVO> brandList = service.selectBrandList();
		ManagerVO brandDetail = service.selectBrandDetail(manager_idx);
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
		// 끝 페이지 번호를 최대 페이지 번호로 교체
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		
		model.addAttribute("brandItemList", brandItemList);
		model.addAttribute("brandList", brandList);
		model.addAttribute("brandDetail", brandDetail);
		model.addAttribute("pageInfo", pageInfo);
		
		return "item/brand_inner";
	}
	
	
	
	// 브랜드별 전체보기 리스트 출력
	@GetMapping(value = "/GetWholeItemList.br")
	public String getWholeItemList(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		// 페이징 처리를 위한 계산 작업
		int listLimit = 15; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
		
		// 전체 브랜드아이템목록 출력
		List<ItemVO> brandItemList = service.selectBrandItemList(0,startRow,listLimit);
		
		// 전체브랜드 아이템수 카운트
		int listCount = service.getBrandListCount(0);
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		// 만약, 끝 페이지 번호(endPage)가 최대 페이지 번호(maxPage)보다 클 경우 
		// 끝 페이지 번호를 최대 페이지 번호로 교체
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		// 왼쪽 사이드바 브랜드목록&브랜드별아이템수 출력
		List<ManagerVO> brandList = service.selectBrandList();
		
		model.addAttribute("brandItemList", brandItemList);
		model.addAttribute("brandList", brandList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "item/brand_whole";
	}
	
	// 브랜드 팔로우 하트랑 유무체크후 팔로or언팔하기
	@ResponseBody
	@PostMapping(value = "/followBrandCheck.me")
	public int followBrandCheck(@RequestParam("manager_idx") int manager_idx, @RequestParam("member_idx") int member_idx) {
		System.out.println("팔로우브랜드체크 : 매니저는 " + manager_idx + "멤버는 " + member_idx);
		int result = 0;
		
		int status = service.brandFollowCheck(manager_idx,member_idx);
		if(status == 0) {
			// 팔로우 insert
			service.brandGoFollow(manager_idx,member_idx);
			result = 1;
		} else {
			// 언팔로우 delete
			service.brandUnFollow(manager_idx,member_idx);
			result = 2;
		}
		
		return result;
	}
	
	
	
	// 브랜드 팔로우 유무체크
	@ResponseBody
	@PostMapping(value = "/FollowCheck.me")
	public int brandFollowCheck(@RequestParam("manager_idx") int manager_idx, @RequestParam("member_idx") int member_idx) {
		System.out.println("팔로우유무 : 매니저는 " + manager_idx + "멤버는 " + member_idx);
		int status = service.brandFollowCheck(manager_idx,member_idx);
		return status;
	}
	
}
