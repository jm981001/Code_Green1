package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_boardVO;
import com.itwillbs.Code_Green.vo.ItemVO;

public interface RecipeMapper {

	// 기업이 올린 상품 조회
	List<ItemVO> selectMyItem(String board_id);
	
	// 레시피 작성(글)
	int insertRecipe(@Param("board") BoardVO board, @Param("use_item_idx") int use_item_idx);

	// 레시피 작성(파일)
	int insertRecipeFile(File_boardVO fileBoard);

	// 레시피 목록(글) 불러오기
	List<BoardVO> selectRecipeFile(@Param("startRow") int startRow, @Param("listLimit") int listLimit, @Param("keyword") String keyword);

	// 레시피 글 목록 갯수 조회
	int selectRecipeCount();
	
	// 레시피 상세보기 원글 불러오기
	BoardVO selectRecipe(int board_idx);
	
	// 레시피 상세보기에서 사용한 상품 불러오기
	ItemVO selectUseItem(int board_idx);

	// 레시피 작성자(브랜드) 관련상품 불러오기
	List<ItemVO> selectRelatedItem(String board_id);
	
	// 레시피 파일 수정
	int updateRecipeFile(File_boardVO fileBoard);

	// 레시피 글 수정
	int updateRecipe(@Param("board") BoardVO board, @Param("use_item_idx") int use_item_idx);

	// 레시피 삭제 전 파일명(file1) 조회  
	String selectRealFile1(int board_idx);

	// 레시피 삭제 전 파일명(file2) 조회  
	String selectRealFile2(int board_idx);

	// 레시피 글 삭제
	int deleteRecipe(int board_idx);

	// 레시피 파일 삭제
	int deleteRecipeFile(int board_idx);

	

	



	

	
	

	

	

	

	// 레시피 목록(사진) 불러오기
//	List<File_boardVO> selectRecipeFileList();
	
	
}
