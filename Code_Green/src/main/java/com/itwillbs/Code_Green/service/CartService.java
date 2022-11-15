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
	public int insertCart(CartVO cart) {
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
	//장바구니 데이터 체크
	public CartVO checkCart(CartVO cart) {
		return mapper.checkCart(cart);
	}
	//장바구니 조회
	public List<CartVO> selectCart(String member_id) {
		return mapper.selectCart(member_id);
	}
	

	
	
}
