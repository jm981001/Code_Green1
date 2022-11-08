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
import com.itwillbs.Code_Green.vo.ManagerVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.PageInfo;
import com.itwillbs.Code_Green.vo.QnaVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;

	//------------전체관리자 메인----------------------------
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(Model model,HttpSession session) {  //httpsession 추가 해야함

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
		
		int startrow = (pageNum - 1) * listLimit;
		
		
		List<MemberVO> memberList = service.getMemberList(startrow, listLimit, searchType, keyword);
		//model 객체에 조회 데이터를 가리키는 변수 memberList 저장
		
		
		int listCount = service.getBoardListCount(searchType, keyword);
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
//		System.out.println("회원목록" + memberList);
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
//		System.out.println("회원상세정보" + member);
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
		model.addAttribute("msg", "회원정보 수정에 실패했습니다!");
		return "admin/ad_fail_back";
//		return "redirect:/ad_member_Detail?id=" + member.getMember_id();
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
//			return "admin/ad_member_Manage";
			return "redirect:/ad_member_Manage";
		}
			model.addAttribute("msg", "회원 추방 실패!");
			return "admin/ad_fail_back";
//			return "admin/ad_memberDelete";
		
	}
	

//==============================================여기부터는 기업행 열차입니다=====================================================
//==============================================여기부터는 기업행 열차입니다=====================================================

	
	
	
	//------------전체관리자 기업관리----------------------------
	@GetMapping(value = "/ad_Manager_manage")
	public String ad_Manager_manage(Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		List<ManagerVO> managerList = service.getManagerList();
		model.addAttribute("managerList", managerList);
//		System.out.println("ad_Manager_manage");
		return "admin/ad_Manager_manage";
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
		
	
	//------------전체관리자 기업삭제 조회----------------------------
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
			
			model.addAttribute("msg", "기업 삭제에 실패 했습니다!");
			return "admin/ad_fail_back";
		}
	
	
	
//==============================================여기부터는 문의게시판행 열차입니다=====================================================
//==============================================여기부터는 문의게시판행 열차입니다=====================================================
		
	
	
	
	//------------1:1 문의게시판 목록 조회----------------------------
	@RequestMapping(value = "/ad_One_Board", method = RequestMethod.GET)
	public String ad_One_Board(Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "admin/ad_fail_back";
		}
		
		List<QnaVO> OneQnaList = service.getOneQnaBoardList();
		
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
			
			model.addAttribute("msg", "1:1문의글 삭제에 실패 했습니다!");
			return "admin/ad_fail_back";
		}
	
	
	
//==============================================여기부터는 게시판관리행 열차입니다=====================================================
//==============================================여기부터는 게시판관리행 열차입니다=====================================================
	
	
	//------------전체관리자 게시판 관리----------------------------
	@RequestMapping(value = "/ad_Board_Management", method = RequestMethod.GET)
	public String ad_Board_Management() {
		return "admin/ad_Board_Management";
	}	
	
	
	
	//------------전체관리자 게시글 상세조회----------------------------
	@RequestMapping(value = "/ad_Board_Detail", method = RequestMethod.GET)
	public String ad_Board_Detail() {
		return "admin/ad_Board_Detail";
	}
	
	
	//------------전체관리자 신고글 관리----------------------------
	@RequestMapping(value = "/ad_Report_Management", method = RequestMethod.GET)
	public String ad_Report_Management() {
		System.out.println("ad_Report_Management");
		return "admin/ad_Report_Management";
	}
	
	
	//------------전체관리자 신고글 상세조회----------------------------
	@RequestMapping(value = "/ad_Report_Detail", method = RequestMethod.GET)
	public String ad_Report_Detail() {
		return "admin/ad_Report_Detail";
	}		
	
	
	
	
	
	
	
	
}
