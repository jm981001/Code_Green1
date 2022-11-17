package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.CartVO;
import com.itwillbs.Code_Green.vo.CoinVO;

public interface SellMapper {

	List<CartVO> selectCart(String member_id);

	CoinVO selectCoin(String member_id);

//	int insertOrder(@Param("member_id") String member_id, @Param("orderNum") int orderNum);

	
	
	
}
