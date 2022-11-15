package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.CoinVO;

public interface CoinMapper {

	//적립금 목록
	public List<CoinVO> selectCoinList(@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("member_id")String member_id);

	//적립금 목록 갯수
	public int selectCoinListCount();

	//적립금 총금액
	public List<CoinVO> selectTotalCoin(String member_id);

}
