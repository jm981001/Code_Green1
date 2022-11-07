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

@Controller
public class AdminController {

	@Autowired
	private AdminService service;

	//------------전체관리자 메인----------------------------
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(Model model,HttpSession session) {  //httpsession 추가 해야함
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin") || sId == "") {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "main/main";
		} else { 
		
		return "admin/index";
		}
	}
	
	//------------메인페이지----------------------------
		@RequestMapping(value = "main", method = RequestMethod.GET)
		public String main() {
			return "main/main";
		}
		
	
	//------------전체관리자 회원관리(전체목록)----------------------------
	@GetMapping(value = "/ad_member_Manage")
	public String ad_member_Manage(Model model, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null || !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			System.out.println("diqdiq");
			return "main/main";
		} else {
		
		List<MemberVO> memberList = service.getMemberList();
		//model 객체에 조회 데이터를 가리키는 변수 memberList 저장
		model.addAttribute("memberList", memberList);
		
//		System.out.println("회원목록" + memberList);
		return "admin/ad_member_Manage"; }
	}
	
	
	//------------전체관리자 회원정보조회----------------------------
	@GetMapping(value = "/ad_member_Detail")
	public String ad_member_Detail(@RequestParam String id, Model model) {
		
		MemberVO member = service.memberInfo(id);
		//조회된 회원 1명의 데이터를 model 객체에 저장 
		model.addAttribute("member", member);
		
//		System.out.println("회원상세정보" + member);
		
		return "admin/ad_member_Detail";
	}
		

	//------------전체관리자 회원관리 수정 폼 요청----------------------------
	@GetMapping(value = "/ad_member_Detail_Update")
	public String ad_member_Detail_UpdateForm(@RequestParam String id, Model model) {
		MemberVO member = service.memberInfo(id);
		//조회된 회원 1명의 데이터를 model 객체에 저장 
		model.addAttribute("member", member);
		System.out.println("어디서 넘어온?");
		
		return "admin/ad_member_Detail_Update" ;
	}
	
	
	//------------전체관리자 회원관리 수정----------------------------
	@PostMapping(value = "/ad_member_Detail_UpdatePro")
	public String ad_member_Detail_Update(@ModelAttribute MemberVO member,
										  @RequestParam String newName, Model model, String id) {
		member = service.memberInfo(id);
		int updateCount = service.modifyMember(member, newName, id);
//		System.out.println(member);
//		System.out.println(newName);
//		System.out.println(member.getMember_id());
		System.out.println("회원정보 수정" + updateCount);
		
		return "redirect:/ad_member_Detail?id=" + member.getMember_id();
	}
	
	

	//------------회원 삭제----------------------------
	@RequestMapping(value = "ad_memberDelete", method = RequestMethod.GET)
	public String ad_memberDelete(@ModelAttribute MemberVO member, String id, Model model) {  //httpsession 추가 해야함
		
		//세션아이디로 관리자(admin)인지 아닌지 판별
		//아니면 추방
		int deleteCount = service.removeMember(id);
		System.out.println(deleteCount);
		
//		if(deleteCount > 0) {
//			return "admin/ad_member_Manage";
//		} else {
//			model.addAttribute("msg", "회원 주방 완료!");
//			return "admin/ad_memberDelete";
//		}
		return "redirect:/ad_member_Manage";
	}
	

//==============================================여기부터는 기업행 열차입니다=====================================================
//==============================================여기부터는 기업행 열차입니다=====================================================

	
	
	
	//------------전체관리자 기업관리----------------------------
	@GetMapping(value = "/ad_Manager_manage")
	public String ad_Manager_manage(Model model) {
		
		List<ManagerVO> managerList = service.getManagerList();
		model.addAttribute("managerList", managerList);
		
//		System.out.println("ad_Manager_manage");
		return "admin/ad_Manager_manage";
	}
	
	
	//------------전체관리자 기업상세정보 조회----------------------------
	@GetMapping(value = "/ad_Manager_detail")
	public String ad_Manager_detail(@RequestParam String id, Model model) {
		
		
		ManagerVO manager = service.getManagerInfo(id);
		System.out.println(manager);
		
		model.addAttribute("manager", manager);
		
		
		return "admin/ad_Manager_detail";
	}
		
	
	//------------전체관리자 기업삭제 조회----------------------------
		@GetMapping(value = "/ad_ManagerDelete")
		public String ad_Manager_remove(@RequestParam String id, Model model) {
			
			
			
			int delectCount = service.removeManager(id);
			System.out.println(delectCount);
			
			
			
			
			return "redirect:/ad_Manager_manage";
		}
	
	
	
	
	
	
	//------------1:1 문의게시판----------------------------
	@RequestMapping(value = "/ad_One_Board", method = RequestMethod.GET)
	public String ad_One_Board() {
		return "admin/ad_One_Board";
	}
	
	
	//------------1:1 문의글 상세정보 조회----------------------------
	@RequestMapping(value = "/ad_One_Board_Detail", method = RequestMethod.GET)
	public String ad_One_Board_Detail() {
		System.out.println("ad_One_Board_Detail");
		return "admin/ad_One_Board_Detail";
	}
	
	
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
