package com.itwillbs.Code_Green.controller;

import java.util.List;

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

import com.itwillbs.Code_Green.service.AdminService;
import com.itwillbs.Code_Green.vo.AdminVO;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.itwillbs.Code_Green.vo.QnaVO;
import com.itwillbs.Code_Green.vo.ReportVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;

	//관리자 로그인
	@PostMapping(value = "/AdminLoginPro.me")
	public String adminloginPro(@ModelAttribute AdminVO admin, Model model, HttpSession session) {
		AdminVO adminResult = service.loginAdmin(admin);
		
		
		if (adminResult == null) {
			model.addAttribute("msg", "관리자 로그인 실패! 힝~");
//			System.out.println(admin.getAdmin_id() + ", " + admin.getAdmin_pass());
			return "member/fail_back";
		} else {
			session.setAttribute("sId", adminResult.getAdmin_id());
			return "redirect:/";
		}

	}
	

	//------------전체관리자 메인----------------------------
		@RequestMapping(value = "index", method = RequestMethod.GET)
		public String index(Model model,HttpSession session) { 

			String sId = (String)session.getAttribute("sId");
			System.out.println("sId= " + sId);
			if(sId == null || !sId.equals("admin") || sId == "") {
				model.addAttribute("msg", " 잘못된 접근입니다!");
				return "admin/ad_fail_back";
			} 
			return "admin/index";
			
		}
		
		//------------메인페이지----------------------------
			@RequestMapping(value = "main", method = RequestMethod.GET)
			public String main() {
				return "main/main";
			}
			
		
		//------------전체관리자 회원관리(전체목록)----------------------------
		@GetMapping(value = "/ad_member_Manage")
		public String ad_member_Manage(Model model, HttpSession session,
										@RequestParam(defaultValue = "1") int pageNum,
										@RequestParam(defaultValue = "") String searchType,
										@RequestParam(defaultValue = "") String keyword) {
			
			String sId = (String)session.getAttribute("sId");
			System.out.println("sId= " + sId);
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			//페이징 처리
			int listLimit = 10;
			int pageListLimit = 10;
			
			int startRow = (pageNum - 1) * listLimit;
			
			
			List<MemberVO> memberList = service.getMemberList(startRow, listLimit, searchType, keyword);
			//model 객체에 조회 데이터를 가리키는 변수 memberList 저장
			
			
			int listCount = service.getBoardListCount(searchType, keyword);
			System.out.println("검색 결과(목록 수)" + listCount);
			// 페이지 계산 작업 수행
			// 전체 페이지 수 계산
			// Math 클래스의 ceil() 메서드를 활용하여 소수점 올림 처리를 통해 전체 페이지 수 계산
			// => listCount / listLimit 를 실수 연산으로 수행하여 소수점까지 계산하고
			//    Math.ceil() 메서드를 통해 올림 처리 후 결과값을 정수로 변환
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			
			//시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			
			//끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo  pageinfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			model.addAttribute("memberList", memberList);
			model.addAttribute("pageInfo", pageinfo);
//			System.out.println("회원목록" + memberList);
			return "admin/ad_member_Manage"; 
			
		}
		
		
		//------------전체관리자 회원정보조회----------------------------
		@GetMapping(value = "/ad_member_Detail")
		public String ad_member_Detail(@RequestParam String id, Model model, HttpSession session) {
			
			String sId = (String)session.getAttribute("sId");
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				
				return "admin/ad_fail_back";
			}
			MemberVO member = service.memberInfo(id);
			//조회된 회원 1명의 데이터를 model 객체에 저장 
			model.addAttribute("member", member);
