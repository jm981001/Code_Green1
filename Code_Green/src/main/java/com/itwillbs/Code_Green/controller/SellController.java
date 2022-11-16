package com.itwillbs.Code_Green.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.Code_Green.service.CartService;
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
	
	//---------------AJAX 글목록------------------------
	@GetMapping(value = "payment")
	public String payment() {
		return "payment/payment";
	}
	
	
	// 결제
	@ResponseBody
	@RequestMapping(value = "paymentJson", method = RequestMethod.GET)
	public void paymentJson(@RequestParam(name="member_id") String member_id, HttpSession session, Model model, HttpServletResponse response) {
		MemberVO memberInfo = member_service.getMemberInfo(member_id);
		// 주문자 기본 정보 불러오기
		model.addAttribute("memberInfo", memberInfo);
		session.setAttribute(member_id, "member_id");
		
		// 장바구니 상품 불러오기
		List<CartVO> cartList = sell_service.selectCart(member_id);
		
		JSONArray jsonArray = new JSONArray();
		
		// 1. List 객체 크기만큼 반복
		for(CartVO cart : cartList) {
			// JSONObject 클래스 인스턴스 생성
			// 파라미터 : VO 객체(getter/setter, 기본 생성자 필요)
			JSONObject jsonObject = new JSONObject(cart);
//			System.out.println(jsonObject);
		
			// 3. JSONArray  객체의 put() 메서드 호출하여 JSONObject 객체 추가
			jsonArray.put(jsonObject);
			
		}
		System.out.println(jsonArray);
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		// 적립금 불러오기
		CoinVO coin = sell_service.selectCoin(member_id);
		model.addAttribute("coin", coin);
		
	}
	

	// 결제 완료
	@RequestMapping(value = "payment_success", method = RequestMethod.POST)
	public String payment_success(SellVO sell, String member_id, int member_idx) {
		
		// 주문
//		HashMap<SellVO, SellVO> hm = new HashMap<SellVO, SellVO>();
//		hm.put(SellController.getSellList(), sell);	
//		
//		for (Map.Entry<SellVO, SellVO> entry : hm.entrySet()) {
//			SellVO key = entry.getKey();
//			SellVO value = entry.getValue();
//		}
//		
		int orderNum = 0;
		
		System.out.println(sell);
		
//		System.out.println(hm);
		
//		int insertCount = sell_service.insertSellList(hm, member_idx, orderNum);
		
//		System.out.println(insertCount);
		// insert - sell 테이블에 데이터 넣기
		
		// select - sell 테이블 데이터 들고와서 payment_success에 뿌리기
		//		  - 주문번호, 주문일 같이 들고와서 뿌리기 
		
		
		return "payment/payment_success";
	}	

}
