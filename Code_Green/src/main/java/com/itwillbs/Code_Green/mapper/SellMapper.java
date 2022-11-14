package com.itwillbs.Code_Green.mapper;

import java.util.List;

import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.CoinVO;

public interface SellMapper {

	List<CartVO> selectCart(String member_id);

	CoinVO selectCoin(String member_id);

	
	
	
}
