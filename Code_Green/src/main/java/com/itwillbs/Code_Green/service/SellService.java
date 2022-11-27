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

	// 장바구니 목록 불러오기
	public List<CartVO> getCart(String member_id) {
		return sell_mapper.selectCart(member_id);
	}
	
	// 적립금 목록 불러오기
	public CoinVO getCoin(String member_id) {
		return sell_mapper.selectCoin(member_id);
	}

	// 상품구매 목록
	public List<SellVO> getReviewList(int startRow, int listLimit, String member_id) {
		return sell_mapper.getReviewList(startRow, listLimit, member_id);
	}

	// 상품구매 목록 갯수
	public int getSellListCount() {
		return sell_mapper.selectSellListCount();
	}

	// 마이페이지 리뷰 가능상품 목록
	public List<SellVO> getSellDetailList(String member_id) {
		return sell_mapper.getSellDetailList(member_id);
	}

	// 마이페이지 상품후기작성
	public List<SellVO> getSellReview(String member_id, int sell_idx, int item_idx) {
		return sell_mapper.getSellReview(member_id, sell_idx,item_idx);
	}

	// 주문하기
	public int insertOrder(String member_id, int member_idx, SellVO sell, int sell_total_price) {
		return sell_mapper.insertOrder(member_id, member_idx, sell, sell_total_price);
	}

	// 주문내역 불러오기
	public SellVO getOrderList(int member_idx, int orderList_sellIdx) {
		return sell_mapper.selectOrderList(member_idx, orderList_sellIdx);
	}

	// 주문내역 불러오기 위한 sell_idx 불러오기
	public int getSellIdx(int member_idx) {
		return sell_mapper.selectSellIdx(member_idx);
	}


		
	
	
	
	
}
