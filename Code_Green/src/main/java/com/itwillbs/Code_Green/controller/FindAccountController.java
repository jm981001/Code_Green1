package com.itwillbs.Code_Green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FindAccountController {
	@RequestMapping(value = "/find_id_form", method = { RequestMethod.GET, RequestMethod.POST })
	public String find_id_form() throws Exception{
		return "member/find_id_form";
	}
}
