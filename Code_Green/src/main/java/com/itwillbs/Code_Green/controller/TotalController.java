package com.itwillbs.Code_Green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.itwillbs.Code_Green.service.TotalService;
import com.itwillbs.Code_Green.vo.TotalVO;

@Controller
public class TotalController {

	@Autowired
	private TotalService service;
	
	
	//------------전체관리자 메인----------------------------
	@ResponseBody
	@RequestMapping(value = "/drawChart", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String drawChart(Model model,HttpSession session) { 

		
		
		 
		Gson gson = new Gson();
		
		List<TotalVO> sellChart = service.getChart();
		System.out.println("오늘안에하고싶다 : " + sellChart);
//		model.addAttribute("sellChart", sellChart);
	
		return gson.toJson(sellChart);
		
	}
	
	
	
	
}