//			System.out.println("회원상세정보" + member);
			return "admin/ad_member_Detail";
		}
			

		//------------전체관리자 회원관리 수정 폼 요청----------------------------
		@GetMapping(value = "/ad_member_Detail_Update")
		public String ad_member_Detail_UpdateForm(@RequestParam String id, Model model, HttpSession session) {
			String sId = (String)session.getAttribute("sId");
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			MemberVO member = service.memberInfo(id);
			//조회된 회원 1명의 데이터를 model 객체에 저장 
			model.addAttribute("member", member);
			
			return "admin/ad_member_Detail_Update" ;
		}
		
		
		//------------전체관리자 회원관리 수정----------------------------
		@PostMapping(value = "/ad_member_Detail_UpdatePro")
		public String ad_member_Detail_Update(@ModelAttribute MemberVO member,@RequestParam String newName,
												String id, Model model, HttpSession session) {
			String sId = (String)session.getAttribute("sId");
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			member = service.memberInfo(id);
			int updateCount = service.modifyMember(member, newName, id);
			System.out.println("회원정보 수정" + updateCount);
			if(updateCount > 0) {
				return "redirect:/ad_member_Detail?id=" + member.getMember_id();
			}
			model.addAttribute("fail", "회원정보 수정에 실패했습니다!");
			return "admin/ad_fail_back";
//			return "redirect:/ad_member_Detail?id=" + member.getMember_id();
		}
		
		

		//------------회원 삭제----------------------------
		@RequestMapping(value = "ad_memberDelete", method = RequestMethod.GET)
		public String ad_memberDelete(@ModelAttribute MemberVO member,@RequestParam String id,
									  Model model, HttpSession session) {  
			
			String sId = (String)session.getAttribute("sId");
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			int deleteCount = service.removeMember(id);
			System.out.println(deleteCount);
			if(deleteCount > 0) {
				
				return "redirect:/ad_member_Manage";
	
			}
				model.addAttribute("fail", "회원 추방 실패!"); 
				return "admin/ad_fail_back";
//				return "admin/ad_memberDelete";
			
		}
		

	//======================================여기부터는 기업행 열차입니다=====================================================
	//======================================여기부터는 기업행 열차입니다=====================================================

		
		
		
		//------------전체관리자 기업관리(승인완료)----------------------------
		@GetMapping(value = "/ad_Manager_manage")
		public String ad_Manager_manage(Model model, HttpSession session,
				@RequestParam(defaultValue = "1") int pageNum,
				@RequestParam(defaultValue = "") String searchType,
				@RequestParam(defaultValue = "") String keyword) {
			
			String sId = (String)session.getAttribute("sId");
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			//페이징 처리
			int listLimit = 10;
			int pageListLimit = 10;
			
			int startRow = (pageNum - 1) * listLimit;
			
			//기업목록 조회
			List<ManagerVO> managerList = service.getManagerList(startRow, listLimit,
																searchType, keyword);
			
			int listCount = service.getManagerListCount(searchType, keyword);
			System.out.println("검색 결과(목록 수)" + listCount);
			// 페이지 계산 작업 수행
			// 전체 페이지 수 계산
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			
			//시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			
			//끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo  pageinfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			model.addAttribute("managerList", managerList);
			model.addAttribute("pageInfo", pageinfo); 
			System.out.println(managerList);
			return "admin/ad_Manager_manage";
		}
		
		
		//------------전체관리자 기업관리(승인대기)----------------------------
		@GetMapping(value = "/ad_Manager_auth")
		public String ad_ad_Manager_auth(Model model, HttpSession session,
				@RequestParam(defaultValue = "1") int pageNum,
				@RequestParam(defaultValue = "") String searchType,
				@RequestParam(defaultValue = "") String keyword) {
			
			String sId = (String)session.getAttribute("sId");
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			
			//페이징 처리
			int listLimit = 10;
			int pageListLimit = 10;
			
			int startRow = (pageNum - 1) * listLimit;
			
			
			List<ManagerVO> managerAuthList = service.getManagerAuthList(startRow, listLimit,
																		searchType, keyword);
			
			int listCount = service.getAuthListCount(searchType, keyword);
			System.out.println("검색 결과(목록 수)" + listCount);
			// 페이지 계산 작업 수행
			// 전체 페이지 수 계산
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			
			//시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			
			//끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo  pageinfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			
			model.addAttribute("managerAuthList", managerAuthList);
			model.addAttribute("pageInfo", pageinfo);
			System.out.println(managerAuthList);
			return "admin/ad_Manager_auth";
		}

		
		//------------전체관리자 기업상세정보 조회----------------------------
		@GetMapping(value = "/ad_Manager_detail")
		public String ad_Manager_detail(@RequestParam String id, Model model, HttpSession session) {
			
			String sId = (String)session.getAttribute("sId");
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			ManagerVO manager = service.getManagerInfo(id);
			System.out.println(manager);
			model.addAttribute("manager", manager);
			return "admin/ad_Manager_detail";
		}
			
		
		//------------전체관리자 기업삭제----------------------------
			@GetMapping(value = "/ad_ManagerDelete")
			public String ad_Manager_remove(@RequestParam String id, Model model, HttpSession session) {
				
				String sId = (String)session.getAttribute("sId");
				
				if(sId == null || !sId.equals("admin")) {
					model.addAttribute("msg", "잘못된 접근입니다!");
					return "admin/ad_fail_back";
				}
				
				int delectCount = service.removeManager(id);
				
				System.out.println(delectCount);
				
				if(delectCount > 0) {
					return "redirect:/ad_Manager_manage";
				}
				//삭제를 누를 때 manager_adminauth 데이터 받아와서 Y이냐 N이냐에 따라 포워딩 주소를 달라지게
				//if문을 사용해 나눠야 할듯... 일이 많네ㅎ
				model.addAttribute("fail", "기업 삭제에 실패 했습니다!");
				return "admin/ad_fail_back";
			}
		
		
		
	//======================================여기부터는 문의게시판행 열차입니다=====================================================
	//======================================여기부터는 문의게시판행 열차입니다=====================================================
			
		
		
		
		//------------1:1 문의 목록 조회----------------------------
		@RequestMapping(value = "/ad_One_Board", method = RequestMethod.GET)
		public String ad_One_Board(Model model, HttpSession session,
				@RequestParam(defaultValue = "1") int pageNum,
				@RequestParam(defaultValue = "") String searchType,
				@RequestParam(defaultValue = "") String keyword) {
			String sId = (String)session.getAttribute("sId");
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			//페이징 처리
			int listLimit = 10;
			int pageListLimit = 10;
			
			int startRow = (pageNum - 1) * listLimit;
			
			//1:1 문의 목록
			List<QnaVO> OneQnaList = service.getOneQnaBoardList(startRow, listLimit,
																searchType, keyword);
			
			//1:1 문의 갯수
			int listCount = service.getOneListCount(searchType, keyword);
			System.out.println("검색 결과(목록 수)" + listCount);
			// 페이지 계산 작업 수행
			// 전체 페이지 수 계산
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			
			//시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			
			//끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo  pageinfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			
			model.addAttribute("OneQnaList", OneQnaList);
			model.addAttribute("pageInfo", pageinfo);
//			System.out.println("야야야야야" + OneQnaList);
			
				return "admin/ad_One_Board";
		}
		
		
		//------------1:1 문의글 상세정보 조회----------------------------
		@RequestMapping(value = "/ad_One_Board_Detail", method = RequestMethod.GET)
		public String ad_One_Board_Detail(Model model, HttpSession session, String subject, String id) {
			String sId = (String)session.getAttribute("sId");
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			QnaVO oneQnaInfo = service.getOneQnaInfo(subject, id);
			System.out.println("1:1문의 상세 : " + oneQnaInfo);
			model.addAttribute("oneQnaInfo", oneQnaInfo);
			
			
			return "admin/ad_One_Board_Detail";
		}
		
		
		
		//------------1:1게시글 삭제----------------------------
			@GetMapping(value = "/ad_oneQnaDelete")
			public String oneQna_remove(@RequestParam String id, Model model, HttpSession session) {
				
				String sId = (String)session.getAttribute("sId");
				
				if(sId == null || !sId.equals("admin")) {
					model.addAttribute("msg", "잘못된 접근입니다!");
					return "admin/ad_fail_back";
				}
				
				int delectCount = service.removeOneQnaRemove(id);
				System.out.println(delectCount);
				
				if(delectCount > 0) {
					return "redirect:/ad_One_Board";
				}
				
				model.addAttribute("fail", "1:1문의글 삭제에 실패 했습니다!");
				return "admin/ad_fail_back";
			}
		
		
		
	//======================================여기부터는 게시판관리행 열차입니다=====================================================
	//======================================여기부터는 게시판관리행 열차입니다=====================================================
		
		
		
		
		
		//------------관리자 후기 게시판 ----------------------------
		@RequestMapping(value = "/ad_Board_Review", method = RequestMethod.GET)
		public String ad_Board_Review(Model model, HttpSession session,
				@RequestParam(defaultValue = "1") int pageNum,
				@RequestParam(defaultValue = "") String searchType,
				@RequestParam(defaultValue = "") String keyword) {
			
			String sId = (String)session.getAttribute("sId");
			System.out.println("sId= " + sId);
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			//페이징 처리
			int listLimit = 10;
			int pageListLimit = 10;
			
			int startRow = (pageNum - 1) * listLimit;
			
			List<BoardVO> reviewList = service.getReviewList(startRow, listLimit,
															searchType, keyword);
//			System.out.println(reviewList);
			
			int listCount = service.getReviewListCount(searchType, keyword);
			System.out.println("검색 결과(목록 수)" + listCount);
			// 페이지 계산 작업 수행
			// 전체 페이지 수 계산
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			
			//시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			
			//끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo  pageinfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("pageInfo", pageinfo);
			
			return "admin/ad_Board_Review";
		}
			
			
			
			
		//------------관리자 커뮤니티 게시판 관리----------------------------
		@GetMapping(value = "/ad_Board_Management")
		public String ad_Board_Management(Model model, HttpSession session) {
			
			String sId = (String)session.getAttribute("sId");
			System.out.println("sId= " + sId);
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			List<BoardVO> boardList = service.getBoardList();
			model.addAttribute("boardList", boardList);
//			System.out.println(boardList);
			
			return "admin/ad_Board_Management";
		}	
		
		
		
		//------------관리자 게시글 상세조회----------------------------
		@GetMapping(value = "/ad_Board_Detail")
		public String ad_Board_Detail() {
			return "admin/ad_Board_Detail";
		}
		
		
		
		//------------관리자 게시글 삭제----------------------------
		@GetMapping(value = "/ad_BoardRemove")
		public String ad_Board_Remove(Model model ,HttpSession session, int board_idx) {
			
			String sId = (String)session.getAttribute("sId");
			System.out.println("sId= " + sId);
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			int deleteCount = service.removeBoard(board_idx);
			System.out.println("게시글 삭제" + deleteCount);
			if(deleteCount > 0 ) {
				return "redirect:/ad_Board_Management";
				
			}
			
			model.addAttribute("fail", "게시글 삭제에 실패했습니다");
			return "admin/ad_fail_back";
		}
		
		
		
		
		//======================================여기부터는 신고글관리행 열차입니다=====================================================
		//======================================여기부터는 신고글관리행 열차입니다=====================================================
			
		
		
		
		//------------ 신고글 관리(처리대기 목록만 출력)----------------------------
		@GetMapping(value = "/ad_Report_Management")
		public String ad_Report_Management(Model model, HttpSession session,
				@RequestParam(defaultValue = "1") int pageNum,
				@RequestParam(defaultValue = "") String searchType,
				@RequestParam(defaultValue = "") String keyword) {
			
			String sId = (String)session.getAttribute("sId");
			System.out.println("sId= " + sId);
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			//페이징 처리
			int listLimit = 10;
			int pageListLimit = 10;
			
			int startRow = (pageNum - 1) * listLimit;
			
			List<ReportVO> reportList = service.getReportList(startRow, listLimit, searchType, keyword);
			
			
			int listCount = service.getReportListCount(searchType, keyword);
			System.out.println("검색 결과(목록 수)" + listCount);
			// 페이지 계산 작업 수행
			// 전체 페이지 수 계산
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			
			//시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			
			//끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo  pageinfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			
			
			model.addAttribute("reportList", reportList);
			model.addAttribute("pageInfo", pageinfo);
//			System.out.println(reportList);
			return "admin/ad_Report_Management";
		}
		
		
		
		//------------ 신고글 관리(처리완료 목록만 출력)----------------------------
		@GetMapping(value = "/ad_Report_Success")
		public String ad_Report_Success(Model model, HttpSession session,
				@RequestParam(defaultValue = "1") int pageNum,
				@RequestParam(defaultValue = "") String searchType,
				@RequestParam(defaultValue = "") String keyword) {
			
			String sId = (String)session.getAttribute("sId");
			System.out.println("sId= " + sId);
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			//페이징 처리
			int listLimit = 10;
			int pageListLimit = 10;
			
			int startRow = (pageNum - 1) * listLimit;
			
			List<ReportVO> reportSuccessList = service.getReportSuccessList(startRow, listLimit, searchType, keyword);
			
			int listCount = service.getReportSuccessListCount(searchType, keyword);
			System.out.println("검색 결과(목록 수)" + listCount);
			// 페이지 계산 작업 수행
			// 전체 페이지 수 계산
			int maxPage = (int)Math.ceil((double)listCount / listLimit);
			
			//시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
			
			//끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo  pageinfo = new PageInfo(
					pageNum, listLimit, listCount, pageListLimit, maxPage, startPage, endPage);
			
			model.addAttribute("reportSuccessList", reportSuccessList);
			model.addAttribute("pageInfo", pageinfo);
					System.out.println(reportSuccessList);
			return "admin/ad_Report_Success";
		}
	
		
		
		//------------ 신고글 상세조회----------------------------
		@GetMapping(value = "/ad_Report_Detail")
		public String ad_Report_Detail(Model model, HttpSession session, int report_idx) {
			
			String sId = (String)session.getAttribute("sId");
			System.out.println("sId= " + sId);
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
//			List<BoardVO> originBoard = service.getOriginBoard(report_idx); 실패작
//			System.out.println(originBoard);
//			model.addAttribute("originBoard", originBoard);
			
			//신고글 조회(reporter)
			ReportVO reportInfo = service.getReportInfo(report_idx);
//			System.out.println(reportInfo);
			model.addAttribute("reportInfo", reportInfo);
			
			
			//신고된 원본글 조회
			BoardVO originBoard = service.getOriginBoard(report_idx);
//			System.out.println("신고글 상세 : " + originBoard);
			model.addAttribute("originBoard", originBoard);
			
			
			
			return "admin/ad_Report_Detail";
		}		
		
		
		
		//------------ 신고글 삭제----------------------------
		@GetMapping(value = "/ad_ReportRemove")
		public String ad_Report_Remove(Model model, HttpSession session, int report_idx) {
			
			String sId = (String)session.getAttribute("sId");
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			int deleteCount = service.removeReportBoard(report_idx);
			//신고된 원글이 삭제되면 데이터가 사라지므로 목록에 사용X
			//처리완료된 글은 처리완료 게시판으로 이동되게끔 만들기
			
			if(deleteCount > 0) {

				return "redirect:/ad_Report_Management";
			}
			
			model.addAttribute("fail", "신고글 삭제에 실패했습니다");
			return "admin/ad_fail_back";
		}	
		
		
			
		//------------ 신고된 원본글(board) 삭제 및 상태처리----------------------------
		@GetMapping(value = "/ad_RemoveOriginboard")
		public String ad_Report_RemoveOriginboard(
				Model model, HttpSession session,
				int board_idx, ReportVO report) {
			
			System.out.println(board_idx + " ");
			String sId = (String)session.getAttribute("sId");
			System.out.println("sId= " + sId);
			
			if(sId == null || !sId.equals("admin")) {
				model.addAttribute("msg", "잘못된 접근입니다!");
				return "admin/ad_fail_back";
			}
			
			int deleteCount = service.removeBoard(board_idx);
			System.out.println("게시글 삭제" + deleteCount);
			int updateCount = service.changeStatus(board_idx, report);
			System.out.println("처리상태 : " + updateCount);
			//게시글 삭제와 처리상태가 변경되면 포워딩 실행
			if(deleteCount > 0 && updateCount > 0) {
				
				return "redirect:/ad_Report_Management";
			}
			
			model.addAttribute("msg", "게시글 삭제에 실패했습니다");
			return "admin/ad_Report_Management";
		}
			
			
			
			
			
			
			
			
			
			
	
	
	
	
}
