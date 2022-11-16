package com.itwillbs.Code_Green.mapper;

import java.util.List;

import com.itwillbs.Code_Green.vo.CartVO;

public interface CartMapper {

	//장바구니 추가
	public String insertCart(CartVO cart);

	public int deleteCart(int cart_idx);

	public int updateCart(CartVO cart);

	public List<CartVO> getCart(int rf_member_idx);

	//물건이 이미 카트에 있는지 확인
	public CartVO checkCart(CartVO cart);

	//장바구니 조회
	public List<CartVO> selectCart(String member_id);


	
	
	
}
