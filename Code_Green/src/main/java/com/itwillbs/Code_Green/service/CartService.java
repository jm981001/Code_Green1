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
	public int insertCart(CartVO cart) {
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
	public int modifyCart(int cart_amount,int cart_idx) {
		return mapper.modifyCart(cart_amount,cart_idx);
	}
	// 5. 장바구니 금액 합계
	public String sumMoney(int member_idx) {
		return mapper.sumMoney(member_idx);
	}
	// 6. 장바구니 상품수량 변경
	public int updateCart(CartVO cart) {
		return mapper.updateCart(cart);
	}
//	 7. 장바구니 수
	public int cartCount(int member_idx) {
		return mapper.cartCount(member_idx);
	}
	public int getCartCount(int member_idx) {
		return mapper.getCartCount(member_idx);
	}

	
	
}
