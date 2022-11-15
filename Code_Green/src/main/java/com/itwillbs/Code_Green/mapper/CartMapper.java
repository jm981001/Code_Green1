package com.itwillbs.Code_Green.mapper;

import java.util.List;

import com.itwillbs.Code_Green.vo.CartVO;

public interface CartMapper {

	public int insertCart(CartVO cart);

	public int deleteCart(int cart_idx);

	public int updateCart(CartVO cart);

	public List<CartVO> getCart(int rf_member_idx);

	public CartVO checkCart(CartVO cart);

	public List<CartVO> selectCart(String member_id);


	
	
	
}
