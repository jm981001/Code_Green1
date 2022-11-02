package com.itwillbs.Code_Green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PayController {
	
	// 결제
	@RequestMapping(value = "payment", method = RequestMethod.GET)
	public String payment() {
		return "payment/payment";
	}
	
	// 결제 완료(카드)
	@RequestMapping(value = "payment_success_card", method = RequestMethod.GET)
	public String payment_success_card() {
		return "payment/payment_success_card";
	}

	// 결제 완료(무통장)
	@RequestMapping(value = "payment_success_account", method = RequestMethod.GET)
	public String payment_success_account() {
		return "payment/payment_success_account";
	}	

}
