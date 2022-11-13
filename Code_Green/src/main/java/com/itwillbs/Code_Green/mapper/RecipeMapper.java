package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.BoardVO;

public interface RecipeMapper {
	
	//레시피 메인 목록 조회
	List<BoardVO> selectRecipeList(
			@Param("startRow") int startRow, @Param("listLimit") int listLimit,
			@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	// 전체 글 목록 갯수 조회 
	int selectRecipeListCount(
			@Param("searchType") String searchType, @Param("keyword") String keyword);

	// 게시물 조회수 증가
	void updateReadcount(int board_idx);

	// 게시물 상세 정보 조회
	BoardVO selectBoard(int board_idx);
	
}
