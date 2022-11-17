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

import com.itwillbs.Code_Green.service.CoinService;
import com.itwillbs.Code_Green.service.ItemService;
import com.itwillbs.Code_Green.service.MemberService;
import com.itwillbs.Code_Green.service.QnaService;
import com.itwillbs.Code_Green.service.ReviewService;
import com.itwillbs.Code_Green.service.SellService;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.CoinVO;
import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.itwillbs.Code_Green.vo.SellVO;


@Controller
public class MypageController {

	@Autowired
	private MemberService Mservice;
	@Autowired
	private ReviewService Rservice;
	@Autowired
	private QnaService Qservice;
	@Autowired
	private ItemService Iservice;
	@Autowired
	private CoinService Cservice;
	@Autowired
	private SellService Sservice;
	
	//------------마이페이지 메인-------------------------------------------
	@GetMapping(value = "/MemberInfo.me")
	public String getMemberInfo(
			@RequestParam String member_id, Model model, HttpSession session) {
		// 세션 아이디 가져와서 sId 변수에 저장
		String sId = (String)session.getAttribute("sId");
		System.out.println(member_id + ", " + sId);
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "member/fail_back";
		} else {
			MemberVO member = Mservice.getMemberInfo(member_id); // 파라미터는 검색할 아이디 전달
			// Model 객체에 "member" 속성명으로 MemberVO 객체 저장
			System.out.println(member);
			model.addAttribute("member", member);
			// member/member_info.jsp 페이지로 이동
			return "member/myPage_main";
		}
	}
	
	//------------마이페이지 찜한상품-------------------------------------------
	@GetMapping(value = "/myPageWishList.my")
	public String myPage_heart(@RequestParam(defaultValue = "1") int pageNum,
			Model model, @RequestParam(defaultValue = "null") String member_id,
			@ModelAttribute ItemVO item, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
//			model.addAttribute("msg", "잘못된 접근입니다");
//			return "member/fail_back";
			return "member/login";
		}
			MemberVO member = Mservice.getMemberInfo(member_id); // 파라미터는 검색할 아이디 전달
			model.addAttribute("member", member);
			
			
			int listLimit = 7; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			int startRow = (pageNum - 1) * listLimit;
			
			//마이페이지 찜한 상품 리스트
			List<ItemVO> WishList = Iservice.wishList(startRow, listLimit, member_id );
			
			//마이페이지 찜한 상품 리스트 갯수
			int listCount = Iservice.getWishListCount(member_id);
			session.setAttribute("listCount", listCount);
			
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
			PageInfo pageInfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("WishList", WishList);
			model.addAttribute("listCount", listCount);
			model.addAttribute("member_id", member_id);
			
			
			return "member/myPage_wishList";
		
	}
	
	//------------마이페이지 찜한상품 삭제-------------------------------------------
	@GetMapping(value = "/deleteWish")
	public String deleteWish(@RequestParam(defaultValue = "1") int pageNum,
			Model model, @RequestParam String member_id,@RequestParam int member_idx,@RequestParam int heart_idx,
			@ModelAttribute ItemVO item, HttpSession session) {
	
		model.addAttribute("member_id", member_id);
		model.addAttribute("member_idx", member_idx);
		model.addAttribute("heart_idx", heart_idx);
		System.out.println(member_id);
		
		String sId = (String)session.getAttribute("sId");
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "member/fail_back";
		}
		
			int deleteCount = Iservice.removeWish(member_idx,heart_idx);
			
			if(deleteCount == 0) {
				model.addAttribute("msg", "위시리스트 삭제 실패");
				return "member/fail_back";
			}

			return "redirect:/myPageWishList.my";

	}
	
	
	//------------마이페이지 팔로우-------------------------------------------
	@RequestMapping(value = "myPage_following", method = RequestMethod.GET)
	public String myPage_fllowing() {
		return "member/myPage_following";
	}
	
	//------------마이페이지 적립금-------------------------------------------
	@GetMapping(value = "/myPageEmoney.my")
	public String myPageEmoney(
			@RequestParam(defaultValue = "1") int pageNum, Model model, 
			@RequestParam String member_id) {

		int listLimit = 10; 
		int pageListLimit = 10; 
		
		int startRow = (pageNum - 1) * listLimit;
		
		//적립금 목록
		List<CoinVO> coinList = Cservice.getCoinList(startRow, listLimit,member_id);
		
		//적립금 목록 갯수
		int listCount = Cservice.getCoinListCount();
		
		//적립금 총금액
		List<CoinVO> TotalCoin = Cservice.getTotalCoin(member_id);
		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		
		model.addAttribute("coinList", coinList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("TotalCoin", TotalCoin);
		model.addAttribute("member_id", member_id);
		
		return "member/myPage_emoney";
	}
	
	
	
	
	
	//------------마이페이지 주문목록-------------------------------------------
	@RequestMapping(value = "myPage_buyListNull", method = RequestMethod.GET)
	public String myPage_buyListNull() {
		return "member/myPage_buyListNull";
	}
	
	//------------마이페이지 구매목록-------------------------------------------
	@RequestMapping(value = "myPage_buyList", method = RequestMethod.GET)
	public String myPage_buyList() {
		return "member/myPage_buyList";
	}
	
	//------------마이페이지 상품후기-------------------------------------------
	@GetMapping(value = "/myPageReview.my")
	public String myPageReview(
			@RequestParam(defaultValue = "1") int pageNum, Model model
			,@RequestParam String member_id) {
		
		int listLimit = 10; 
		int pageListLimit = 10; 
		
		int startRow = (pageNum - 1) * listLimit;
		
		//상품구매 목록
		List<SellVO> sellList = Sservice.getReviewList(startRow, listLimit,member_id);
		
		//상품구매 목록 갯수
		int listCount = Sservice.getSellListCount();
		

		
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
		
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("sellList", sellList);
		model.addAttribute("listCount", listCount);
		model.addAttribute("member_id", member_id);
		
		
		
		return "member/myPage_review";
	}
	
	
	//------------마이페이지 상품상세-------------------------------------------
		@GetMapping(value = "/myPageReview_detail.my")
		public String myPage_review_detail( @RequestParam(defaultValue = "1") int pageNum, Model model
				                           ,@RequestParam String member_id,@RequestParam int sell_idx) {
			
		//상품구매 상세 목록
		List<SellVO> sellDetailList = Sservice.getSellDetailList(member_id, sell_idx);	
			
			
		model.addAttribute("member_id", member_id);
		model.addAttribute("sell_idx", sell_idx);
		model.addAttribute("sellDetailList", sellDetailList);
		return "member/myPage_review_detail";
	}
	
	//------------마이페이지 상품후기 작성-------------------------------------------
	@RequestMapping(value = "myPage_review_Write.my", method = RequestMethod.GET)
	public String myPage_review_Write() {
		return "member/myPage_review_Write";
	}
	
	//------------마이페이지 문의내역-------------------------------------------
	@GetMapping(value = "/myPageQnaDetail.my")
	public String myPageQnaDetail(Model model,HttpSession session) {
		
		String qna_id = (String)session.getAttribute("sId");
		
		List<QnaVO> mantomanList = Qservice.getMantomanList(qna_id);
		
		model.addAttribute("mantomanList", mantomanList);
		return "member/myPage_qnaDetail";
	}
	
	//------------마이페이지 작성글-------------------------------------------
	@GetMapping(value = "/myPageBoard.bo")
	public String myPageBoard(@RequestParam(defaultValue = "1") int pageNum, Model model, @RequestParam String member_id,@ModelAttribute BoardVO board, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		System.out.println(member_id + ", " + sId);
		if(member_id == null || sId == null || member_id.equals("") || (!member_id.equals(sId) && !sId.equals("admin"))) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "member/fail_back";
		} 
			MemberVO member = Mservice.getMemberInfo(member_id); // 파라미터는 검색할 아이디 전달
			// Model 객체에 "member" 속성명으로 MemberVO 객체 저장
			System.out.println(member);
			model.addAttribute("member", member);
			
			int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수 
			int pageListLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			
			// 조회 시작 게시물 번호(행 번호) 계산
			int startRow = (pageNum - 1) * listLimit;
			
			// Service 객체의 getBoardList() 메서드를 호출하여 게시물 목록 조회
			// => 파라미터 : 시작행번호, 페이지 당 목록 갯수
			// => 리턴타입 : List<BoardVO>(boardList)
			List<BoardVO> BoardList = Rservice.boardList(startRow, listLimit, member_id );
			// -------------------------------------------
			// Service 객체의 getBoardListCount() 메서드를 호출하여 전체 게시물 목록 갯수 조회
			// => 파라미터 : 없음, 리턴타입 : int(listCount)
			int listCount = Rservice.getBoardListCount(member_id);

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
			PageInfo pageInfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("BoardList", BoardList);
			model.addAttribute("member_id", member_id);
			model.addAttribute("listCount", listCount);
			
			// member/member_info.jsp 페이지로 이동
			return "member/myPage_board";
		}
		
		
	
	
	//------------마이페이지 개인정보 수정-------------------------------------------
	@RequestMapping(value = "myPage_userInfo", method = RequestMethod.GET)
	public String myPage_userInfo() {
		return "member/myPage_userInfo";
	}
	
	
	
	
	//------------마이페이지 룰렛,,,?-------------------------------------------
	@RequestMapping(value = "roulette", method = RequestMethod.GET)
	public String roulette() {
		return "inc/roulette";
	}
	
	
	
	
	
	
}
