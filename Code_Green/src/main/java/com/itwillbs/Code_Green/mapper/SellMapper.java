package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.CoinVO;
import com.itwillbs.Code_Green.vo.SellVO;

public interface SellMapper {

	// 장바구니 목록 불러오기
	List<CartVO> selectCart(String member_id);

	// 적립금 불러오기
	CoinVO selectCoin(String member_id);

	// 상품구매 목록
	List<SellVO> getReviewList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("member_id")String member_id);

	// 상품구매 목록 갯수
	int selectSellListCount();

	// 마이페이지 리뷰 가능상품 목록
	List<SellVO> getSellDetailList(@Param("member_id")String member_id);

	// 마이페이지 상품후기작성
	List<SellVO> getSellReview(@Param("member_id")String member_id, @Param("sell_idx")int sell_idx, @Param("item_idx")int item_idx);

	
	
	
}
