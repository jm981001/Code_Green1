package com.itwillbs.Code_Green.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.SellMapper;
import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.CoinVO;
import com.itwillbs.Code_Green.vo.SellVO;

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

	//상품구매 목록
	public List<SellVO> getReviewList(int startRow, int listLimit, String member_id) {
		return sell_mapper.getReviewList(startRow, listLimit, member_id);
	}

	//상품구매 목록 갯수
	public int getSellListCount() {
		return sell_mapper.selectSellListCount();
	}

	//마이페이지 리뷰 가능상품 목록
	public List<SellVO> getSellDetailList(String member_id) {
		return sell_mapper.getSellDetailList(member_id);
	}

	//마이페이지 상품후기작성
	public List<SellVO> getSellReview(String member_id, int sell_idx, int item_idx) {
		return sell_mapper.getSellReview(member_id, sell_idx,item_idx);
	}


		
	
	
	
	
}
