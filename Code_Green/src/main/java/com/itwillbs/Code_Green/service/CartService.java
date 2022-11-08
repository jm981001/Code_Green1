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

	public int addCart(CartVO cart) {
		return mapper.addCart(cart);
	}

	public int deleteCart(int cart_idx) {
		return mapper.deleteCart(cart_idx);
	}

	public int updateCart(CartVO cart) {
		return mapper.updateCart(cart);
	}

	public List<CartVO> getCart(int rf_member_idx) {
		return mapper.getCart(rf_member_idx);
	}

	public CartVO checkCart(CartVO cart) {
		return mapper.checkCart(cart);
	}
	
	
}
