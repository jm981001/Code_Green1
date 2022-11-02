package com.itwillbs.Code_Green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommunityController {
	
	//------------ 어서와 비건은 처음이지 페이지 -------------------------------------------
		@RequestMapping(value = "welcome_vegun", method = RequestMethod.GET)
		public String welcome_vegun() {
			return "community/welcome_vegun";
		}

	//------------ 커뮤니티 메인(커뮤니티 글목록) 페이지 -------------------------------------------
		@RequestMapping(value = "community_main", method = RequestMethod.GET)
		public String community_main() {
			return "community/community_main";
		}
	//------------ 커뮤니티 글 상세보기 페이지 -------------------------------------------
	@RequestMapping(value = "community_detail", method = RequestMethod.GET)
	public String community_detail() {
		return "community/community_detail";
	}
	
	//------------ 커뮤니티 새글 작성 페이지 -------------------------------------------
	@RequestMapping(value = "community_write", method = RequestMethod.GET)
	public String community_write() {
		return "community/community_write";
	}
		
	//------------ 커뮤니티 글 수정 페이지------------------------------------------- 
	@RequestMapping(value = "community_modify", method = RequestMethod.GET)
	public String community_modify() {
		return "community/community_modify";
	}

	//------------ 커뮤니티 글 삭제 페이지------------------------------------------- 
	@RequestMapping(value = "community_delete", method = RequestMethod.GET)
	public String community_delete() {
		return "community/community_delete";
	}
		
		
		
		
		
		
		
}
