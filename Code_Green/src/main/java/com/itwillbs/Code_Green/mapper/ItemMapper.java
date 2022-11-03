package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.ItemVO;

public interface ItemMapper {

	//상품 조회수 증가
	void updateReadcount(int item_idx);

	//상품 상세 정보 조회
	ItemVO selectItem(int item_idx);

	//상품 후기
	List<BoardVO> selectReview(
			@Param("startRow")int startRow, @Param("listLimit")int listLimit, @Param("searchType") String searchType, 
			@Param("item_idx")int item_idx);

	int selectReviewListCount(String searchType);
	
	
	

}
