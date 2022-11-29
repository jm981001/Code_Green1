package com.itwillbs.Code_Green.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.Code_Green.service.CartService;
import com.itwillbs.Code_Green.service.CoinService;
import com.itwillbs.Code_Green.service.MemberService;
import com.itwillbs.Code_Green.service.SellService;
import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.CoinVO;
import com.itwillbs.Code_Green.vo.MemberVO;
import com.itwillbs.Code_Green.vo.SellVO;

@Controller
public class SellController {
	@Autowired
	private MemberService member_service;
	
	@Autowired
	private SellService sell_service;
	
	@Autowired
	private CartService cart_service;
	
	@Autowired
	private CoinService coin_service;
	
	// 주문하기
	@GetMapping(value = "/payment")
	public String payment(@RequestParam String member_id, HttpSession session, Model model, 
						  @RequestParam int cart_total,@RequestParam int shipping_fee) {
		
		// 주문자 기본 정보 불러오기
		MemberVO memberInfo = member_service.getMemberInfo(member_id);
		model.addAttribute("memberInfo", memberInfo);
		session.setAttribute(member_id, "member_id");
		
		// 장바구니 정보 불러오기
		List<CartVO> cartList = sell_service.getCart(member_id);
		model.addAttribute("cartList", cartList);
		
		// 적립금 불러오기
		CoinVO coin = coin_service.getCoin(member_id);
		model.addAttribute("coin", coin);
		
		model.addAttribute("cart_total", cart_total);
		model.addAttribute("shipping_fee", shipping_fee);
	
		return "payment/payment";
	}
	
	

	// 주문완료
	@PostMapping(value = "payment_success")
	public String payment_success(@RequestParam String member_id, @ModelAttribute SellVO sell, 
								  @RequestParam int member_idx, @RequestParam int sell_total_price,
								  @RequestParam int sell_item_total_price, @RequestParam int shipping_fee,
								  Model model) {
		
		// 장바구니 정보
		List<CartVO> cartList = cart_service.getCart(member_id); 
		
		// 주문(sell)에 데이터 넣기
		int insertCount = sell_service.insertOrder(member_id, member_idx, sell, sell_total_price);

//		System.out.println(cartList.get(1).getRf_item_idx());

		// 주문 상세(sell_detail)에 데이터 넣기
		for(int i = 0; i < cartList.size(); i++) {
			int rf_item_idx = cartList.get(i).getRf_item_idx();
			int sell_amount = cartList.get(i).getCart_amount();
			
			int insertOrderDetailCount = sell_service.insertOrderDetail(rf_item_idx, sell_amount, member_idx);
			
		}
		
		// 주문시 사용한 적립금
		int insertOrderUseCoinCount = coin_service.insert_order_useCoin(sell.getSell_usecoin(),member_idx);
		
		// 주문시 결제 금액의 3% 적립
		int insertOrderCoinAddCount = coin_service.insert_order_addCoin(sell_total_price, member_idx);
		
		// 주문내역 불러오기
		SellVO orderList = sell_service.getOrderList(member_id);
		
		// 주문 상세내역 불러오기
		List<SellVO> orderDetailList = sell_service.getOrderDetailList(orderList.getSell_idx());
		
		model.addAttribute("orderList", orderList);
		
		model.addAttribute("orderDetailList" , orderDetailList);
		
		model.addAttribute("sell_item_total_price", sell_item_total_price);
		
		model.addAttribute("shipping_fee", shipping_fee);
		
		return "payment/payment_success";
	}	
	
	// 결제(카드)
	@PostMapping(value = "payment_success_card")
	public void payment_success_card(@RequestParam int sell_idx) {
		
	int cardOrderModifyCount = sell_service.modifyCardOrder(sell_idx);
		
	}
	
	// 결제완료(카드) 페이지
	@GetMapping(value = "payment_success_card_thanks")
	public String payment_success_card_thanks() {
		return "payment/payment_success_card";
	}
	

}