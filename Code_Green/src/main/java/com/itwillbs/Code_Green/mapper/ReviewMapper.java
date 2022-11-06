package com.itwillbs.Code_Green.mapper;

import com.itwillbs.Code_Green.vo.BoardVO;

public interface ReviewMapper {

	//리뷰 등록
	int insertReview(BoardVO board);

	//리뷰 삭제
	int deleteReview(String board_idx);

	
}
