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
	//물건 장바구니 담기
	public String insertCart(CartVO cart) {
		return mapper.insertCart(cart);
	}
	//장바구니 삭제
	public int deleteCart(int cart_idx) {
		return mapper.deleteCart(cart_idx);
	}
	//장바구니 수정
	public int updateCart(CartVO cart) {
		return mapper.updateCart(cart);
	}
	//장바구니 담겨 있는지 체크 둘중 하나씀
	public CartVO checkCart(CartVO cart) {
		return mapper.checkCart(cart);
	}
	//장바구니 담겨 있는지 체크 둘중 하나씀
	public int checkCart(int rf_item_idx, String sId) {
		return 0;
	}
	//장바구니 조회
	public List<CartVO> selectCart(String member_id) {
		return mapper.selectCart(member_id);
	}
	
	

	
	
}
