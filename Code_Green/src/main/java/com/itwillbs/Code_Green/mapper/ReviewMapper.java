package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.BoardVO;

public interface ReviewMapper {

	//리뷰 등록
	int insertReview(BoardVO board);

	//리뷰 삭제
	int deleteReview(String board_idx);

	//마이페이지 작성글 리스트
	List<BoardVO> selectBoardList(@Param("startRow") int startRow,@Param("listLimit") int listLimit, @Param("member_id") String member_id);

	//마이페이지 작성글 갯수
	int selectItemListCount();

	
}
