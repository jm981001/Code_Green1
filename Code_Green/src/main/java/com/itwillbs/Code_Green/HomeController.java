package com.itwillbs.Code_Green;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.Code_Green.service.ItemService;
import com.itwillbs.Code_Green.vo.ItemVO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private ItemService service;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String itemList(Model model) {
		
		//새롭게 만나는 상품들
		List<ItemVO> mainList1 = service.mainList1();

		//고객님들의 혼자알기 아까운 상품들
		List<ItemVO> mainList2 = service.mainList2();
		
		//내 취향을 잘 아는 상품들
		List<ItemVO> mainList3 = service.mainList3();
		
		model.addAttribute("mainList1", mainList1);
		model.addAttribute("mainList2", mainList2);
		model.addAttribute("mainList3", mainList3);
		return "main/main";
	}
	
}
