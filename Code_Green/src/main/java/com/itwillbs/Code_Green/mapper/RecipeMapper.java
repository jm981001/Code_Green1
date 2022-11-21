package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_boardVO;

public interface RecipeMapper {

	// 레시피 작성(글)
	int insertRecipeBoard(BoardVO board);

	// 레시피 작성(파일)
	int insertRecipeFile(File_boardVO fileBoard);

	// 레시피 목록(글) 불러오기
	List<BoardVO> selectRecipeFile(@Param("searchType") String searchType, @Param("keyword") String keyword);

	// 레시피 목록(사진) 불러오기
//	List<File_boardVO> selectRecipeFileList();
	
	
}
