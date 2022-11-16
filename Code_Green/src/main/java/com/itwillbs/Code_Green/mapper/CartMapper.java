package com.itwillbs.Code_Green.mapper;

import java.util.List;

import com.itwillbs.Code_Green.vo.CartVO;

public interface CartMapper {

	// 1. 장바구니 추가
	public String insertCart(CartVO cart);
	// 2. 장바구니 목록
	public List<CartVO> selectCart(String member_id);
	// 3. 장바구니 삭제
	public int deleteCart(int cart_idx);
	// 4. 장바구니 수정
	public int modifyCart(CartVO cart);
	// 5. 장바구니 금액 합계
	public int sumMoney(String userId);
	// 6. 물건이 이미 카트에 있는지 확인
	public int checkCart(int rf_item_idx, String member_id);
	// 7. 장바구니 상품수량 변경
	public int updateCart(CartVO vo);

	
	
	
}
