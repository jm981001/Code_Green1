package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.CartMapper;
import com.itwillbs.Code_Green.vo.CartVO;

@Service
public class CartService {

	@Autowired
	private CartMapper mapper;
	
	// 1. 장바구니 추가
	public String insertCart(CartVO cart) {
		return mapper.insertCart(cart);
	}
	// 2. 장바구니 목록
	public List<CartVO> selectCart(String member_id) {
		return mapper.selectCart(member_id);
	}
	// 3. 장바구니 삭제
	public int deleteCart(int cart_idx) {
		return mapper.deleteCart(cart_idx);
	}
	// 4. 장바구니 수정
	public int modifyCart(CartVO cart) {
		return mapper.modifyCart(cart);
	}
	// 5. 장바구니 금액 합계
	public int sumMoney(String member_id) {
		return mapper.sumMoney(member_id);
	}
	// 6. 장바구니 상품확인
	public int checkCart(int rf_item_idx, String member_id) {
		return mapper.checkCart(rf_item_idx,member_id);
	}
	// 7. 장바구니 상품수량 변경
	public int updateCart(CartVO cart) {
		return mapper.updateCart(cart);
	}

	
	
}
