package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.RecipeMapper;
import com.itwillbs.Code_Green.vo.BoardVO;
import com.itwillbs.Code_Green.vo.File_boardVO;

@Service
public class RecipeService {
	
	@Autowired
	private RecipeMapper mapper;

	// 레시피 작성(글)
	public int writeRecipeBoard(BoardVO board) {
		return mapper.insertRecipeBoard(board);
	}

	// 레시피 작성(파일)
	public int writeRecipeFile(File_boardVO fileBoard) {
		return mapper.insertRecipeFile(fileBoard);
	}

	// 레시피 목록(글) 불러오기
	public List<BoardVO> getRecipeList(String searchType, String keyword) {
		return mapper.selectRecipeFile(searchType, keyword);
	}

	// 레시피 상세보기 원글 불러오기
	public BoardVO getRecipe(int board_idx) {
		return mapper.selectRecipe(board_idx);
	}

	// 레시피 파일 수정
	public int modifyFile(File_boardVO fileBoard) {
		return mapper.updateFile(fileBoard);
	}

	// 레시피 글 수정
	public int modifyBoard(BoardVO board) {
		return mapper.updateBoard(board);
	}

	// 레시피 목록(사진) 불러오기
//	public List<File_boardVO> getRecipeFileList() {
//		return mapper.selectRecipeFileList();
//	}
	

}
