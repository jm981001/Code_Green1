package com.itwillbs.Code_Green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
									@RequestParam(defaultValue = "0") int manager_idx, 
									 HttpSession session, Model model) {
		
		int member_idx = 0;
 		if(session.getAttribute("sCode")==null && session.getAttribute("sId")!=null && session.getAttribute("sIdx")!=null) {
			member_idx = (int) session.getAttribute("sIdx");
		}
		int listLimit = 15; 
		int pageListLimit = 10; 
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
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		String followCheckRevertResult = "";
		String heartStatus = "";
		int status = 0;
		if(member_idx != 0) {
			status = service.brandFollowCheck(manager_idx,member_idx);
		}
		if(status>0) {
			followCheckRevertResult = "Unfollow";
			heartStatus ="fheart.png";
		} else {
			followCheckRevertResult = "Follow";
			heartStatus ="eheart.png";
		}
		
		model.addAttribute("brandItemList", brandItemList);
		model.addAttribute("brandList", brandList);
		model.addAttribute("brandDetail", brandDetail);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("followCheckRevertResult", followCheckRevertResult);
		model.addAttribute("heartStatus", heartStatus);
		
		return "item/brand_inner";
	}
	
	
	
	// 브랜드별 전체보기 리스트 출력
	@GetMapping(value = "/GetWholeItemList.br")
	public String getWholeItemList(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
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
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
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
	public String followBrandCheck(@RequestParam("manager_idx") int manager_idx, 
									@RequestParam("member_idx") int member_idx,
									Model model) {
		System.out.println("팔로우브랜드체크 : 매니저는 " + manager_idx + "멤버는 " + member_idx);
		String result = "";
		
		int status = service.brandFollowCheck(manager_idx,member_idx);
		if(status == 0) {
			// 팔로우 insert
			service.brandGoFollow(manager_idx,member_idx);
			result = "1";
		} else {
			// 언팔로우 delete
			service.brandUnFollow(manager_idx,member_idx);
			result = "2";
		}
		
		return result;
	}
	
	
	
	// 브랜드 팔로우 유무체크
	@ResponseBody
	@PostMapping(value = "/FollowCheck.me")
	public String brandFollowCheck(@RequestParam("manager_idx") int manager_idx, @RequestParam("member_idx") int member_idx) {
		
		String result = "";
		int status = service.brandFollowCheck(manager_idx,member_idx);
		System.out.println("팔로우유무 : 매니저는 " + manager_idx + "멤버는 " + member_idx + ", status = " + status);
		if(status>0) {
			result += 1;
		}
		return result;
	}
	
}
