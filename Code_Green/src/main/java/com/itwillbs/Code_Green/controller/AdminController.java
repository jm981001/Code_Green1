package com.itwillbs.Code_Green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

	//------------전체관리자 메인----------------------------
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index() {
		return "admin/index";
	}
	
	//------------메인페이지----------------------------
		@RequestMapping(value = "main", method = RequestMethod.GET)
		public String main() {
			return "main/main";
		}
		
	
	//------------전체관리자 회원관리----------------------------
	@RequestMapping(value = "ad_member_Manage", method = RequestMethod.GET)
	public String ad_member_Manage() {
		System.out.println("ad_member_Manage");
		return "admin/ad_member_Manage";
	}
	
	
	//------------전체관리자 회원정보조회----------------------------
	@RequestMapping(value = "ad_member_Detail", method = RequestMethod.GET)
	public String ad_member_Detail() {
		return "admin/ad_member_Detail";
	}
		

	//------------전체관리자 회원관리 수정----------------------------
	@RequestMapping(value = "ad_member_Detail_Update", method = RequestMethod.GET)
	public String ad_member_Detail_Update() {
		return "admin/ad_member_Detail_Update";
	}
	
	
	//------------전체관리자 기업관리----------------------------
	@RequestMapping(value = "ad_Manager_manage", method = RequestMethod.GET)
	public String ad_Manager_manage() {
//		System.out.println("ad_Manager_manage");
		return "admin/ad_Manager_manage";
	}
	
	
	//------------전체관리자 기업상세정보 조회----------------------------
	@RequestMapping(value = "ad_Manager_detail", method = RequestMethod.GET)
	public String ad_Manager_detail() {
		return "admin/ad_Manager_detail";
	}
		
	
	//------------1:1 문의게시판----------------------------
	@RequestMapping(value = "ad_One_Board", method = RequestMethod.GET)
	public String ad_One_Board() {
		return "admin/ad_One_Board";
	}
	
	
	//------------1:1 문의글 상세정보 조회----------------------------
	@RequestMapping(value = "ad_One_Board_Detail", method = RequestMethod.GET)
	public String ad_One_Board_Detail() {
		System.out.println("ad_One_Board_Detail");
		return "admin/ad_One_Board_Detail";
	}
	
	
	//------------전체관리자 게시판 관리----------------------------
	@RequestMapping(value = "ad_Board_Management", method = RequestMethod.GET)
	public String ad_Board_Management() {
		return "admin/ad_Board_Management";
	}	
	
	
	
	//------------전체관리자 게시글 상세조회----------------------------
	@RequestMapping(value = "ad_Board_Detail", method = RequestMethod.GET)
	public String ad_Board_Detail() {
		return "admin/ad_Board_Detail";
	}
	
	
	//------------전체관리자 신고글 관리----------------------------
	@RequestMapping(value = "ad_Report_Management", method = RequestMethod.GET)
	public String ad_Report_Management() {
		System.out.println("ad_Report_Management");
		return "admin/ad_Report_Management";
	}
	
	
	//------------전체관리자 신고글 상세조회----------------------------
	@RequestMapping(value = "ad_Report_Detail", method = RequestMethod.GET)
	public String ad_Report_Detail() {
		return "admin/ad_Report_Detail";
	}	
	
	
	
	
	
	
	
	
	
}
