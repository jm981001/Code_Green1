package com.itwillbs.Code_Green.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.SellMapper;
import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.CoinVO;

@Service
public class SellService {
	
	@Autowired
	private SellMapper sell_mapper;

	public List<CartVO> selectCart(String member_id) {
		return sell_mapper.selectCart(member_id);
	}

	public CoinVO selectCoin(String member_id) {
		return sell_mapper.selectCoin(member_id);
	}

//	public int insertOrder(String member_id, int orderNum) {
//		return sell_mapper.insertOrder(member_id, orderNum);
//	}


		
	
	
	
	
}
