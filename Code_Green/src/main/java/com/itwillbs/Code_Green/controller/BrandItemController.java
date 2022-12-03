package com.itwillbs.Code_Green.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
									@RequestParam(defaultValue = "") String ordering,
									 HttpSession session, Model model) {
		
		int member_idx = 0;
 		if(session.getAttribute("sCode")==null && session.getAttribute("sId")!=null && session.getAttribute("sIdx")!=null) {
			member_idx = (int) session.getAttribute("sIdx");
		}
		
		// 개별브랜드 아이템리스트 출력
		List<ItemVO> brandItemList = service.selectBrandItemList(manager_idx,ordering);
		
		//개별브랜드 아이템리스트 카운트 
		int listCount = service.selectBrandItemListCount(manager_idx);
		
		int listLimit = 15; // 한 페이지 당 표시할 게시물 목록 갯수 
		int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		int startRow = (pageNum - 1) * listLimit;
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
		ManagerVO brandDetail = service.selectBrandDetail(manager_idx);
		
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
	public String getWholeItemList(@RequestParam(defaultValue = "") String ordering,Model model) {
		
		// 전체 브랜드아이템목록 출력
		List<ItemVO> brandItemList = service.selectBrandItemList(0, ordering);
		
		// 왼쪽 사이드바 브랜드목록&브랜드별아이템수 출력
		List<ManagerVO> brandList = service.selectBrandList();
		
		model.addAttribute("brandItemList", brandItemList);
		model.addAttribute("brandList", brandList);
		
		return "item/brand_whole";
	}
	
	// 브랜드 팔로우 하트랑 유무체크후 팔로or언팔하기
	@ResponseBody
	@PostMapping(value = "/followBrandCheck.me")
	public String followBrandCheck(@RequestParam("manager_idx") int manager_idx, 
									@RequestParam("member_idx") int member_idx,
									Model model) {
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
		if(status>0) {
			result += 1;
		}
		return result;
	}
	
	
	// 멀티체크
//	@ResponseBody
	@GetMapping(value = "/ListListing.br")
	public String listListing(@RequestParam(defaultValue = "") String ordering, 
							@RequestParam String brandsIndex, Model model) {
		
		System.out.println("리스트리스팅 컨트롤러 들어왔음!");
		System.out.println("brandsIndex : " + brandsIndex);
		String[] splitBrands = brandsIndex.split("/");
		
		List<String> brands = new ArrayList<String>();
		
		for(String brandIndex : splitBrands) {
			System.out.println("분리한것들: " + brandIndex);
			brands.add(brandIndex);
			brands.removeIf((str) -> str == null || str.equals(""));
		}
		System.out.println("brand사이즈 : " + brands.size());
		System.out.println("ListListing 분류오더링 : " + ordering);
		
		List<ItemVO> brandItemList = service.selectBrandItemListListing(brands,ordering);
		
		model.addAttribute("brandItemList", brandItemList);
		
		return "item/brand_whole";
		
	}
	
	
	
	
	
	
	
	
	
}
