package com.itwillbs.Code_Green.service;


import java.util.List;
import java.util.Map;

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
	
	// 상품구매 목록
	public List<SellVO> getReviewList(int startRow, int listLimit, String member_id) {
		return sell_mapper.getReviewList(startRow, listLimit, member_id);
	}

	// 상품구매 목록 갯수
	public int getSellListCount() {
		return sell_mapper.selectSellListCount();
	}
	
	// 주문(sell)에 데이터 넣기
	public int insertOrder(String member_id, int member_idx, SellVO sell, int sell_total_price) {
		return sell_mapper.insertOrder(member_id, member_idx, sell, sell_total_price);
	}
	
	// 주문내역 불러오기
	public SellVO getOrderList(String member_id) {
		return sell_mapper.selectOrderList(member_id);
	}

	// 주문(sell_detail) 상세에 데이터 넣기
//	public int insertOrderDetail(int sell_idx, List<CartVO> cartList) {
//		return sell_mapper.insertOrderDetail(sell_idx, cartList);
//	}
	
//	// 주문내역 불러오기
//	public List<SellVO> getOrderList(String member_id) {
//		return sell_mapper.selectOrderList(member_id);
//	}
	
//	// 주문(sell_detail) 상세에 데이터 넣기
//	public int insertOrderDetail(Map<String, Object> map) {
//		return sell_mapper.insertOrderDetail(map);
//	}


//	// 주문내역 불러오기 위한 sell_idx 불러오기
//	public int getSellIdx(int member_idx) {
//		return sell_mapper.selectSellIdx(member_idx);
//	}


	
	
	
//========================================== 마이페이지 ==================================================================		

	// 마이페이지 리뷰 가능상품 목록
	public List<SellVO> getSellDetailList(String member_id) {
		return sell_mapper.getSellDetailList(member_id);
	}

	// 마이페이지 상품후기작성
	public List<SellVO> getSellReview(String member_id, int sell_idx, int item_idx) {
		return sell_mapper.getSellReview(member_id, sell_idx,item_idx);
	}

	
	// 마이페이지 - 내 주문목록 리스트들 불러오기
	public List<SellVO> getMyBuyList(int startRow, int listLimit, int member_idx, String period) {
		return sell_mapper.selectMyBuyList(startRow, listLimit, member_idx, period);
	}

	// 마이페이지 - 내 주문목록 리스트들 카운트
	public int getMyBuyListCount(int member_idx, String period) {
		return sell_mapper.selectMyBuyListCount(member_idx,period);
	}
	
	// 마이페이지 - 내 주문목록 리스트들 특정날짜범위로 불러오기
	public List<SellVO> getMyBuyListByDate(int startRow, int listLimit, int member_idx, String date1, String date2) {
		return sell_mapper.getMyBuyListByDate(startRow, listLimit, member_idx, date1, date2);
	}

	// 마이페이지 - 내 주문목록 리스트들 특정날짜범위로 불러온거 카운트
	public int getMyBuyListByDateCount(int member_idx, String date1, String date2) {
		return sell_mapper.getMyBuyListByDateCount(member_idx,date1,date2);
	}
		
	
	
}
