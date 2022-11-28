package com.itwillbs.Code_Green.mapper;

import java.util.List;
import java.util.Map;

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

	// 주문하기
	int insertOrder(@Param("member_id")String member_id, @Param("member_idx")int member_idx, @Param("sell")SellVO sell, @Param("sell_total_price")int sell_total_price);

	// 주문내역 불러오기
	SellVO selectOrderList(@Param("member_id")String member_id);
	
//	// 주문내역 불러오기
//	List<SellVO> selectOrderList(@Param("member_id")String member_id);

//	// 주문(sell_detail) 상세에 데이터 넣기
//	int insertOrderDetail(Map<String, Object> map);

//	// 주문내역 불러오기 위한 sell_idx 불러오기
//	int selectSellIdx(int member_idx);


	
	
	
}
